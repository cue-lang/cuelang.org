---
title: Conditional Fields
weight: 40
---

Field comprehensions can be used to add fields conditionally.

{{{with code "en" "tour"}}}
! exec cue export file.cue stock.yaml
cmp stderr out
-- file.cue --
price: number

// High prices require a reason and the name of
// the authorising person.
if price > 100 {
	reason!:       string
	authorisedBy!: string
}
-- stock.yaml --
price: 200
-- out --
authorisedBy: field is required but not present:
    ./file.cue:5:1
reason: field is required but not present:
    ./file.cue:5:1
{{{end}}}

{{< info >}}
When `cue export` processes multiple files it *unifies* their contents.
The value of the `price` field in `stock.yaml` is available inside `file.cue`,
and triggers the conditional inclusion of the required fields.
{{< /info >}}
