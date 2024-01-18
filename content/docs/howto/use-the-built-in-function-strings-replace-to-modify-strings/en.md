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

{{{with code "en" "cc"}}}
#location top bottom

exec cue export
cmp stdout out
-- file.cue --
package example

import "strings"

// strings.Replace takes 4 arguments:
// - the string to modify
// - the old string (to search for and replace)
// - the new string (to take the old string's place)
// - the maximum number of replacements to make
//   - where a negative value means "make unlimited replacements"
inline: strings.Replace("This string repeats the word 'JSON': JSON, JSON, JSON.", "JSON", "YAML", -1)

// The permitted number of replacements are made whilst counting from the start
// of the string.
three: strings.Replace("one one one one one one one", "one", "three", 3)

// Replaced and replacement strings are fixed values, not regular expressions.
fixed: strings.Replace("Parameters are fixed strings values.", ".*", "REPLACED", -1)

// Any parameter may be provided via reference.
reference: strings.Replace(_modify, _old, _new, _count)
_modify:   "Some string value"
_old:      "string"
_new:      "STRING"
_count:    -1
-- out --
{
    "inline": "This string repeats the word 'YAML': YAML, YAML, YAML.",
    "three": "three three three one one one one",
    "fixed": "Parameters are fixed strings values.",
    "reference": "Some STRING value"
}
{{{end}}}

## Related content

- The [`strings`](https://pkg.go.dev/cuelang.org/go/pkg/strings) built-in package
