---
title: Using the builtin functions "strings.Contains", "strings.HasPrefix", and "strings.HasSuffix" as field validators
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the builtin functions `strings.Contains`,
`strings.HasPrefix`, and `strings.HasSuffix` to validate fields directly and
assert that they match specific strings.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue"  area="top" >}}
package example

import "strings"

prefix:   "Some numbers (123) and letters"
contains: "Some numbers (123) and letters"
suffix:   "Some numbers (123) and letters"

prefix: strings.HasPrefix("Some numbers")
prefix: strings.HasPrefix(_string)

contains: strings.Contains("numbers") & strings.Contains("123")
contains: strings.Contains("punctuation")

suffix: strings.HasSuffix(_letters)
suffix: strings.HasSuffix("String")

// None of the builtin functions demonstrated here accept regular expressions.
// Their parameters are interpreted as fixed strings, whether provided as
// references or inline.
contains: strings.Contains(".*")

_string:  "string"
_letters: "letters"
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="bottom" >}}
$ cue vet
prefix: invalid value "Some numbers (123) and letters" (does not satisfy strings.HasPrefix("string")):
    ./file.cue:10:9
    ./file.cue:5:11
    ./file.cue:9:9
    ./file.cue:23:11
contains: invalid value "Some numbers (123) and letters" (does not satisfy strings.Contains("punctuation")):
    ./file.cue:13:11
    ./file.cue:6:11
    ./file.cue:12:11
    ./file.cue:13:28
    ./file.cue:21:11
suffix: invalid value "Some numbers (123) and letters" (does not satisfy strings.HasSuffix("String")):
    ./file.cue:16:9
    ./file.cue:7:11
    ./file.cue:15:9
    ./file.cue:16:27
contains: invalid value "Some numbers (123) and letters" (does not satisfy strings.Contains(".*")):
    ./file.cue:21:11
    ./file.cue:6:11
    ./file.cue:12:11
    ./file.cue:13:11
    ./file.cue:21:28
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- The [`strings`](https://pkg.go.dev/cuelang.org/go/pkg/strings) builtin package
