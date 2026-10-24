---
title: Validating the parity of an integer value
tags:
- commented cue
- validation
authors: [noamtd, jpluscplusm]
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to validate the parity of an integer value using two
equivalent definitions for `#Odd` and `#Even`.
Both pairs of definitions display custom error messages using
[the built-in function `error`]({{<relref"docs/howto/use-the-built-in-function-error">}}),
which requires CUE v0.14.0 or later.
Using `error` is optional and can be omitted.

<!--more-->

## Using `div`

{{{with code "en" "div"}}}
! exec cue vet -c
cmp stderr out
-- file.cue --
package example

#Even: {let X = self, matchN(1, [2 * div(X, 2)]) | error("\(X) is not even")}
#Odd:  {let X = self, matchN(1, [1 + 2*div(X, 2)]) | error("\(X) is not odd")}

even: [...#Even]
even: [42, 13, 0]

odd: [...#Odd]
odd: [42, 13, 0]
-- out --
even.1: 13 is not even:
    ./file.cue:3:52
    ./file.cue:3:23
    ./file.cue:3:30
    ./file.cue:6:11
    ./file.cue:7:12
odd.0: 42 is not odd:
    ./file.cue:4:54
    ./file.cue:4:23
    ./file.cue:4:30
    ./file.cue:9:10
    ./file.cue:10:7
odd.2: 0 is not odd:
    ./file.cue:4:54
    ./file.cue:4:23
    ./file.cue:4:30
    ./file.cue:9:10
    ./file.cue:10:15
{{{end}}}

## Using `math.MultipleOf`

{{{with code "en" "multipleof"}}}
! exec cue vet -c
cmp stderr out
-- file.cue --
package example

import "math"

#Even: {let X = self, math.MultipleOf(2) | error("\(X) is not even")}
#Odd:  {let X = self, matchN(0, [#Even]) | error("\(X) is not odd")}

// #Odd can also be defined without #Even:
#Odd: matchN(0, [math.MultipleOf(2)])

even: [...#Even]
even: [42, 13, 0]

odd: [...#Odd]
odd: [42, 13, 0]
-- out --
even.1: 13 is not even:
    ./file.cue:5:44
    ./file.cue:5:39
    ./file.cue:11:11
    ./file.cue:12:12
odd.0: 42 is not odd:
    ./file.cue:6:44
    ./file.cue:9:7
    ./file.cue:9:14
    ./file.cue:14:10
    ./file.cue:15:7
odd.2: 0 is not odd:
    ./file.cue:6:44
    ./file.cue:9:7
    ./file.cue:9:14
    ./file.cue:14:10
    ./file.cue:15:15
{{{end}}}

{{<issue 943>}}Issue #943{{</issue>}} tracks the proposed built-in function
`not`, which would permit `#Odd` to be defined directly in terms of
`math.MultipleOf` and without the use of `matchN`.

## Related content

- {{< linkto/related/howto "use-the-built-in-functions-div-mod-quo-rem" >}}
- {{< linkto/related/howto "use-the-built-in-function-matchn" >}}
- {{< linkto/related/howto "use-the-built-in-function-error">}}
