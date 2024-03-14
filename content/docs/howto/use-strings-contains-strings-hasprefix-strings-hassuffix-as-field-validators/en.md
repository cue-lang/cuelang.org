---
title: Using "strings.Contains", "strings.HasPrefix", and "strings.HasSuffix" as field validators
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the built-in functions
[`strings.Contains`](https://pkg.go.dev/cuelang.org/go/pkg/strings#Contains),
[`strings.HasPrefix`](https://pkg.go.dev/cuelang.org/go/pkg/strings#HasPrefix), and
[`strings.HasSuffix`](https://pkg.go.dev/cuelang.org/go/pkg/strings#HasSuffix)
to validate fields by asserting that their values match specific strings.

{{{with code "en" "cc"}}}
#location top bottom

! exec cue vet
cmp stderr out
-- file.cue --
package example

import "strings"

prefix:   "Some numbers (123) and letters"
contains: "Some numbers (123) and letters"
suffix:   "Some numbers (123) and letters"

prefix: strings.HasPrefix("Some numbers")
prefix: strings.HasPrefix("incorrect prefix")

contains: strings.Contains("numbers") & strings.Contains("123")
contains: strings.Contains("punctuation")

suffix: strings.HasSuffix("letters")
suffix: strings.HasSuffix("incorrect suffix")

// None of the built-in functions demonstrated here accept regular expressions.
contains: strings.Contains(".*")
-- out --
prefix: invalid value "Some numbers (123) and letters" (does not satisfy strings.HasPrefix("incorrect prefix")):
    ./file.cue:10:9
    ./file.cue:5:11
    ./file.cue:9:9
    ./file.cue:10:27
contains: invalid value "Some numbers (123) and letters" (does not satisfy strings.Contains("punctuation")):
    ./file.cue:13:11
    ./file.cue:6:11
    ./file.cue:12:11
    ./file.cue:13:28
    ./file.cue:19:11
suffix: invalid value "Some numbers (123) and letters" (does not satisfy strings.HasSuffix("incorrect suffix")):
    ./file.cue:16:9
    ./file.cue:7:11
    ./file.cue:15:9
    ./file.cue:16:27
contains: invalid value "Some numbers (123) and letters" (does not satisfy strings.Contains(".*")):
    ./file.cue:19:11
    ./file.cue:6:11
    ./file.cue:12:11
    ./file.cue:13:11
    ./file.cue:19:28
{{{end}}}

## Related content

- The [`strings`](https://pkg.go.dev/cuelang.org/go/pkg/strings) built-in package
