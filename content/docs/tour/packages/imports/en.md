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

{{{with code "en" "tour"}}}
exec cue export
cmp stdout out
-- file.cue --
package example

import (
	"math"
	L "list" // The identifier L must be used.
)

list: L.Sort([3, 2, 1, math.Pi], L.Ascending)
-- out --
{
    "list": [
        1,
        2,
        3,
        3.14159265358979323846264338327950288419716939937510582097494459
    ]
}
{{{end}}}
