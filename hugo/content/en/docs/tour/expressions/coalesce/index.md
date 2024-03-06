---
title: Null Coalescing
weight: 80
---

**Null coalescing** is a technique that can allow your CUE to evaluate successfully,
despite data having invalid, unexpected, or missing values.
By "null coalescing", we really mean error (or bottom) coalescing.

It uses a disjunction's default marker (`*`) to prefer the value of an
expression that *might* evaluate to bottom (`_|_`),
alongside an alternative, fallback value that the disjunction will select if
the expression *does* produce bottom.
This isn't a separate language feature, but is the expected outcome from CUE's
design that `_|_ | value` evaluates to `value`.

This technique can guard against situations such as list indexes being out of
bounds, and type checks, with a fallback in the case of a type mismatch.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
#pets: ["Cat", "Mouse", "Dog"]

// Guard against out of bounds list indexes.
pet0: *#pets[0] | "Pet not found"
pet5: *#pets[5] | "Pet not found"

#nums: [7, "8", "9"]

// Perform a type check.
num0: *(#nums[0] & int) | "Not an integer"
num1: *(#nums[1] & int) | "Not an integer"
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgLWMgZmlsZS5jdWU=" >}}
$ cue eval -c file.cue
pet0: "Cat"
pet5: "Pet not found"
num0: 7
num1: "Not an integer"
{{< /code-tab >}}
{{< /code-tabs >}}
