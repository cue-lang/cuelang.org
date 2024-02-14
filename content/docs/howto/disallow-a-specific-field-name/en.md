---
title: Disallowing specific field names
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

A common way to prevent the existence of data fields is to rely on the
**closedness** property that comes from the use of
[**definitions**]({{< relref "docs/tour/basics/definitions" >}}) or the
[**`close`**]({{< relref "docs/reference/glossary#close-built-in-function" >}})
built-in function.

In situations where neither of these language features is appropriate then the
technique demonstrated in this
[Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}}) may be used
to prohibit specific data fields from existing.

{{{with code "en" "emit"}}}
! exec cue vet .:example data.yaml
cmp stderr out
-- file.cue --
package example

// This schema is open because we do not know
// which additional fields might be present.
name!:    string
address!: string

// We must not allow our data model to contain
// people's ages, so we disallow the age field.
age?: _|_
-- data.yaml --
name: Charlie Cartwright
address: Ripon, North Yorkshire
species: cat
age: 15.5
-- out --
explicit error (_|_ literal) in source:
    ./file.cue:10:7
{{{end}}}

{{< info >}}
The technique demonstrated here may be superseded by the `error` validator
described in {{< issue 943 />}}.

**This validator is not yet available**, but would allow for custom error
messages instead of the\
`explicit error (_|_ literal) in source` shown above.
{{< /info >}}

## Related content

- The CUE Tour: [**Definitions**]({{< relref "docs/tour/basics/definitions" >}})
- Glossary: [the **`close`** built-in function]({{< relref
    "docs/reference/glossary#close-built-in-function"
  >}})
- {{< issue 943 >}}Issue 943{{< /issue >}} contains details of the proposed
  `error` validator
