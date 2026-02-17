---
title: Adding "else" to comprehensions in CUE 0.16
authors: [mvdan]
tags: [language]
toc_hide: false
---

{{<sidenote text="Requires CUE v0.16.0 or later">}}

CUE v0.16.0-alpha.2 introduced a new optional `else` clause in comprehensions
for CUE modules targetting the language version v0.16.0 or later,
which you can opt into via
[`cue mod edit --language-version`]({{<relref "docs/reference/command/cue-help-mod-edit" >}}).

With this change to the language, an `if` or `for` comprehension may be followed
by an `else` clause which triggers when the comprehension produced zero values.
For example, this occurs when:
- An `if` clause condition is false
- A `for` clause iterates over an empty collection
- A `for` clause has all iterations filtered out by `if` clauses

An `else` clause can help avoid repetition or verbosity, for instance:

{{{with code "en" "if-else before and after"}}}
#location top-left top-right bottom
# See: https://cuelang.org/issue/4123
#nofmt(if-with-else.cue)
env PATH=/cues/$CUELANG_CUE_TIP:$PATH
exec cue export --out yaml
cmp stdout out
-- if-without-else.cue --
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

An `else` clause can also be used as a fallback for loops that produce zero values:

{{{with code "en" "for-else"}}}
#location top bottom
# See: https://cuelang.org/issue/4123
#nofmt(for-with-else.cue)
env PATH=/cues/$CUELANG_CUE_TIP:$PATH
exec cue export --out yaml for-with-else.cue
cmp stdout out
-- for-with-else.cue --
_inputs: ["foo.txt", "bar.xml", "baz.toml"]

for i, name in _inputs
if name =~ #"\.cue$"# {
	cueInputs: (name): i
} else {
	cueInputs: "fallback.cue": -1
}
-- out --
cueInputs:
  cueInputs:
    fallback.cue: -1
  fallback.cue: -1
{{{end}}}

