---
title: "Imports"
weight: 2
---

A CUE file may import definitions from builtin or user-defined packages.
A CUE file does not need to be part of a package to use imports.

The example here shows the use of builtin packages.

This code groups the imports into a parenthesized, "factored" import statement.

You can also write multiple import statements, like:

{{{with code "en" "example"}}}
-- file.cue --
import "encoding/json"

import "math"
{{{end}}}

But it is good style to use the factored import statement.

{{{with code "en" "imports"}}}
exec cue eval imports.cue
cmp stdout result.txt
-- imports.cue --
import (
	"encoding/json"
	"math"
)

data: json.Marshal({a: math.Sqrt(7)})
-- result.txt --
data: "{\"a\":2.6457513110645907}"
{{{end}}}
