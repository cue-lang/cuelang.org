---
title: Validating an integer value's parity
tags:
- commented cue
- validation
authors: [noamtd, jpluscplusm]
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to validate integer value parities using either form of `#Odd`
or `#Even` defined on this page.
Both forms display custom error messages using
[the built-in function `error`]({{<relref"docs/howto/use-the-built-in-function-error">}}),
which requires CUE v0.14.0 or later. Its use is optional, and can be omitted
without affecting the underlying parity validation.

<!--more-->

## Definitions using `div`

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

#Even: X=(2 * div(X, 2)) | error("\(X) is not even")
#Odd:  X=(1 + 2*div(X, 2)) | error("\(X) is not odd")

even: [...#Even]
even: [42, 13, 0]

odd: [...#Odd]
odd: [42, 13, 0]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIHZldA==" >}}
$ cue vet
even.1: 13 is not even:
    ./file.cue:3:28
odd.0: 42 is not odd:
    ./file.cue:4:30
odd.2: 0 is not odd:
    ./file.cue:4:30
{{< /code-tab >}}
{{< /code-tabs >}}

## Definitions using `math.MultipleOf`

{{<sidenote text="Requires CUE v0.11.0 or later">}}
{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

import "math"

#Even: X=math.MultipleOf(2) | error("\(X) is not even")
#Odd: matchN(0, [math.MultipleOf(2)])

// #Odd can also be defined in terms of #Even:
#Odd: X=matchN(0, [#Even]) | error("\(X) is not odd")

even: [...#Even]
even: [42, 13, 0]

odd: [...#Odd]
odd: [42, 13, 0]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIHZldA==" >}}
$ cue vet
even.1: 13 is not even:
    ./file.cue:5:31
odd.0: 42 is not odd:
    ./file.cue:9:30
odd.2: 0 is not odd:
    ./file.cue:9:30
{{< /code-tab >}}
{{< /code-tabs >}}

The built-in function `matchN` requires CUE v0.11.0 or later.
{{<issue 943>}}Issue #943{{</issue>}} tracks the proposed built-in function
`not`, which would permit `#Odd` to be defined directly in terms of
`math.MultipleOf` and without the use of `matchN`.

## Related content

- {{< linkto/related/howto "use-the-built-in-functions-div-mod-quo-rem" >}}
- {{< linkto/related/howto "use-the-built-in-function-matchn" >}}
- {{< linkto/related/howto "use-the-built-in-function-error">}}
