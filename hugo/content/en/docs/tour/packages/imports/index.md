---
title: Imports
weight: 20
---

A CUE file may **import** definitions from CUE's built-in packages and
user-defined packages.

The packages required by a file are declared in an `import` statement at the
top of the file, after any package clause.
A file does not need to be part of a package to use imports.
Multiple import statements are permitted,
but it's good style to use
a *factored* import statement that combines them using parentheses.

An import statement can optionally define a **named import**,
which specifies the identifer that *must* be used when
referencing the imported package inside the file.
Named imports can help avoid variable shadowing.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

import (
	"math"
	L "list" // The identifier L must be used.
)

list: L.Sort([3, 2, 1, math.Pi], L.Ascending)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{
    "list": [
        1,
        2,
        3,
        3.14159265358979323846264338327950288419716939937510582097494459
    ]
}
{{< /code-tab >}}
{{< /code-tabs >}}
