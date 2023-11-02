---
title: "Documentation"
index_hide: true
cascade:
  header_type: wide
---

# Welcome to CUE!

CUE is an open-source data validation language and inference engine
with its roots in logic programming.
Although the language is not a general-purpose programming language
it supports and simplifies a wide variety of applications, such as
[data validation]({{< relref "concept/data-validation-use-case" >}}),
[configuration]({{< relref "concept/configuration-use-case" >}}),
[querying]({{< relref "language-guide/templating/comprehensions" >}}),
and [code generation]({{< relref "concept/code-generation-and-extraction-use-case" >}}).

<!-- FIXME: add when content is expanded:
[scripting](TODO)       https://github.com/cue-lang/docs-and-content/issues/27
[data templating](TODO) https://github.com/cue-lang/docs-and-content/issues/26
-->

The inference engine can be used to validate
data in code, or to include it as part of a code generation pipeline.

## How to use this documentation

Select a section from the navigation bar on the left hand side of the page, or
from this brief explanation of each section:

{{< cards >}}

{{< card href="introduction/" label="Introduction" title="A great place to start" >}}
  Take a trip through what's possible with CUE, and learn how to install CUE
{{< /card >}}

{{< card href="tour/" label="Tour" title="New to CUE?" >}}
  See CUE's features and syntax up close in this tour that's suitable to
  newcomers to the language
{{< /card >}}

<!-- TODO: replace Tour with LG when LG is more complete

href="language-guide/" label="Language Guide" title="A deep dive into CUE"
Follow a detailed learning journey broken down into the different aspects of
CUE: data, templating, schemas, queries, policy, file organization, and
interoperability with other languages and encodings

-->

{{< card href="integrations/" label="Integrations" title="JSON, YAML, Go, and more" >}}
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
