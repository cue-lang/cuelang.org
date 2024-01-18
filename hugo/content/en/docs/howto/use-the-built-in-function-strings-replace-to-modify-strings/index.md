---
title: Using the built-in function "strings.Replace" to modify strings
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the built-in function `strings.Replace` to modify
strings, *without* using regular expressions.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue"  area="top" >}}
package example

import "strings"

// strings.Replace takes 4 parameters:
// - the string to modify
// - the old string (to search for and replace)
// - the new string (to take the old string's place)
// - the maximum number of replacements to make, counting from
//   the start of the string
inline: strings.Replace("This string repeats the word 'JSON': JSON, JSON, JSON.", "JSON", "YAML", 3)

// A negative value for the 4th parameter (the number of replacements to make)
// means "make unlimited replacements".
replaceAll: strings.Replace("one one one one one one one", "one", "two", -1)

// Replaced and replacement strings are fixed values, not regular expressions.
fixed: strings.Replace("Parameters are fixed strings values.", ".*", "REPLACED", -1)

// Any parameter may be provided via reference.
reference: strings.Replace(_modify, _old, _new, _count)
_modify:   "Some string value"
_old:      "string"
_new:      "STRING"
_count:    -1
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="bottom" >}}
$ cue export
{
    "inline": "This string repeats the word 'YAML': YAML, YAML, JSON.",
    "replaceAll": "two two two two two two two",
    "fixed": "Parameters are fixed strings values.",
    "reference": "Some STRING value"
}
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- The [`strings`](https://pkg.go.dev/cuelang.org/go/pkg/strings) built-in package
