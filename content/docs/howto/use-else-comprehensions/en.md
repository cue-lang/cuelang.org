---
title: Use "else" comprehensions
authors: [mvdan]
tags: [language]
toc_hide: false
---

{{<sidenote text="Requires CUE v0.16.0 or later">}}

CUE v0.16.0-alpha.2 introduced the "try" experiment, which also adds
new optional `else` and `fallback` clauses in comprehensions.

To use this language feature, update your module to target language version v0.16.0
or later with [`cue mod edit`]({{<relref "docs/reference/command/cue-help-mod-edit" >}}):

{{{with _script_ "en" "create module"}}}
export PATH=/cues/$CUELANG_CUE_TIP:$PATH
cue mod init mod.com
{{{end}}}

{{{with script "en" "edit language version"}}}
cue mod edit --language-version v0.16.0
{{{end}}}

You can now enable the experiment on a per-file basis using `@experiment(try)`.

With this change to the language, an `if` comprehension may be followed
by an `else` clause which triggers when the condition is not met,
and a `for` comprehension may be followed by a `fallthrough` clause
which triggers when the comprehension produced zero values.

An `else` clause can help avoid repetition or verbosity, for instance:

{{{with code "en" "if-else before and after"}}}
#location top-left top-right bottom
# See: https://cuelang.org/issue/4123
#nofmt(if-with-else.cue)
env PATH=/cues/$CUELANG_CUE_TIP:$PATH

exec cue export --out yaml
cmp stdout out
-- if-without-else.cue --
// No experiment required

package p

_foo: true
_bar: true

if _foo && _bar {
	withoutElse: "condition met"
}
if !(_foo && _bar) {
	withoutElse: "condition not met"
}
-- if-with-else.cue --
@experiment(try)

package p

if _foo && _bar {
	withElse: "condition met"
} else {
	withElse: "condition not met"
}
-- out --
withElse: condition met
withoutElse: condition met
{{{end}}}

A `fallback` clause can be used for loops which can produce zero values:

{{{with code "en" "for-fallback"}}}
#location top bottom
# See: https://cuelang.org/issue/4123
#nofmt(for-with-fallback.cue)
env PATH=/cues/$CUELANG_CUE_TIP:$PATH

exec cue export --out yaml
cmp stdout out
-- for-with-fallback.cue --
@experiment(try)

package p

_inputs: ["foo.txt", "bar.xml", "baz.toml"]

for i, name in _inputs
if name =~ #"\.cue$"# {
	cueInputs: (name): i
} fallback {
	cueInputs: "fallback.cue": -1
}
-- out --
cueInputs:
  fallback.cue: -1
{{{end}}}

