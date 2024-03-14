---
title: Using "strconv.Atoi" to convert strings to ints
tags:
- commented cue
- encodings
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the built-in function
[`strconv.Atoi`](https://pkg.go.dev/cuelang.org/go/pkg/strconv#Atoi)
to convert a string representation of an int to the number itself, using base
10.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
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
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
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
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- [`strconv.Atoi`](https://pkg.go.dev/cuelang.org/go/pkg/strconv#Atoi)
  is a base-10 convenience wrapper around the built-in function
  [`strconv.ParseInt`](https://pkg.go.dev/cuelang.org/go/pkg/strconv#ParseInt),
  which can perform conversions with custom bases and bit widths
- The [`strconv`](https://pkg.go.dev/cuelang.org/go/pkg/strconv) built-in package
