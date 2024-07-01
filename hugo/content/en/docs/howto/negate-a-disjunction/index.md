---
title: Negate a disjunction
tags:
- validation
- language
- commented cue
authors:
- hansbogert
relatedIssues:
- https://github.com/cue-lang/cue/discussions/3229
- https://github.com/cue-lang/docs-and-content/issues/160
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to negate a disjunction.

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="top-left" >}}
package example

// Define a disjunction
#oneTwoThree: "one" | "two" | "three"

// Define a concrete value
four: "four"
// define a hidden helper value which makes sure
// that `four` is not #oneTwoThree by comparing
// their unification with bottom
_four_ok: true & ((four & #oneTwoThree) == _|_)

three: "three"
// Try the same as above, except three is an
// element of the disjunction.
// The following will fail,
_three_ok: true & ((three & #oneTwoThree) == _|_)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIHZldCBleGFtcGxlLmN1ZQ==" >}}
$ cue vet example.cue
_three_ok: conflicting values false and true:
    ./example.cue:17:12
    ./example.cue:17:20
{{< /code-tab >}}
{{< /code-tabs >}}


{{< info >}}
The method of negating a disjunction shown in this guide is likely to be
replaced by tests using more specific and precise builtins when {{< issue 943
/>}} is implemented, such as `not()`.

The builtins mentioned in that issue **are not yet available**, but we mention
them here to help guide the implementation choices you make in the interim.
{{< /info >}}
