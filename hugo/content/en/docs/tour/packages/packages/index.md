---
title: "Packages"
weight: 1
---

A CUE file is a standalone file by default.
A `package` clause allows a single configuration to be split across multiple
files.

The configuration for a package is defined by the concatenation of all its
files, after stripping the package clauses and not considering imports.

Duplicate definitions are treated analogously to duplicate definitions within
the same file.
The order in which files are loaded is undefined, but any order will result
in the same outcome, given that order does not matter.

{{< code-tabs >}}
{{< code-tab name="a.cue" language="cue"  area="top-left" >}}
package config

foo: 100
bar: int
{{< /code-tab >}}
{{< code-tab name="b.cue" language="cue"  area="top-right" >}}
package config

bar: 200
{{< /code-tab >}}
{{< code-tab name="result.txt" language="txt"  area="bottom" >}}
foo: 100
bar: 200
{{< /code-tab >}}
{{< /code-tabs >}}
