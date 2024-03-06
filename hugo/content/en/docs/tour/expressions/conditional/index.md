---
title: Conditional Fields
weight: 40
---

Field comprehensions can be used to add fields conditionally.

{{< info >}}
When `cue export` processes multiple files it *unifies* their contents.
The value of the `price` field in `stock.yaml` is available inside `file.cue`,
and triggers the conditional inclusion of the required fields.
{{< /info >}}

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
price: number

// High prices require a reason and the name of
// the authorising person.
if price > 100 {
	reason!:       string
	authorisedBy!: string
}
{{< /code-tab >}}
{{< code-tab name="stock.yaml" language="yaml" area="top-right" >}}
price: 200
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWxlLmN1ZSBzdG9jay55YW1s" >}}
$ cue export file.cue stock.yaml
authorisedBy: field is required but not present:
    ./file.cue:5:1
reason: field is required but not present:
    ./file.cue:5:1
{{< /code-tab >}}
{{< /code-tabs >}}

