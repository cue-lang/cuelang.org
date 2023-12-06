---
title: Glossary of terms
weight: 20
toc_hide: false
---

{{< step group="glossary" stepNumber="A" >}}

## `and()` {#and-builtin-function}
  [Language Spec]({{< relref "docs/reference/spec#and" >}})
| [Howto Guide]({{< relref "docs/howto/use-the-builtin-function-and" >}})
- A [builtin function]({{< relref "#builtin-functions" >}}) that accepts a list
  and returns the unification of all elements in the list

{{< /step >}}

{{< step group="glossary" stepNumber="B" >}}

## Builtin functions
  [Language Spec]({{< relref "docs/reference/spec#builtin-functions" >}})
| *e.g.*
  [`and()`]({{< relref "#and-builtin-function" >}})
/ [`close()`]({{< relref "#close-builtin-function" >}})
/ [`or()`]({{< relref "#or-builtin-function" >}})
- Predeclared functions provided by the CUE runtime that are available without
  being imported

{{< /step >}}

{{< step group="glossary" stepNumber="C" >}}

## `close()` {#close-builtin-function}
  [Language Spec]({{< relref "docs/reference/spec#close" >}})
| [Howto Guide]({{< relref "docs/howto/use-the-builtin-function-close" >}})
- A [builtin function]({{< relref "#builtin-functions" >}}) that converts a
  partially defined ("open") struct to a fully defined ("closed") struct

<!-- TODO ## Closed -->

{{< /step >}}

{{< step group="glossary" stepNumber="D" >}}

## Default value
  [Language Guide]({{< relref "docs/language-guide/schemas-and-validation/disjunctions#default-values" >}})
| [Howto Guide]({{< relref "docs/howto/specify-a-default-value-for-a-field" >}})
- The single element of a multi-element disjunction that CUE assigns to a field
  if unification fails to resolve a concrete value for the field
- An element of a disjunction prefixed with an asterisk (`*`)

## Disjunction
  [Language Guide]({{< relref "docs/language-guide/schemas-and-validation/disjunctions" >}})
| [Tour #1]({{< relref "docs/tour/types/disjunctions" >}})
| [Tour #2]({{< relref "docs/tour/types/sumstruct" >}})

{{< /step >}}

{{< step group="glossary" stepNumber="E" >}}
{{< /step >}}

{{< step group="glossary" stepNumber="F" >}}

## Field
  [Language Guide]({{< relref "docs/language-guide/data/maps-and-fields" >}})
- A key-value pair inside a map, associating a value with a given set of keys

## Field constraint
  [Language Guide]({{< relref "docs/language-guide/schemas-and-validation/field-constraints" >}})
- A field constraint restricts a field's value without actually defining the
  field, and with the field only forming part of the output if it is unified
  with an actual field
- see also:
    [Required field constraint]({{< relref "#required-field-constraint" >}})
  | [Optional field constraint]({{< relref "#optional-field-constraint" >}})

{{< /step >}}

{{< step group="glossary" stepNumber="G" >}}
{{< /step >}}

{{< step group="glossary" stepNumber="H" >}}
{{< /step >}}

{{< step group="glossary" stepNumber="I" >}}
{{< /step >}}

{{< step group="glossary" stepNumber="J" >}}
{{< /step >}}

{{< step group="glossary" stepNumber="K" >}}
{{< /step >}}

{{< step group="glossary" stepNumber="L" >}}
{{< /step >}}

{{< step group="glossary" stepNumber="M" >}}

<!-- TODO
## Module
-->

{{< /step >}}

{{< step group="glossary" stepNumber="N" >}}
{{< /step >}}

{{< step group="glossary" stepNumber="O" >}}

<!-- TODO ## Open -->

## Optional field constraint
  [Language Guide]({{< relref "docs/language-guide/schemas-and-validation/field-constraints#optional-field-constraints" >}})
| [Howto Guide]({{< relref "docs/howto/mark-a-field-as-optional" >}})
- A [field constraint]({{< relref "#field-constraint" >}}) that restricts the
  field's value if the field is present, whilst also permitting the field's
  absence

## `or()` {#or-builtin-function}
  [Language Spec]({{< relref "docs/reference/spec#or" >}})
| [Howto Guide]({{< relref "docs/howto/use-the-builtin-function-or" >}})
- A [builtin function]({{< relref "#builtin-functions" >}}) that accepts a list
  and produces a [disjunction]({{< relref "#disjunction" >}})

{{< /step >}}

{{< step group="glossary" stepNumber="P" >}}

<!-- TODO
## Package
-->

{{< /step >}}

{{< step group="glossary" stepNumber="Q" >}}
{{< /step >}}

{{< step group="glossary" stepNumber="R" >}}

## Required field constraint
  [Language Guide]({{< relref "docs/language-guide/schemas-and-validation/field-constraints#required-field-constraints" >}})
| [Howto Guide]({{< relref "docs/howto/mark-a-field-as-required" >}})
- A [field constraint]({{< relref "#field-constraint" >}}) that restricts the
  field's value whilst also requiring the field to be present

{{< /step >}}

{{< step group="glossary" stepNumber="S" >}}

## Struct
- A set of elements, called fields, each of which has a name and a value

{{< /step >}}

{{< step group="glossary" stepNumber="T" >}}

<!-- TODO
## Type
-->

<!-- TODO
## Type Constraint
-->

{{< /step >}}

{{< step group="glossary" stepNumber="U" >}}

<!-- TODO
## Unification
-->

{{< /step >}}

{{< step group="glossary" stepNumber="V" >}}
{{< /step >}}

{{< step group="glossary" stepNumber="W" >}}
{{< /step >}}

{{< step group="glossary" stepNumber="X" >}}
{{< /step >}}

{{< step group="glossary" stepNumber="Y" >}}

## YAML
- "YAML is a human-friendly data serialization language for all programming languages" ([yaml.org](https://yaml.org/))
- A data format understood by the `cue` CLI, which can both parse and emit YAML as input and output

{{< /step >}}

{{< step group="glossary" stepNumber="Z" >}}
{{< /step >}}

{{< step group="glossary" stepNumber="#" >}}
{{< /step >}}


