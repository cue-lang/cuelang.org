---
title: Trying the "aliasv2" experiment
authors: [jpluscplusm,rogpeppe]
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
Because this experiment changes the meaning of currently valid CUE code, the command
`cue fix --exp=aliasv2`
should be used to update existing CUE files *before* adding the `@experiment` attribute.

See [`cue help fix`]({{<relref "docs/reference/command/cue-help-fix" >}})
for more information.
{{</info>}}

The experiment replaces CUE's current alias syntaxes
with a unified syntax using the `~` operator in one of two forms,
and defines the `self` indentifier:

- `F~V` -- the single form creates alias `V` referring to value of `F`
- `F~(K,V)` -- the dual form creates alias `K` referring to the label of `F`
  and alias `V` referring to the value of `F`
- `self` -- refers to the innermost CUE block that contains the identifier

The new syntax can be used with fields, pattern constraints, and dynamic fields.
Each of CUE's current alias syntaxes has a direct replacement, as outlined in
[the experiment's proposal](https://github.com/cue-lang/proposal/blob/main/designs/language/4014-aliases-v2.md#comparison-between-current-and-proposed-syntax).
<!-- TODO: change link to point to spec, after https://cuelang.org/cl/1222377 lands -->

Here are some examples of aliases using the current syntax, and their
experimental syntax as rewritten by `cue fix`:

{{<columns>}}
{{< code-tabs >}}
{{< code-tab name="current-syntax.cue" language="cue" area="top-left" >}}
// Refer to a field whose name is
// not a valid identifier.
A="-foo": 42
b:        A + 1

// Refer to a field's label.
c: [L=string]: {
	id: L
}
c: foo: n: 44

// Refer to a field's value.
_d: V={
	e: V.g + 1
}
d: _d & {
	g: 45
}

// Refer to a field inside a pattern constraint.
h: PCF=[string]: {
	i: PCF.j + 1
}
h: foo: j: 47

// Refer to a value inside a pattern constraint.
k: [string]: PCF={
	m: PCF.p + 1
}
k: foo: p: 49
{{< /code-tab >}}{{< /code-tabs >}}
{{<columns-separator>}}

{{< code-tabs >}}
{{< code-tab name="experimental-syntax.cue" language="cue" area="top-left" >}}
@experiment(aliasv2)

// Refer to a field whose name is
// not a valid identifier.
"-foo"~A: 42
b:        A + 1

// Refer to a field's label.
c: [string]~(L,_): {
	id: L
}
c: foo: n: 44

// Refer to a field's value.
_d: {
	let V = self
	e: V.g + 1
}
d: _d & {
	g: 45
}

// Refer to a field inside a pattern constraint.
h: [string]~PCF: {
	i: PCF.j + 1
}
h: foo: j: 47

// Refer to a value inside a pattern constraint.
k: [string]: {
	let PCF = self
	m: PCF.p + 1
}
k: foo: p: 49
{{< /code-tab >}}{{< /code-tabs >}}

{{</columns>}}

Because we used `cue fix` to convert `current-syntax.cue` to `experimental-syntax.cue`,
we can be sure that these examples still define the same concrete data:

{{<columns>}}
````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCBjdXJyZW50LXN5bnRheC5jdWUgLS1vdXQgeWFtbA==" }
$ cue export current-syntax.cue --out yaml
-foo: 42
b: 43
c:
  foo:
    id: foo
    "n": 44
d:
  e: 46
  g: 45
h:
  foo:
    i: 48
    j: 47
k:
  foo:
    m: 50
    p: 49
````
{{<columns-separator>}}
````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCBjdXJyZW50LXN5bnRheC5jdWUgLS1vdXQgeWFtbA==" }
$ cue export current-syntax.cue --out yaml
-foo: 42
b: 43
c:
  foo:
    id: foo
    "n": 44
d:
  e: 46
  g: 45
h:
  foo:
    i: 48
    j: 47
k:
  foo:
    m: 50
    p: 49
````
{{</columns>}}

The experimental syntax makes some aliasing scenarios possible for the first
time, as the current syntax does not provide a direct equivalent:

{{< code-tabs >}}
{{< code-tab name="experimental-syntax.cue" language="cue" area="top-left" >}}
@experiment(aliasv2)

// Pattern constraint aliases make a field (F) and
// its label (L) available within the scope of the
// field's value.
a: [string]~(L,F): {
	b:  F.c + 1
	id: L
}
a: foo: c: 42

"-foo": 44

// The self identifier grants access to top-level
// fields whose names are not valid identifiers.
d: self["-foo"] + 1

// Binding an identifier to the top level of the
// file grants access to top-level fields that
// would be shadowed, or whose names are not valid
// identifiers.
let Root = self
e: {
	g:      Root["-foo"] + 2
	"-foo": "not 44"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBleHBlcmltZW50YWwtc3ludGF4LmN1ZSAtLW91dCB5YW1s" >}}
$ cue export experimental-syntax.cue --out yaml
a:
  foo:
    b: 43
    id: foo
    c: 42
-foo: 44
d: 45
e:
  g: 46
  -foo: not 44
{{< /code-tab >}}
{{< /code-tabs >}}

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
