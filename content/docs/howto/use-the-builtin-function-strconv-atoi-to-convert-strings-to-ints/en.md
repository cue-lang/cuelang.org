---
title: Using the builtin function "strconv.Atoi" to convert strings to ints
tags:
- commented cue
- encodings
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the builtin function `strconv.Atoi` to convert a string
representation of an int to the number itself, using base 10.

{{{with code "en" "cc"}}}
exec cue export
cmp stdout out
-- file.cue --
package example

import "strconv"

"0":        strconv.Atoi("0")
"1":        strconv.Atoi("1")
"10":       strconv.Atoi("10")
"42":       strconv.Atoi("42")
"-42":      strconv.Atoi("-42")
"050":      strconv.Atoi("050")
"-050":     strconv.Atoi("-050")
"00012345": strconv.Atoi("00012345")
-- out --
{
    "0": 0,
    "1": 1,
    "10": 10,
    "42": 42,
    "-42": -42,
    "050": 50,
    "-050": -50,
    "00012345": 12345
}
{{{end}}}

## Related content

- [`strconv.Atoi`](https://pkg.go.dev/cuelang.org/go@v0.7.0/pkg/strconv#Atoi)
  is a base-10 convenience wrapper around the builtin function
  [`strconv.ParseInt`](https://pkg.go.dev/cuelang.org/go@v0.7.0/pkg/strconv#ParseInt),
  which can perform conversions with custom bases and bit widths
- The [`strconv`](https://pkg.go.dev/cuelang.org/go/pkg/strconv) builtin package
