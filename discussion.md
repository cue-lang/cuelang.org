# Layered config defaults: competing defaults problem and potential solutions

## Problem

When using CUE's directory-based package unification for layered config
(base → environment → region), competing defaults on the same field
produce a non-concrete result instead of the "closer" default winning.

Raised by Jace Tan in
[Slack](https://cuelang.slack.com/archives/C012UU8B72M/p1772986989323289).
Related upstream issues:
- [cue-lang/cue#2159](https://github.com/cue-lang/cue/discussions/2159) — weighted/layered defaults discussion
- [cue-lang/cue#1449](https://github.com/cue-lang/cue/issues/1449) — stripping defaults from structs
- [cue-lang/cue#3751](https://github.com/cue-lang/cue/issues/3751) — defaults redesign

## Use case

A deployment tool (Helm wrapper) sources YAML config from a file
hierarchy and merges in order:

```
values/values.cue                        base (all clusters)
values/production/values.cue             production overrides
values/production/us-east-1/values.cue   region-specific
```

Translating to CUE with `*` defaults:

```cue
// values/values.cue
count: *3 | int
cpu:   *1 | int

// values/production/values.cue
cpu: *2 | int

// values/production/us-east-1/values.cue
count: 6
cpu:   4
```

**us-east-1** works: concrete values override everything → `count:6, cpu:4`.

**us-east-2** (no region file) fails: `(*1 | int) & (*2 | int)` unifies
to `1 | 2 | int` — neither default wins, result is not concrete.

**Expected**: `count:3, cpu:2` (production's default should win over base).

See **jace-repro.txtar** for the full reproduction.

## Solutions explored

### 1. Deepest file only with `#Defaults` (jace-solution1.txtar)

The tooling picks only the deepest `values.cue` for a given target. Each
file imports a shared `#Defaults` definition and overrides fields.

**Drawback**: when adding a new leaf, you must repeat all parent
overrides — no automatic inheritance from intermediate layers.

### 2. Named definitions per variant (jace-solution2.txtar)

All variants are defined centrally as named definitions (`#Production`,
`#ProductionUSEast1`, etc.). Each leaf file references its definition.

**Drawback**: doesn't scale. You need a named definition for every
target, and composition breaks when a child overrides fields that the
parent also sets as defaults.

### 3. Hidden fields with external static defaults (jace-solution3.txtar)

the nurk's approach: avoid `*` defaults entirely. Pass a header struct
(`#h`) containing the fallback values, and reference those as defaults.
The "default set" is selected explicitly per leaf.

**Drawback**: more verbose; requires explicitly threading the header
through every definition. But it works today and sidesteps competing
defaults.

### 4. `@layer` attribute (jace-solution-layer.txtar)

A sketch of a potential CUE language feature. `@layer(N)` at the file
level assigns priority: higher N means that file's defaults win when
competing with lower layers.

```cue
// values/values.cue
@layer(1)
package config
count: *3 | int
cpu:   *1 | int

// values/production/values.cue
@layer(2)
package config
cpu: *2 | int
```

**Status**: internal concept only, not available in cmd/cue today.

**Feedback from thread**:
- Jace noted it resembles override/overlay files and asked whether it
  conflicts with CUE's commutativity principle.
- the nurk liked the idea but wants struct-level granularity, not just
  file-level.

### 5. Weighted defaults in pure CUE (jace-solution-weighted.txtar)

Jace's implementation: a `#WeightedDefaults` helper that uses numeric
string keys as priority levels. `list.Max` picks the highest weight.
Supports `"N!"` for forced values that prevent higher weights from
overriding.

```cue
_cpu: lib.#CPU
_cpu: opts: "0": 1    // base
_cpu: opts: "1": 2    // production
_cpu: opts: "2": 4    // region
cpu: _cpu.value        // → 4
```

**Advantages**: works today in pure CUE, per-field granularity,
extensible weight scheme.

**Drawbacks**: verbose (every field needs a wrapper), stringly-typed
weights, sidesteps CUE's native `*` mechanism entirely.

Jace reported it works well in practice in their codebase, and sees it
as extending the built-in defaults concept: `*` is weight 0, concrete is
weight 1, and explicit weights go from 0 to infinity.

### 6. Shell-based layered eval (Kai Hanssen)

A script that runs `cue eval` from deepest layer upward, chaining
results. Deepest file's values become concrete before unifying with
shallower layers, so deeper defaults naturally win.

**Drawback**: breaks when types are involved; requires key names to line
up across layers. Works around CUE rather than with it.

## Open questions

- Does `@layer` conflict with CUE's commutativity guarantees?
- Should layer priority be file-level or struct-level?
- Could a `strip_defaults` builtin (as mentioned in
  [#1449](https://github.com/cue-lang/cue/issues/1449#issuecomment-1010034806))
  solve this by allowing intermediate layers to strip-then-re-default?
- How does this relate to the broader defaults redesign
  ([#3751](https://github.com/cue-lang/cue/issues/3751))?

## Status

Follow-up discussion planned post-KubeCon (noted 2026-03-09).
