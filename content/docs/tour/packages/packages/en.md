---
title: Packages
weight: 10
---

By default, each CUE file is a standalone file.

A configuration can be split across multiple files by adding a `package` clause
to each file.

The configuration for each package is defined by the concatenation of all its files,
after stripping their package clauses and merging their import statements.
Multiple definitions of the same field across files and within the same file
are treated similarly, because
[order does not matter]({{< relref "docs/tour/basics/order-irrelevance" >}}).

{{{with code "en" "tour"}}}
exec cue export # No filenames mentioned
cmp stdout out
-- policy.cue --
package config

foo:  bar/2 - 1
bar!: int
-- data.cue --
package config

bar: 200
-- out --
{
    "foo": 99,
    "bar": 200
}
{{{end}}}

The `cue` tool processes lists of CUE files and package paths.
Because working with a single package split across multiple files in the
current directory is such a common situation,
`cue` processes that single package if it isn't told to look at anything else.
