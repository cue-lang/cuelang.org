---
title: Conditional Fields
weight: 40
---

Field comprehensions can be used to add fields conditionally.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
price: 200

// High prices require a reason and the name of
// the authorising person.
if price > 100 {
	reason!:       string
	authorisedBy!: string
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWxlLmN1ZQ==" >}}
$ cue export file.cue
authorisedBy: field is required but not present:
    ./file.cue:5:1
reason: field is required but not present:
    ./file.cue:5:1
{{< /code-tab >}}
{{< /code-tabs >}}
