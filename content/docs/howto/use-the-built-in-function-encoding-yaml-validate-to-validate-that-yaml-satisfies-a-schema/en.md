---
title: Using the built-in function "encoding/yaml.Validate" to validate that YAML satisfies a schema
tags:
- commented cue
- encodings
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the built-in function
[`encoding/yaml.Validate`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/yaml#Validate)
as a field validator to assert that properly-formed YAML encoded in a string
satisfies a schema in its entirety.

It asserts that all non-optional fields specified in the schema are present in
the YAML data, and that those fields adhere to any constraints specified in the
schema.

{{< warning >}}
`encoding/yaml.Validate` is used to validate YAML data *that is encoded in a
string*.

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

yamlData: yaml.Validate(#schema)
yamlData: """
	a: some string
	b: 15
	"""

#schema: {
	a!: string
	b?: int & >10
	c!: bool // validation failure
}
-- out --
yamlData: invalid value "a: some string\nb: 15" (does not satisfy encoding/yaml.Validate({a!:string,b?:>10 & int,c!:bool})): error in call to encoding/yaml.Validate: field is required but not present:
    ./file.cue:5:11
    ./file.cue:6:11
    ./file.cue:14:2
{{{end}}}

{{< info >}}
`encoding/yaml.Validate` asserts that *all* non-optional fields present in a
schema are also present in the YAML data being validated. It only succeeds in
validating YAML data which unifies successfully with the schema **and where the
result of the unification is concrete**.

The function `encoding/yaml.ValidatePartial` performs a similar check, but
*without* the requirement that the unification result must be concrete. It is
documented in the how-to guide
[Using the built-in function "encoding/yaml.ValidatePartial" to validate
that YAML is compatible with a schema]({{< relref
  "../use-the-built-in-function-encoding-yaml-validatepartial-to-validate-that-yaml-adheres-to-constraints"
>}}).
{{< /info >}}

## Related content

- How to
  [use the built-in function "encoding/yaml.ValidatePartial"]({{< relref
    "../use-the-built-in-function-encoding-yaml-validatepartial-to-validate-that-yaml-adheres-to-constraints"
  >}}) to validate that YAML adheres to constraints
- How to
  [use the built-in function "encoding/json.Validate"]({{< relref
    "../use-the-built-in-function-encoding-json-validate-to-validate-that-json-adheres-to-constraints"
  >}}) to validate that JSON adheres to constraints
- The [`encoding/yaml`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/yaml)
  built-in package
