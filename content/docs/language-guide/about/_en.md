---
title: About
weight: 10
draft: false
---

CUE is an extension of JSON that allows you to not only define data, but also
what this data should look like.

JSON, as well as other data languages like YAML, do not provide a way to define
other aspects of configuration like validation, schema, or policy. For that,
users will have to resort to, for instance, JSON Schema, a policy DSL like Rego,
writing code in some programming language, or a combination of the above.

CUE extends JSON to allow users to define all aspects of configuration in a way
that feels like JSON.

CUE can be used for data templating. Unlike many other data templating
languages, such as Jsonnet, CUE is compositional. This means that configurations
can be combined in any order, with a predictable outcome. Without this property,
configuration can quickly grow into a maintenance nightmare.
