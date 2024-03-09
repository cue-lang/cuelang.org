---
title: Ensuring that an integer value is either odd or even
tags:
- commented cue
authors:
- noamtd
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to ensure that a given number is either odd or even.

{{{with code "en" "cc"}}}
exec cue eval -ic
cmp stdout out
-- file.cue --
package example

#Even: num={2 * (__div(num, 2))}
#Odd:  num={2 * (__div(num, 2)) + 1}

isEven:  56 & #Even
notEven: 97 & #Even
isOdd:   97 & #Odd
notOdd:  56 & #Odd
-- out --
isEven:  56
notEven: _|_ // notEven: conflicting values 96 and 97
isOdd:   97
notOdd:  _|_ // notOdd: conflicting values 57 and 56
{{{end}}}

## Related content

* {{< linkto/related/howto "use-the-built-in-functions-div-mod-quo-rem" >}}
