---
title: Adding "else" to comprehensions in CUE 0.16
authors: [mvdan]
tags: [language]
toc_hide: false
---

{{<sidenote text="Requires CUE v0.16.0 or later">}}

{{{with _script_ "en" "cmd/cue prerelease"}}}
export PATH=/cues/$CUELANG_CUE_TIP:$PATH
{{{end}}}

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

{{<columns>}}
{{{with upload "en" "1 old"}}}
-- if-without-else.cue --
foo: true
bar: true

if foo && bar {
	out: "condition met"
}
if !(foo && bar) {
	out: "condition not met"
}
{{{end}}}

{{<columns-separator>}}

{{{with upload "en" "1 new"}}}
# See: https://cuelang.org/issue/4123
#nofmt(if-with-else.cue)
-- if-with-else.cue --
foo: true
bar: true

if foo && bar {
	out: "condition met"
} else {
	out: "condition not met"
}
{{{end}}}

{{</columns>}}

{{<columns>}}
{{{with script "en" "1 export if without else"}}}
cue export if-without-else.cue
{{{end}}}
{{<columns-separator>}}
{{{with script "en" "1 export if with else"}}}
cue export if-with-else.cue
{{{end}}}
{{</columns>}}

An `else` clause can also be used as a fallback for loops that produce zero values:

{{{with upload "en" "2 for with else"}}}
# See: https://cuelang.org/issue/4123
#nofmt(for-with-else.cue)
-- for-with-else.cue --
inputs: ["foo.txt", "bar.xml", "baz.toml"]

for i, name in inputs
if name =~ #"\.cue$"# {
	cueInputs: (name): i
} else {
	cueInputs: "fallback.cue": -1
}
{{{end}}}

{{{with script "en" "2 export for with else"}}}
cue export for-with-else.cue
{{{end}}}
