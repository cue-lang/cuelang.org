---
title: Tour
weight: 15
index_hide: true
---

Easy-to-follow, bite-sized chunks of CUE ...

{{< cards >}}

{{< card href="basics/" title="New to CUE?" label="The Basics of CUE" >}}
  Begin the tour with an introduction to the most important language features
{{< /card >}}

{{< /cards >}}

<hr>

{{< cards >}}

{{< card href="types/" label="Types and Values" title="types: values" >}}
  CUE merges the concepts of types and values, enabling clear and concise constraints
{{< /card >}}

{{< card href="references/" label="References and Visibility" title="val: other.value + 1" >}}
  A CUE value can be derived from other values, using easy-to-understand references
{{< /card >}}
{{< card href="expressions/" label="Expressions" title="smallVal: 42 & <=val" >}}
  CUE provides a rich set of mechanisms to construct, validate, and process data
{{< /card >}}
{{< card href="packages/" label="Packages and Imports" title="import myConfig" >}}
  Configurations can be separated so they're easier to manage and reason about
{{< /card >}}

{{< /cards >}}

<!-- TODO:postLG
*This tour of CUE is being actively developed, and its contents may migrate
into other sections of the CUE documentation site over time. In particular the
[Language Guide]({{</* relref "docs/language-guide" */>}}) will provide a deep
dive into CUE, covering many of the topics currently included here.*
-->
