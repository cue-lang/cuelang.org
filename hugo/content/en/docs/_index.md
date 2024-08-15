---
title: "Documentation"
index_hide: true
cascade:
  header_type: wide
disableNotification: true
---

# Welcome to CUE!

CUE is an
<dfn title='License: "Apache-2.0", DCO: true, CLA: false'>open-source</dfn>
data validation language with its roots in logic programming.
It combines succinct yet clear syntax with powerful, flexible constraints that
enable data, schema, and policy constraints to coexist seamlessly:

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="left" >}}
area:   length * width
area:   <100        // Must be less than 100.
width:  33.3 & >10  // Must be greater than 10.
length: 5 & !=width // Reject square areas.
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIHZldCBleGFtcGxlLmN1ZQ==" >}}
$ cue vet example.cue
area: invalid value 166.5 (out of bound <100):
    ./example.cue:2:9
    ./example.cue:1:9
{{< /code-tab >}}
{{< /code-tabs >}}

CUE supports and simplifies a wide variety of applications, such as
[data validation]({{< relref "concept/how-cue-enables-data-validation" >}}),
[configuration]({{< relref "concept/how-cue-enables-configuration" >}}),
[querying]({{< relref "docs/concept/querying-use-case" >}}),
and [code generation]({{< relref "concept/code-generation-and-extraction-use-case" >}}),
with its underlying inference engine enabling data validation in code, and
flexible generation pipelines.

<!-- TODO: add when content is expanded: -->
<!-- [scripting](TODO)       https://github.com/cue-lang/docs-and-content/issues/27 -->
<!-- [data templating](TODO) https://github.com/cue-lang/docs-and-content/issues/26 -->

## How to use this documentation

Browse through the different documentation sections,
or use the search box in the top-right corner of each page.
Here's what you'll find in each section:

{{< cards >}}

{{< card href="introduction/" label="Introduction" title="A great place to start" >}}
  Take a trip through what's possible with CUE, and learn how to install it on
  your computer
{{< /card >}}

{{< card href="tour/" label="Tour" title="New to CUE?" >}}
  See CUE's features and syntax up close in this tour that's suitable for
  newcomers to the language
{{< /card >}}

<!-- TODO:postLG
{{</* card href="language-guide/" label="Language Guide" title="A deep dive into CUE" */>}}
  Follow a detailed learning journey broken down into the different aspects of
  CUE: data, templating, schemas, queries, policy, file organization, and
  interoperability with other languages and encodings
{{</* /card */>}}
-->

{{< card href="integration/" label="Integrations" title="JSON, YAML, Go, and more" >}}
  Learn how CUE integrates with a wide ecosystem of formats and tools
{{< /card >}}

{{< card href="tutorial/" label="Tutorials" title="Techniques and tools" >}}
  Learn about different language and tooling features through self-contained
  lessons that you can run on your own computer
{{< /card >}}

{{< card href="howto/" label="How-to Guides" title="Directions to specific goals" >}}
  Follow practical steps guiding you through completing tasks with CUE
{{< /card >}}

{{< card href="concept/" label="Concept Guides" title="Theory and foundations" >}}
  Discover the approaches that CUE makes possible by exploring the ideas and
  theory that drive the language
{{< /card >}}

{{< card href="reference/" label="References" title="References" >}}
  Read the CUE language specification, a glossary of terms, the project's code
  of conduct, and other core documents
{{< /card >}}

{{< /cards >}}
