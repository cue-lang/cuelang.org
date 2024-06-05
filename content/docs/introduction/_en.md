---
title: Introduction
weight: 10
toc_hide: false
index_hide: true
aliases:
- /docs/introduction/welcome
- /docs/about
---

### Welcome to CUE!

CUE is an
<dfn title='License: "Apache-2.0", DCO: true, CLA: false'>open-source</dfn>
data validation language with its roots in logic programming.
It combines succinct yet clear syntax with powerful, flexible constraints,
allowing data and constraints to coexist seamlessly:

{{{with code "en" "example"}}}
#location left right
! exec cue vet example.cue
cmp stderr out
-- example.cue --
length: 20
width:  10.5 & >10 // Must be greater than 10
area:   length * width
area:   <150 // Must be less than 150
-- out --
area: invalid value 210.0 (out of bound <150):
    ./example.cue:4:9
    ./example.cue:3:9
{{{end}}}

In its mission to support people using the language and to promote its
adoption, the CUE project develops and publishes a variety of documentation and
tools, including:

{{< table >}}
| Resource | Description
| --- | ---
| [The `cue` command]({{< relref "installation" >}}) | A command line tool that evaluates CUE, optionally combining it with structured data and other schema formats to validate, transform, and output data and constraints.
| [`cuelang.org/go` APIs](https://pkg.go.dev/cuelang.org/go/cue#section-documentation) | Go APIs that enable CUE's capabilities to be embedded in Go programs. <!-- TODO: change link when https://github.com/cue-lang/docs-and-content/issues/153 is addressed -->
| [The CUE Language Specification]({{< ref "docs/reference/spec" >}}) | The formal specification of CUE that defines how implementations of the language should behave.
| [cuelang.org](/) | This website, including a foundational [tour through the language]({{< relref "/docs/tour" >}}), hands-on [tutorials]({{< relref "/docs/tutorial" >}}) and [how-to guides]({{< relref "/docs/howto" >}}), and informative [concept guides]({{< relref "/docs/concept" >}}).
| [The CUE Playground](/play/) | A browser-based tool that lets you try out CUE without installing anything.
{{< /table >}}
<hr>

By design, CUE isn't a general-purpose programming language,
but its power and flexibility drive its use across a wide range of
applications. It's often used to define, validate and generate
[configuration]({{< relref "/docs/concept/how-cue-enables-configuration" >}}).
CUE also excels at
[validating data]({{< relref "/docs/concept/how-cue-enables-data-validation" >}})
(such as JSON and YAML) against CUE schemas and policies, whilst also allowing schemas encoded in a variety of
[other formats]({{< relref "/docs/integration/" >}})
(such as JSON Schema, Protobuf, and OpenAPI) to be used simultaneously.

CUE's language features enables you to
[template data]({{< relref "/docs/tour/types/templates" >}}),
reducing boilerplate by specifying fields in bulk and allowing data's
important characteristics to stand out prominently. It's also used for
[code generation]({{< relref "/docs/concept/code-generation-and-extraction-use-case" >}}),
and to leverage existing schemas defined in formats such as
[Protobuf]({{< relref "/docs/concept/how-cue-works-with-protocol-buffers" >}}),
[JSON Schema]({{< relref "/docs/concept/how-cue-works-with-json-schema" >}}),
and
[Go]({{< relref "/docs/concept/how-cue-works-with-go" >}}) types.

On the next page you'll learn about some unique properties of the CUE language,
including:

- why the merged concepts of "types" and "values" enable succinct and clear
  constraints, and
- how some of CUE's core design principles combine so that the source of each
  specific value is never in doubt -- no more hunting through confusing layers
  of "overrides" to figure out where data or configuration is specified.

{{< warning >}}
Welcome to CUE -- but be warned ... \
**Prolonged exposure to CUE can seriously affect how you approach data and configuration - for good!**
{{< /warning >}}

*Next page:* [Why CUE?]({{< relref "why-cue" >}})
