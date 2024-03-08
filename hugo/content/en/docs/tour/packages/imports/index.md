---
title: Imports
weight: 20
---

A CUE file may **import** definitions from CUE's built-in packages and
user-defined packages,
but does not need to be part of a package to use imports.

The packages required by a file are declared in an `import` statement at the
top of the file, after any package clause.
Multiple import statements are permitted,
but it's good style to use a *factored* import statement that combines them.

An import can optionally define an alias, which *must* be used when referencing
the import inside the file. Aliases can help avoid variable shadowing.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

import (
	"strings"
	"math"
	List "list" // The alias List must be used.
)

_split: strings.Split("\(math.Pi)", "7")
list:   List.Sort(_split, List.Descending)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{
    "list": [
        "950288419",
        "932384626433832",
        "51058209",
        "494459",
        "3.141592653589",
        "1693993"
    ]
}
{{< /code-tab >}}
{{< /code-tabs >}}
