---
title: Using the built-in function "error" to create custom errors
tags: [language, commented cue]
authors: [jpluscplusm]
toc_hide: true
---
{{<sidenote text="Requires CUE v0.14.0 or later" >}}

The built-in function `error` was introduced in CUE v0.14.0, and lets you
specify a custom error string that will be displayed when an evaluation fails.
This [Commented CUE]({{<relref"docs/howto/about-commented-cue-guides">}})
demonstrates how to use the function in a disjunction.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
// When all non-error() elements of a disjunction have been eliminated, evaluation
// of the disjunction's field fails and any error messages are displayed.
A: 1/0 | error("Cannot divide by zero")

// If multiple error() elements are present, they are all displayed.
B: 1/0 | error("Division failure") | error("Mathematics failure")

// An error message is a single string that may contain interpolations.
C: 42
D: C/0 | error("Tried to divide \(C) by zero")

// If an error message string contains interpolations that fail to evaluate
// then those interpolations are displayed verbatim, as source expressions.
E: int | *0
F: C/E | error("Used '\(C)' and '\(E)' to calculate \(C/E)")
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWxlLmN1ZQ==" >}}
$ cue export file.cue
B: 2 errors in empty disjunction:
A: Cannot divide by zero:
    ./file.cue:3:10
B: Division failure:
    ./file.cue:6:10
B: Mathematics failure:
    ./file.cue:6:38
D: Tried to divide 42 by zero:
    ./file.cue:10:10
F: Used '42' and '*0 | int' to calculate (C / E):
    ./file.cue:15:10
    ./file.cue:14:4
    ./file.cue:15:55
{{< /code-tab >}}
{{< /code-tabs >}}

The verbatim display of failing string interpolations (as with field `F`,
above) allows you to interpolate expressions that *might* fail to evaluate.
You don't need to guard against the error message itself failing to evaluate.

## Related content

- Reference: The CUE Language Specification defines
  [the built-in function `error`]({{<relref"docs/reference/spec/#error">}})
