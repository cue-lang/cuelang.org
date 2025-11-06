---
title: Trying the "aliasv2" experiment
authors: [jpluscplusm,rogpeppe]
toc_hide: true
tags: [language]
---
{{<sidenote text="Requires CUE v0.15.0 or later">}}

{{{with _script_ "en" "cmd/cue prerelease"}}}
export PATH=/cues/$CUELANG_CUE_PRERELEASE:$PATH
{{{end}}}

CUE v0.15.0-alpha.2 introduced the "aliasv2" experiment, which
replaces alias syntax with a more consistent form.

{{<warning>}}
This experiment changes the meaning of currently valid CUE code.
Once your module targets language version v0.15.0 or later, use
`cue fix --exp=aliasv2`
to update its code and enable the experiment on a per-file basis.
See
[`cue help fix`]({{<relref "docs/reference/command/cue-help-fix" >}})
and
[`cue mod edit --language-version`]({{<relref "docs/reference/command/cue-help-mod-edit" >}})
for more information.
{{</warning>}}

The experiment replaces CUE's current alias syntaxes
with a unified syntax using the `~` operator in one of two forms,
and defines the `self` indentifier:

- `X~V` -- the single form creates alias `V` referring to the value of `X`
- `X~(L,V)` -- the dual form creates alias `L` referring to the label of `X`
  and alias `V` referring to the value of `X`
- `self` -- refers to the innermost CUE block that contains the identifier

The new syntax can be used with fields, pattern constraints, and dynamic fields.
Each of CUE's current alias syntaxes has a direct replacement, as outlined in
[the experiment's proposal](https://github.com/cue-lang/proposal/blob/main/designs/language/4014-aliases-v2.md#summary-of-equivalent-forms).
<!-- TODO: change link to point to spec, after https://cuelang.org/cl/1222377 lands -->

Here are some examples of aliases using the current syntax, and their
experimental syntax as rewritten by `cue fix`:

{{<columns>}}
{{{with upload "en" "1 old"}}}
-- current-syntax.cue --
// Refer to a field whose name is
// not a valid identifier.
A="-foo": 42
b:        A + 1

// Refer to a field's label.
c: [L=string]: {
	id: L
}
c: foo: _

// Refer to a field's value.
_d: V={
	e: V.g + 1
}
d: _d & {
	g: 44
}

// Refer to a field inside a pattern constraint.
h: PCF=[string]: {
	i: PCF.j + 1
}
h: foo: j: 46

// Refer to a value inside a pattern constraint.
k: [string]: PCV={
	m: PCV.p + 1
}
k: foo: p: 48
{{{end}}}

{{{with _script_ "en" "1"}}}
cp current-syntax.cue experimental-syntax.cue
cue fix --exp=aliasv2 experimental-syntax.cue
{{{end}}}

{{<columns-separator>}}

{{{with upload "en" "1 new"}}}
# Required by https://cuelang.org/issue/4123, but is safe because the file is
# emitted by cue-fix processing a cue-fmt'd source.
#nofmt(experimental-syntax.cue)
#assert
-- experimental-syntax.cue --
@experiment(aliasv2)

// Refer to a field whose name is
// not a valid identifier.
"-foo"~A: 42
b:        A + 1

// Refer to a field's label.
c: [string]~(L,_): {
	id: L
}
c: foo: _

// Refer to a field's value.
_d: {
	let V = self
	e: V.g + 1
}
d: _d & {
	g: 44
}

// Refer to a field inside a pattern constraint.
h: [string]~PCF: {
	i: PCF.j + 1
}
h: foo: j: 46

// Refer to a value inside a pattern constraint.
k: [string]: {
	let PCV = self
	m: PCV.p + 1
}
k: foo: p: 48
{{{end}}}

{{</columns>}}

Because we used `cue fix` to rewrite `current-syntax.cue` as `experimental-syntax.cue`,
we can be sure that these examples still define the same concrete data:

{{<columns>}}
{{{with script "en" "1 export current"}}}
cue export current-syntax.cue --out yaml
{{{end}}}
{{<columns-separator>}}
{{{with script "en" "1 export experimental"}}}
cue export experimental-syntax.cue --out yaml
{{{end}}}
{{</columns>}}

The experimental syntax makes some aliasing scenarios possible for the first
time, where the current syntax does not provide a direct equivalent:

{{{with code "en" "2 new"}}}
#nofmt(experimental-syntax.cue)  # Caused by https://github.com/cue-lang/cue/issues/4123
env PATH=/cues/$CUELANG_CUE_PRERELEASE:$PATH

exec cue export experimental-syntax.cue --out yaml
cmp stdout out
-- experimental-syntax.cue --
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
	"-foo": "not-44"
}
-- out --
a:
  foo:
    b: 43
    id: foo
    c: 42
-foo: 44
d: 45
e:
  g: 46
  -foo: not-44
{{{end}}}

## Conclusion

Combining the `~` operator with the `self` identifier, the "aliasv2" experiment
replaces all of CUE's different alias forms with a unified and consistent
syntax. Each of their specific replacements are outlined in
[the experiment's proposal](https://github.com/cue-lang/proposal/blob/main/designs/language/4014-aliases-v2.md#summary-of-equivalent-forms).
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
- {{< linkto/related/reference "command/cue-help-mod-edit" >}} --
  update the language version targeted by a module
- [Equivalent current and experimental syntaxes](https://github.com/cue-lang/proposal/blob/main/designs/language/4014-aliases-v2.md#summary-of-equivalent-forms) --
  each of CUE's alias forms expressed as its experimental equivalent <!-- TODO: replace with cuelang.org doc -->
