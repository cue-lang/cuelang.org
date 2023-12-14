---
title: Glossary of terms
weight: 20
toc_hide: false
---

{{< step group="glossary" stepNumber="A" >}}

## `and()` {#and-builtin-function}
🔗 [Language Spec]({{< relref "docs/reference/spec#and" >}})
|  [Howto Guide]({{< relref "docs/howto/use-the-builtin-function-and" >}})
- A [builtin function]({{< relref "#builtin-functions" >}}) that accepts a list
  and returns the unification of all elements in the list

{{< /step >}}

{{< step group="glossary" stepNumber="B" >}}

## `bool` {#bool-type}
🔗 [Language Spec]({{< relref "docs/reference/spec#boolean-values" >}})
- A primitive [type]({{< relref "#type" >}}) representing the set of Boolean
  truth values denoted by the keywords `true` and `false`

## Builtin functions
🔗 [Language Spec]({{< relref "docs/reference/spec#builtin-functions" >}})
|  *e.g.*
   [`and()`]({{< relref "#and-builtin-function" >}})
/  [`close()`]({{< relref "#close-builtin-function" >}})
/  [`div()`]({{< relref "#div-builtin-function" >}})
/  [`mod()`]({{< relref "#mod-builtin-function" >}})
/  [`len()`]({{< relref "#len-builtin-function" >}})
/  [`or()`]({{< relref "#or-builtin-function" >}})
/  [`quo()`]({{< relref "#quo-builtin-function" >}})
/  [`rem()`]({{< relref "#rem-builtin-function" >}})
- Predeclared functions provided by the CUE runtime that are available without
  being imported

## `bytes` {#bytes-type}
🔗 [Language Guide]({{< relref "docs/language-guide/data/bytes-values" >}})
|  [Language Spec]({{< relref "docs/reference/spec#bytes" >}})
|  [Tour]({{< relref "docs/tour/types/bytes" >}})
- A primitive [type]({{< relref "#type" >}}) representing a possibly empty
  sequence of arbitrary bytes

{{< /step >}}

{{< step group="glossary" stepNumber="C" >}}

## `close()` {#close-builtin-function}
🔗 [Language Spec]({{< relref "docs/reference/spec#close" >}})
|  [Howto Guide]({{< relref "docs/howto/use-the-builtin-function-close" >}})
- A [builtin function]({{< relref "#builtin-functions" >}}) that converts a
  partially defined ("open") struct to a fully defined ("closed") struct

<!-- TODO ## Closed -->

{{< /step >}}

{{< step group="glossary" stepNumber="D" >}}

## Default value
🔗 [Language Guide]({{< relref "docs/language-guide/schemas-and-validation/disjunctions#default-values" >}})
|  [Howto Guide]({{< relref "docs/howto/specify-a-default-value-for-a-field" >}})
- The single element of a disjunction that CUE assigns to a field if *and only
  if* unification fails to resolve a concrete value for the field
- An element of a disjunction prefixed with an asterisk (`*`)

