---
title: Packages
weight: 10
---

By default, each CUE file is a standalone file.
The **`package`** clause allows a single configuration to be split across
multiple files and re-unified when required.
A package's identifier can only contain
[certain characters]({{< relref "docs/reference/spec#identifiers" >}}).

The configuration for each package is defined by the concatenation of all its files,
after stripping their package clauses and merging their import statements.
Duplicate definitions across files and within the same file are treated similarly.
CUE's
[order irrelevance]({{< relref "docs/tour/basics/order-irrelevance" >}})
means that the order in which files are loaded is unimportant,
because all orderings result in the same outcome.

The `cue` tool processes lists of CUE files and package paths.
Because working with a single package split across multiple files in the
current directory is such a common situation,
`cue` processes that single package if it isn't told to look at anything else.

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
