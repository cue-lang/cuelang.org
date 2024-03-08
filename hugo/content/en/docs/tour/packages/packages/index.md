---
title: Packages
weight: 10
---

By default, each CUE file is a standalone file.

The **`package`** clause allows a single configuration to be split across
multiple files.

The configuration for any package is defined by the concatenation of all its
files, after stripping their package clauses and merging their import
statements.
Duplicate definitions are treated similarly to duplicate definitions within
the same file.
Because of CUE's
[order irrelevance]({{< relref "docs/tour/basics/order-irrelevance" >}}),
the order in which files are loaded is unimportant because all orderings result
in the same outcome.

The `cue` tool processes lists of CUE files and package identifiers
(which are explained shortly).
Because having a single package split across multiple files in the current
directory is such a common situation,
`cue` defaults to processing this package when not told about any others.

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue" area="top-left" >}}
package config

foo:  bar - 100
bar!: int
{{< /code-tab >}}
{{< code-tab name="data.cue" language="cue" area="top-right" >}}
package config

bar: 200
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAjIE5vIGZpbGVuYW1lcyBtZW50aW9uZWQ=" >}}
$ cue export # No filenames mentioned
{
    "foo": 100,
    "bar": 200
}
{{< /code-tab >}}
{{< /code-tabs >}}
