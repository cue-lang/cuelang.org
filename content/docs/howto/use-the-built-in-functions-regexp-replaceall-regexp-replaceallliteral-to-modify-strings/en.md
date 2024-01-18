---
title: Using the built-in functions "regexp.ReplaceAll" and "regexp.ReplaceAllLiteral" to modify strings
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the built-in functions
[`regexp.ReplaceAll`](https://pkg.go.dev/cuelang.org/go/pkg/regexp#ReplaceAll)
and
[`regexp.ReplaceAllLiteral`](https://pkg.go.dev/cuelang.org/go/pkg/regexp#ReplaceAllLiteral)
to modify strings using various features of regular expressions.

{{{with code "en" "cc"}}}
#location top bottom

exec cue eval
cmp stdout out
-- file.cue --
package example

import "regexp"

// regexp.ReplaceAll and regexp.ReplaceAllLiteral require 3 parameters:
//  1. the regular expression pattern to search for
//  2. the string to search through
//  3. the replacement to be made if the pattern is found
// If the 3rd argument contains only characters that match themselves when used
// in regular expressions, then the 2 functions behave identically and return
// the same value.
replaceAll:        regexp.ReplaceAll("[aeiou]", "the quick brown fox jumps over the lazy dog", "X")
replaceAllLiteral: regexp.ReplaceAllLiteral("[aeiou]", "the quick brown fox jumps over the lazy dog", "X")

// regexp.ReplaceAll's 3rd argument is a template, which optionally includes
// features such as match indexes and capture groups.
// See "Related content", below, for full documentation of the template format.
// Here we search for the letter "o", followed by one of "uvwxyz", and replace
// both characters with the second of the pair.
oPairReplaceAll: regexp.ReplaceAll("o([uvwxyz])", _src, "$1")

// regexp.ReplaceAllLiteral's 3rd argument is used literally.
// This is required when the text to be inserted contains characters which
// regular expression handling would otherwise treat specially - such as
// inserting the literal string "$1".
oPairReplaceAllLiteral: regexp.ReplaceAllLiteral("o([uvwxyz])", _src, "$1")

// Here, we combine several regular expression features.
// We search for a vowel, followed by any two letters, at the end of a word.
// We remove the vowel by replacing the entire match with the contents of a
// named capture group that contains only the two trailing letters.
regexReplaceAll: regexp.ReplaceAll("[aeiou](?P<twoLetters>\\w{2}\\b)", _src, "$twoLetters")

// All examples in this guide use _src as their source string.
_src: "the quick brown fox jumps over the lazy dog"
-- out --
replaceAll:             "thX qXXck brXwn fXx jXmps XvXr thX lXzy dXg"
replaceAllLiteral:      "thX qXXck brXwn fXx jXmps XvXr thX lXzy dXg"
oPairReplaceAll:        "the quick brwn fx jumps ver the lazy dog"
oPairReplaceAllLiteral: "the quick br$1n f$1 jumps $1er the lazy dog"
regexReplaceAll:        "the quck brwn fox jumps over the lzy dog"
{{{end}}}

## Related content

- `regex.ReplaceAll`'s
  [replacement templates](https://pkg.go.dev/cuelang.org/go/pkg/regexp#ReplaceAll)
- CUE's [regular expression syntax](https://golang.org/s/re2syntax)
- The [`regexp`](https://pkg.go.dev/cuelang.org/go/pkg/regexp) built-in package
