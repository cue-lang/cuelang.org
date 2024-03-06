---
title: Null Coalescing
weight: 80
---

**Null coalescing** is a technique that can allow your CUE to evaluate successfully,
despite data having invalid, unexpected, or missing values.

It uses a disjunction's default marker (`*`) to prefer the value of an
expression that *might* evaluate to bottom (`_|_`),
alongside an alternative, fallback value that the disjunction will select if
the expression *does* produce bottom.
This isn't a separate language feature, but is the expected outcome from CUE's
design that `_|_ | value` evaluates to `value`.

This technique can guard against situations such as list indexes being out of bounds.
It also allows for type checks, with a fallback in the case of a type mismatch.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
#pets: ["Cat", "Mouse", "Dog", "Goldfish"]

// Guard against out of bounds list indexes.
pet0: *#pets[0] | "None"
pet5: *#pets[5] | "None"

#nums: [1, "2", "3", "4"]

// Perform a type check and out of bounds check.
num0: *(#nums[0] & int) | "NaN or bad index"
num1: *(#nums[1] & int) | "NaN or bad index"
num5: *(#nums[5] & int) | "NaN or bad index"
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgLWMgZmlsZS5jdWU=" >}}
$ cue eval -c file.cue
pet0: "Cat"
pet5: "None"
num0: 1
num1: "NaN or bad index"
num5: "NaN or bad index"
{{< /code-tab >}}
{{< /code-tabs >}}
