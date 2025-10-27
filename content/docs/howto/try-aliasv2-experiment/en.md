---
title: Trying the "aliasv2" experiment
authors: [jpluscplusm]
toc_hide: true
tags: [language]
---
{{<sidenote text="Requires CUE v0.15.0 or later">}}

CUE v0.15.0-alpha.2 introduced the "aliasv2" experiment, which
replaces alias syntax with a more consistent form.

Enable the experiment on a per-file basis using the
`@experiment(aliasv2)`
attribute.

{{<info>}}
Because this experiment changes the meaning of currently valid CUE code, the
`cue fix --exp=aliasv2`
command should be used to update existing CUE files *before* adding the
`@experiment` attribute.

See [`cue help fix`]({{<relref "docs/reference/command/cue-help-fix" >}})
for more information.
{{</info>}}

## Unified alias syntax

The experiment replaces CUE's current alias syntaxes
with a unified syntax using the `~` operator in one of two forms:

- `F~V` -- the single form creates alias `V` referring to value of `F`
- `F~(K,V)` -- the dual form creates alias `K` referring to the label of `F`
  and alias `V` referring to the value of `F`

The new syntax can be used with fields, pattern constraints, and dynamic fields.
Each of CUE's current alias syntaxes has a direct replacement, as outlined in
[the experiment's proposal](https://github.com/cue-lang/proposal/blob/main/designs/language/4014-aliases-v2.md#comparison-between-current-and-proposed-syntax).
Here are some examples of the new syntax:
<!-- TODO: change link to point to spec, after https://cuelang.org/cl/1222377 lands -->

{{{with code "en" "unified syntax"}}}
#nofmt(file.cue)  # Caused by https://github.com/cue-lang/cue/issues/4123
env PATH=/cues/$CUELANG_CUE_PRERELEASE:$PATH

exec cue export --out yaml
cmp stdout out
-- file.cue --
@experiment(aliasv2)
package example

A: B: 42
// A field alias (f) refers to a field.
A~f: C: f.B + 1
// It's available in the same scope as the field.
D: f.B + 2

E: someFoo: G: 138.1
E: justBar: G: 138.2
// Pattern constraint aliases make a field (f) and
// its label (l) available within the scope of the
// field's value. Either identifier may be
// replaced with "_" to skip binding that alias.
E: [string]~(l,f): {
	H:  f.G + 1
	Id: l
}

// The single form should be preferred when access
// to the field's label is not required.
E: [string]~f: {
	J: f.G + 2
}
-- out --
A:
  B: 42
  C: 43
D: 44
E:
  someFoo:
    G: 138.1
    H: 139.1
    Id: someFoo
    J: 140.1
  justBar:
    G: 138.2
    H: 139.2
    Id: justBar
    J: 140.2
{{{end}}}

## The `self` identifier

The experiment defines the `self` indentifier, which refers to
the innermost CUE block that contains it:

{{{with code "en" "self"}}}
#nofmt(file.cue)  # Caused by https://github.com/cue-lang/cue/issues/4123
env PATH=/cues/$CUELANG_CUE_PRERELEASE:$PATH

exec cue export --out yaml
cmp stdout out
-- file.cue --
@experiment(aliasv2)
package example

A: B: 42
// Using a let declaration with the self identifier
// refers to the containing field's value directly.
A: {
	let x = self
	C: x.B + 1
}

"-not-a-valid-identifier": 138
// Binding an identifier to the top level of the
// file grants access to top-level fields that
// would otherwise be shadowed, or where their
// names are not valid identifiers.
let root = self
D: E: root["-not-a-valid-identifier"] + 1

// The self identifier can bind to a list value.
G: [42, self[0] * 2]
-- out --
A:
  B: 42
  C: 43
-not-a-valid-identifier: 138
D:
  E: 139
G:
  - 42
  - 84
{{{end}}}

## Conclusion

Combining the `~` operator with the `self` identifier, the "aliasv2" experiment
replaces all of CUE's different alias forms with a unified and consistent
syntax. Each of their specific replacements are outlined in
[the experiment's proposal](https://github.com/cue-lang/proposal/blob/main/designs/language/4014-aliases-v2.md#comparison-between-current-and-proposed-syntax).
Use `cue fix --exp=aliasv2` to apply the replacements to existing CUE automatically.
<!-- TODO: change link to point to spec, after https://cuelang.org/cl/1222377 lands -->

As with all CUE language experiments, one of this experiment's aims is to
gather feedback from users. Please do join [the CUE community](/community/)
and tell us about your experience with the experiment!

## Related content

- {{< linkto/related/reference "command/cue-help-experiments" >}} --
  a list of the language experiments that can be enabled or disabled
- {{< linkto/related/reference "command/cue-help-fix" >}} --
  update CUE code automatically, applying the latest fixes and language experiments
- [Comparison between current and proposed syntax](https://github.com/cue-lang/proposal/blob/main/designs/language/4014-aliases-v2.md#comparison-between-current-and-proposed-syntax) --
  each of CUE's alias forms expressed as its experimental equivalent <!-- TODO: replace with cuelang.org doc -->
