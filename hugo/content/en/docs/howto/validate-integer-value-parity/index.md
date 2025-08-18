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
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIHZldCAtYw==" >}}
$ cue vet -c
even.1: 13 is not even:
    ./file.cue:3:28
odd.0: 42 is not odd:
    ./file.cue:4:30
odd.2: 0 is not odd:
    ./file.cue:4:30
{{< /code-tab >}}
{{< /code-tabs >}}

## Using `math.MultipleOf`

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

import "math"

#Even: X=math.MultipleOf(2) | error("\(X) is not even")
#Odd:  X=matchN(0, [#Even]) | error("\(X) is not odd")

// #Odd can also be defined without #Even:
#Odd: matchN(0, [math.MultipleOf(2)])

even: [...#Even]
even: [42, 13, 0]

odd: [...#Odd]
odd: [42, 13, 0]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIHZldCAtYw==" >}}
$ cue vet -c
even.1: 13 is not even:
    ./file.cue:5:31
odd.0: 42 is not odd:
    ./file.cue:6:31
odd.2: 0 is not odd:
    ./file.cue:6:31
{{< /code-tab >}}
{{< /code-tabs >}}

{{<issue 943>}}Issue #943{{</issue>}} tracks the proposed built-in function
`not`, which would permit `#Odd` to be defined directly in terms of
`math.MultipleOf` and without the use of `matchN`.

## Related content

- {{< linkto/related/howto "use-the-built-in-functions-div-mod-quo-rem" >}}
- {{< linkto/related/howto "use-the-built-in-function-matchn" >}}
- {{< linkto/related/howto "use-the-built-in-function-error">}}
