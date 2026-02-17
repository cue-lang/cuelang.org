---
title: Disallowing specific field names
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to disallow specific data fields inside an otherwise open
schema.

<!--more-->

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

// This schema is open because we do not know
// which additional fields might be present.
name!:    string
address!: string

// We must not allow our data model to contain
// people's ages, so we disallow the age field.
age?: error("field name forbidden")
{{< /code-tab >}}
{{< code-tab name="data.yaml" language="yaml" area="top-right" >}}
name: Charlie Cartwright
address: Ripon, North Yorkshire
species: cat
age: 15.5
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyAuIGRhdGEueWFtbA==" >}}
$ cue vet -c . data.yaml
age: field name forbidden:
    ./file.cue:10:7
{{< /code-tab >}}
{{< /code-tabs >}}

Another common way to prevent the existence of unwanted data fields is to rely
on the **closedness** property that comes from the use of
[**definitions**]({{< relref "docs/tour/basics/definitions" >}}) or the
[**`close`**]({{< relref "docs/reference/glossary#close-built-in-function" >}})
built-in function. However, in situations such as the example above, closedness
cannot be used to disallow specific fields because the schema author cannot
specify each and every acceptable field - and therefore the schema must be left
open.

## Related content

- The CUE Tour: [**Definitions**]({{< relref "docs/tour/basics/definitions" >}})
- Glossary: [the **`close`** built-in function]({{< relref "docs/reference/glossary#close-built-in-function" >}})
- Reference: The CUE Language Specification:
  [the built-in function `error`]({{<relref"docs/reference/spec#error">}})
