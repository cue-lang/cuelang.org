---
title: Using the built-in function "encoding/yaml.ValidatePartial" to validate that YAML adheres to constraints
tags:
- commented cue
- encodings
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the built-in function
[`encoding/yaml.ValidatePartial`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/yaml#ValidatePartial)
as a field validator to assert that properly-formed YAML encoded in a string
adheres to specific constraints by checking that the data and schema unify
successfully.

Successful unification *does not* require that all fields specified in the
schema are present in the YAML data - only that any field present in the data
adheres to the relevant constraints specified in the schema. In particular,
note that
[required field constraints]({{< relref "docs/reference/glossary#required-field-constraint" >}})
in the schema do not have any effect in the context of
`encoding/yaml.ValidatePartial`, as the absence of such a field in the data
does not prevent successful unification.

{{< warning >}}
`encoding/yaml.ValidatePartial` is used to validate YAML data *that is encoded
in a string*.

To validate data stored in a separate `.yaml` file, use CUE's native and
simpler unification instead.\
This is documented in
[validating YAML with CUE]({{< relref "../validate-yaml-using-cue" >}})
{{< /warning >}}

{{{with code "en" "cc"}}}
#location top bottom

! exec cue vet
cmp stderr out
-- file.cue --
package example

import "encoding/yaml"

yamlData: yaml.ValidatePartial(#schema)
yamlData: """
	a: "some string"
	b: 5
	"""

#schema: {
	a!: string
	b!: int & >10 // validation failure
	c?: d!: bool
}
-- out --
yamlData: invalid value "a: \"some string\"\nb: 5" (does not satisfy encoding/yaml.ValidatePartial({a!:string,b!:>10 & int,c?:{d!:bool}})): error in call to encoding/yaml.ValidatePartial: invalid value 5 (out of bound >10):
    ./file.cue:5:11
    ./file.cue:6:11
    ./file.cue:13:12
    yaml.ValidatePartial:2:4
{{{end}}}

## Related content

- How to
  [use the built-in function "encoding/yaml.Validate"]({{< relref
    "../use-the-built-in-function-encoding-yaml-validate-to-validate-that-yaml-satisfies-a-schema"
  >}}) to validate that YAML satifies a schema
- How to
  [use the built-in function "encoding/json.Validate"]({{< relref
    "../use-the-built-in-function-encoding-json-validate-to-validate-that-json-adheres-to-constraints"
  >}}) to validate that JSON adheres to constraints
- The [`encoding/json`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json)
  built-in package
