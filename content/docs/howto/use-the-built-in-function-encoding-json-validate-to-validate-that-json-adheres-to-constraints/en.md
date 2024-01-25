---
title: Using the built-in function "encoding/json.Validate" to validate that JSON adheres to constraints
tags:
- commented cue
- encodings
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the built-in function
[`encoding/json.Validate`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json#Validate)
as a field validator to assert that properly-formed JSON encoded in a string
adheres to specific constraints by checking that the data and schema unify
successfully.

Successful unification *does not* require that all fields specified in the
schema are present in the JSON data - only that any field present in the data
adheres to the relevant constraints specified in the schema. In particular,
note that
[required field constraints]({{< relref "docs/reference/glossary#required-field-constraint" >}})
in the schema do not have any effect in the context of
`encoding/json.Validate`, as the absence of such a field in the data does not
prevent successful unification.

{{< warning >}}
`encoding/json.Validate` is used to validate JSON data *that is encoded in a
string*.

To validate data stored in a separate `.json` file, use CUE's native and
simpler unification instead.\
This is documented in
[validating JSON with CUE]({{< relref "../validate-json-using-cue" >}})
{{< /warning >}}

{{{with code "en" "cc"}}}
#location top bottom

! exec cue vet
cmp stderr out
-- file.cue --
package example

import "encoding/json"

jsonData: json.Validate(#schema)
jsonData: """
	{
		"a": "some string",
		"b": 5
	}
	"""

#schema: {
	a!: string
	b!: int & >10 // validation failure
	c?: d!: bool
}
-- out --
jsonData: invalid value "{\n\t\"a\": \"some string\",\n\t\"b\": 5\n}" (does not satisfy encoding/json.Validate({a!:string,b!:>10 & int,c?:{d!:bool}})): error in call to encoding/json.Validate: invalid value 5 (out of bound >10):
    ./file.cue:5:11
    ./file.cue:6:11
    ./file.cue:15:12
    json.Validate:3:7
{{{end}}}

## Related content

- How to
  [use the built-in function "encoding/yaml.ValidatePartial"]({{< relref
    "../use-the-built-in-function-encoding-yaml-validatepartial-to-validate-that-yaml-adheres-to-constraints"
  >}}) to validate that YAML adheres to constraints
- How to
  [use the built-in function "encoding/yaml.Validate"]({{< relref
    "../use-the-built-in-function-encoding-yaml-validate-to-validate-that-yaml-satisfies-a-schema"
  >}}) to validate that YAML satifies a schema
- The [`encoding/json`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json)
  built-in package
