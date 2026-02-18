---
title: Adding "try" comprehensions in CUE 0.16
authors: [mvdan]
tags: [language]
toc_hide: false
---

{{<sidenote text="Requires CUE v0.16.0 or later">}}

CUE v0.16.0-alpha.2 introduced the "try" experiment, which adds a `try` clause
in comprehensions as well as the use of `?` in field references.

This addition to the language intends to provide a more concise syntax for
handling missing optional fields, reducing the boilerplate of explicit error
checks.

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

A `try` clause can be used to improve the conditional definition of a field
based on the presence of another field:

{{{with code "en" "if-else before and after"}}}
#location top-left top-right bottom
# See: https://cuelang.org/issue/4123
#nofmt(with-try.cue)
env PATH=/cues/$CUELANG_CUE_TIP:$PATH

exec cue export
cmp stdout out
-- without-try.cue --
// No experiment required

package p

a?: int
if a != _|_ {
	b: a + 1
}
-- with-try.cue --
@experiment(try)

package p

a?: int
try {
    b: a? + 1
}
-- out --
{}
{{{end}}}

A `try` clause can also bind an identifier to a value
for use in subsequent clauses and the comprehension body:

{{{with code "en" "try-bind"}}}
#location top bottom
# See: https://cuelang.org/issue/4123
#nofmt(try-with-bind.cue)
env PATH=/cues/$CUELANG_CUE_TIP:$PATH

exec cue export
cmp stdout out
-- try-with-bind.cue --
@experiment(try)

package p

a?: int

try x = {
    value: a? + 1
} if x.value > 5 {
    b: x
}
-- out --
{}
{{{end}}}

Finally, you can also use an `else` clause for a fallback value:

{{{with code "en" "try-else"}}}
#location top bottom
# See: https://cuelang.org/issue/4123
#nofmt(try-with-else.cue)
env PATH=/cues/$CUELANG_CUE_TIP:$PATH

exec cue export
cmp stdout out
-- try-with-else.cue --
@experiment(try)

package p

a?: int

try {
    b: a? + 1
} else {
    b: -1
}
-- out --
{
    "b": -1
}
{{{end}}}
