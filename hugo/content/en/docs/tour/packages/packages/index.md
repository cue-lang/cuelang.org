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

{{< code-tabs >}}
{{< code-tab name="policy.cue" language="cue" area="top-left" >}}
package config

foo:  bar/2 - 1
bar!: int
{{< /code-tab >}}
{{< code-tab name="data.cue" language="cue" area="top-right" >}}
package config

bar: 200
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAjIE5vIGZpbGVuYW1lcyBtZW50aW9uZWQ=" >}}
$ cue export # No filenames mentioned
{
    "foo": 99,
    "bar": 200
}
{{< /code-tab >}}
{{< /code-tabs >}}

The `cue` tool processes lists of CUE files and package paths.
Because working with a single package split across multiple files in the
current directory is such a common situation,
`cue` processes that single package if it isn't told to look at anything else.
