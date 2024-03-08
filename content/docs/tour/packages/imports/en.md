---
title: Imports
weight: 20
---

A CUE file may **import** definitions from CUE's built-in packages and
user-defined packages,
but does not need to be part of a package to use imports.

The packages required by a file are declared at the top of the file, after the
package clause, as an `import` statement.
Multiple import statements are permitted,
but it's good style to use a *factored* import statement that combines them.

{{{with code "en" "tour"}}}
exec cue export file.cue
cmp stdout out
-- file.cue --
import (
	"list"
	"math"
	"strings"
)

_s: strings.Split("\(math.Pi)", "7")
a:  list.Sort(_s, list.Descending)
-- out --
{
    "a": [
        "950288419",
        "932384626433832",
        "51058209",
        "494459",
        "3.141592653589",
        "1693993"
    ]
}
{{{end}}}