## Disjunction
🔗 [Language Guide]({{< relref "docs/language-guide/schemas-and-validation/disjunctions" >}})
|  [Tour #1]({{< relref "docs/tour/types/disjunctions" >}})
|  [Tour #2]({{< relref "docs/tour/types/sumstruct" >}})

## `div()` {#div-builtin-function}
🔗 [Language Spec]({{< relref "docs/reference/spec#div-mod-quo-and-rem" >}})
|  [Howto Guide]({{< relref "docs/howto/use-the-builtin-functions-div-mod-quo-rem" >}})
- A [builtin function]({{< relref "#builtin-functions" >}}) that performs
  Euclidean division with its parameters and returns the integer quotient

{{< /step >}}

{{< step group="glossary" stepNumber="E" >}}
{{< /step >}}

{{< step group="glossary" stepNumber="F" >}}

## Field
🔗 [Language Guide]({{< relref "docs/language-guide/data/maps-and-fields" >}})
- A key-value pair inside a map, associating a value with a given set of keys

## Field constraint
🔗 [Language Guide]({{< relref "docs/language-guide/schemas-and-validation/field-constraints" >}})
|  [Language Spec]({{< relref "docs/reference/spec#field-constraints" >}})
- A field constraint restricts a field's value without actually defining the
  field, with the field only forming part of the output if it is successfully
  unified with a concrete value
- *see also:*
    [Required field constraint]({{< relref "#required-field-constraint" >}})
  | [Optional field constraint]({{< relref "#optional-field-constraint" >}})

## `float` {#float-type}
🔗 [Language Spec]({{< relref "docs/reference/spec#numeric-values" >}})
|  [Tour]({{< relref "docs/tour/types/numbers" >}})
- A primitive [type]({{< relref "#type" >}}) representing the set of all
  decimal floating-point numbers

{{< /step >}}

{{< step group="glossary" stepNumber="G" >}}
{{< /step >}}

{{< step group="glossary" stepNumber="H" >}}
{{< /step >}}

{{< step group="glossary" stepNumber="I" >}}

## `int` {#int-type}
🔗 [Language Guide]({{< relref "docs/language-guide/data/numeric-values" >}})
|  [Language Spec]({{< relref "docs/reference/spec#numeric-values" >}})
|  [Tour]({{< relref "docs/tour/types/numbers" >}})
- A primitive [type]({{< relref "#type" >}}) representing the set of all
  integer numbers

{{< /step >}}

{{< step group="glossary" stepNumber="J" >}}

## JSON
🔗 [json.org](https://www.json.org/)
- "A lightweight data-interchange format ... easy for humans to read and write
  [and] easy for machines to parse and generate." -- json.org
- A data format understood by the `cue` CLI, which can both parse and emit JSON
  as input and output

{{< /step >}}

{{< step group="glossary" stepNumber="K" >}}
{{< /step >}}

{{< step group="glossary" stepNumber="L" >}}

## `len()` {#len-builtin-function}
🔗 [Language Spec]({{< relref "docs/reference/spec#len" >}})
|  [Howto Guide]({{< relref "docs/howto/use-the-builtin-function-len" >}})
- A [builtin function]({{< relref "#builtin-functions" >}}) that returns the
  lengths of various types as an integer

## List
🔗 [Language Guide]({{< relref "docs/language-guide/data/lists" >}})
|  [Language Spec]({{< relref "docs/reference/spec#lists" >}})
|  [Tour]({{< relref "docs/tour/types/lists" >}})
- An arbitrary sequence of CUE values, enclosed in square brackets (`[` `]`)
  with values separated by commas (`,`)

{{< /step >}}

{{< step group="glossary" stepNumber="M" >}}

## `mod()` {#mod-builtin-function}
🔗 [Language Spec]({{< relref "docs/reference/spec#div-mod-quo-and-rem" >}})
|  [Howto Guide]({{< relref "docs/howto/use-the-builtin-functions-div-mod-quo-rem" >}})
- A [builtin function]({{< relref "#builtin-functions" >}}) that performs
  Euclidean division with its parameters and returns the integer remainder

<!-- TODO ## Module -->

{{< /step >}}

{{< step group="glossary" stepNumber="N" >}}

## `null` {#null-type}
🔗 [Language Spec]({{< relref "docs/reference/spec#null" >}})
- A primitive [type]({{< relref "#type" >}}) whose only value, the *null
  value*, is represented with the keyword `null`. Comparable with itself and
  any other type, the comparison with a `null` value always being equal and the
  comparison with any other type always being unequal

## `number` {#number-type}
🔗 [Language Spec]({{< relref "docs/reference/spec#numeric-values" >}})
|  [Tour]({{< relref "docs/tour/types/numbers" >}})
- A generic primitive [type]({{< relref "#type" >}}) representing the set of
  all members of both [`int`]({{< relref "#int-type" >}}) and
  [`float`]({{< relref "#float-type" >}}) types

{{< /step >}}

{{< step group="glossary" stepNumber="O" >}}

<!-- TODO ## Open -->

## Optional field constraint
🔗 [Language Guide]({{< relref "docs/language-guide/schemas-and-validation/field-constraints#optional-field-constraints" >}})
|  [Howto Guide]({{< relref "docs/howto/mark-a-field-as-optional" >}})
- A [field constraint]({{< relref "#field-constraint" >}}) that restricts the
  field's value if the field is present, whilst also permitting the field's
  absence

## `or()` {#or-builtin-function}
🔗 [Language Spec]({{< relref "docs/reference/spec#or" >}})
|  [Howto Guide]({{< relref "docs/howto/use-the-builtin-function-or" >}})
- A [builtin function]({{< relref "#builtin-functions" >}}) that accepts a list
  and produces a [disjunction]({{< relref "#disjunction" >}})

{{< /step >}}

{{< step group="glossary" stepNumber="P" >}}

<!-- TODO ## Package -->

{{< /step >}}

{{< step group="glossary" stepNumber="Q" >}}

## `quo()` {#quo-builtin-function}
🔗 [Language Spec]({{< relref "docs/reference/spec#div-mod-quo-and-rem" >}})
|  [Howto Guide]({{< relref "docs/howto/use-the-builtin-functions-div-mod-quo-rem" >}})
- A [builtin function]({{< relref "#builtin-functions" >}}) that performs
  truncated division with its parameters and returns the integer quotient

{{< /step >}}

{{< step group="glossary" stepNumber="R" >}}

## "Raw" strings
🔗 [Language Guide]({{< relref "docs/language-guide/data/string-values#alternate-escape-sequences" >}})
|  [Language Spec]({{< relref "docs/reference/spec#string-and-byte-sequence-literals" >}})
|  [Tour]({{< relref "docs/tour/types/stringraw" >}})
- A [`string`]({{< relref "#string-type" >}}) literal enclosed with an equal
  number of hashes on both sides, allowing escape sequences to appear inside
  the text verbatim, without their usual escaping taking effect

## `rem()` {#rem-builtin-function}
🔗 [Language Spec]({{< relref "docs/reference/spec#div-mod-quo-and-rem" >}})
|  [Howto Guide]({{< relref "docs/howto/use-the-builtin-functions-div-mod-quo-rem" >}})
- A [builtin function]({{< relref "#builtin-functions" >}}) that performs
  truncated division with its parameters and returns the integer remainder

## Required field constraint
🔗 [Language Guide]({{< relref "docs/language-guide/schemas-and-validation/field-constraints#required-field-constraints" >}})
|  [Howto Guide]({{< relref "docs/howto/mark-a-field-as-required" >}})
- A [field constraint]({{< relref "#field-constraint" >}}) that restricts the
  field's value whilst also requiring the field to be present

{{< /step >}}

{{< step group="glossary" stepNumber="S" >}}

## `string` {#string-type}
🔗 [Language Guide]({{< relref "docs/language-guide/data/string-values" >}})
|  [Language Spec]({{< relref "docs/reference/spec#strings" >}})
|  [Tour]({{< relref "docs/tour/types/stringlit" >}})
- A primitive [type]({{< relref "#type" >}}) representing the set of UTF-8
  strings
- *see also:* [Raw strings]({{< relref "#raw-strings" >}})

## Struct {#struct-type}
🔗 [Language Guide]({{< relref "docs/language-guide/data/maps-and-fields" >}})
|  [Language Spec]({{< relref "docs/reference/spec#structs" >}})
|  [Tour]({{< relref "docs/tour/types/optional" >}})
<!-- Link to this section? [Language Spec]({{< relref "docs/reference/spec#values-1" >}}) -->
- A composite type representing a set of elements (called fields) each of which
  has a name (called a label) and a value

{{< /step >}}

{{< step group="glossary" stepNumber="T" >}}

## Type
🔗 [Language Guide]({{< relref "docs/language-guide/schemas-and-validation/types" >}})
|  [Tour]({{< relref "docs/tour/types/types" >}})

<!-- TODO ## Type Constraint -->

{{< /step >}}

{{< step group="glossary" stepNumber="U" >}}

## Unification
🔗 [Language Spec]({{< relref "docs/reference/spec#unification" >}})

{{< /step >}}

{{< step group="glossary" stepNumber="V" >}}
{{< /step >}}

{{< step group="glossary" stepNumber="W" >}}
{{< /step >}}

{{< step group="glossary" stepNumber="X" >}}
{{< /step >}}

{{< step group="glossary" stepNumber="Y" >}}

## YAML
🔗 [yaml.org](https://yaml.org/)
- "YAML is a human-friendly data serialization language for all programming
  languages" -- yaml.org
- A data format understood by the `cue` CLI, which can both parse and emit YAML
  as input and output

{{< /step >}}

{{< step group="glossary" stepNumber="Z" >}}
{{< /step >}}

{{< step group="glossary" stepNumber="#" >}}
{{< /step >}}
