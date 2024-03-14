---
title: Using "strings.Replace"
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the built-in function
[`strings.Replace`](https://pkg.go.dev/cuelang.org/go/pkg/strings#Replace)
to make copies of strings with specific substring replacements, *without* using
regular expressions.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package example

import "strings"

// func Replace(source, old, new string, count int) string
replace: strings.Replace("This string repeats the word 'JSON': JSON, JSON, JSON.", "JSON", "YAML", 3)

// A negative value for the count parameter means unlimited replacements.
replaceAll: strings.Replace("one one one one one one one", "one", "two", -1)

// The old and new parameters are fixed values, not regular expressions.
fixed: strings.Replace("Parameters are fixed strings values.", ".*", "REPLACED", -1)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{
    "replace": "This string repeats the word 'YAML': YAML, YAML, JSON.",
    "replaceAll": "two two two two two two two",
    "fixed": "Parameters are fixed strings values."
}
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- The [`strings`](https://pkg.go.dev/cuelang.org/go/pkg/strings) built-in package
