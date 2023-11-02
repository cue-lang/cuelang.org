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

{{< card href="introduction/" title="Introduction" label=" " >}}
  **A great place to start**\
  Take a quick trip through what's possible with CUE in this introduction
  that's suitable for newcomers to the language
{{< /card >}}

{{< card href="language-guide/" title="Language Guide" label=" " >}}
  **A deep dive into CUE**\
  Follow a detailed learning journey broken down into the different aspects of
  CUE: data, templating, schemas, queries, policy, file organization, and
  interoperability with other languages and encodings
{{< /card >}}

{{< card href="integrations/" title="Integrations" label=" " >}}
  **JSON, YAML, Go, and more**\
  Learn how CUE integrates with a wide ecosystem of formats and tools
{{< /card >}}

{{< card href="tutorial/" title="Tutorials" label=" " >}}
  **CUE techniques and tools**\
  Learn about different language and tooling features through self-contained
  lessons that you can run on your own computer
{{< /card >}}

{{< card href="howto/" title="How-to Guides" label=" " >}}
  **Directions to specific goals**\
  Follow practical steps guiding you through completing tasks with CUE
{{< /card >}}

{{< card href="concept/" title="Concept Guides" label=" " >}}
  **CUE's theory and foundations**\
  Discover the approaches that CUE makes possible by exploring the ideas and
  theory that drive the language
{{< /card >}}

{{< card href="reference/" title="References" label=" " >}}
  **The source of truth**\
  Read the CUE language specification, a glossary of terms, the project's code
  of conduct, and more
{{< /card >}}

{{< /cards >}}
