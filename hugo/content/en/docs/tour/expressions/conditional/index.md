---
title: Conditional Fields
weight: 40
---

Field comprehensions can be used to add fields conditionally.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
#Sale: {
	price!: number
	// High prices require a reason and the
	// name of the authorising manager.
	if price > 100 {
		reason!:       string
		authorisedBy!: string
	}
}

aSale: #Sale & {
	price: 200
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWxlLmN1ZSAtZSBhU2FsZQ==" >}}
$ cue export file.cue -e aSale
aSale.authorisedBy: field is required but not present:
    ./file.cue:5:2
aSale.reason: field is required but not present:
    ./file.cue:5:2
{{< /code-tab >}}
{{< /code-tabs >}}
