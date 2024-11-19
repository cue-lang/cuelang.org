---
title: Using "encoding/json.Validate" as a field validator
tags:
- commented cue
- encodings
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the built-in function
[`encoding/json.Validate`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json#Validate)
as a field validator.

It asserts that properly-formed JSON, encoded in a string, adheres to specific
constraints by checking that the data and schema unify successfully.

{{{with code "en" "cc"}}}
#location top bottom

! exec cue vet
cmp stderr out
-- file.cue --
package example

import "encoding/json"

data: """
	{
	  "a": 1,
	  "b": "two"
	}
	"""

// Validate requires only that data adheres to schema constraints.
// Missing fields do not cause validation failures.
data: json.Validate(_outOfBoundsSchema)
data: json.Validate(_missingFieldSchema)

_outOfBoundsSchema: {
	a!: >99 // validation failure
	b!: string
}
_missingFieldSchema: {
	a!: int
	b!: string
	c!: bool // NOT a validation failure
}
-- out --
data: invalid value "{\n  \"a\": 1,\n  \"b\": \"two\"\n}" (does not satisfy encoding/json.Validate): error in call to encoding/json.Validate: invalid value 1 (out of bound >99):
    ./file.cue:14:7
    ./file.cue:5:7
    ./file.cue:15:7
    ./file.cue:18:6
    json.Validate:2:8
{{{end}}}

{{< info >}}
`encoding/json.Validate` validates JSON data *that is encoded in a string*.

To validate data stored in a separate `.json` file, use CUE's native and
simpler unification instead.\
This is documented in
{{< linkto/inline "howto/validate-json-using-cue" >}}
{{< /info >}}

## Related content

- {{< linkto/related/howto "use-encoding-yaml-validate-encoding-yaml-validatepartial-as-field-validators" >}}
- The [`encoding/json`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json)
  built-in package
