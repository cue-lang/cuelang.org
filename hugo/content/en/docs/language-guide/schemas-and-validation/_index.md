---
title: Schemas and Validation
weight: 50
draft: false
---

A {{{def "schema"}}} defines the shape of an API or data in general.
Schemas define types or APIs that can be used to validate JSON, YAML, or CUE
data, for instance.

Schemas definitions have names that start with `#`.
It tells CUE to treat them different in several ways, as we will see.
This sets them apart from templates, policy or other uses of CUE.
