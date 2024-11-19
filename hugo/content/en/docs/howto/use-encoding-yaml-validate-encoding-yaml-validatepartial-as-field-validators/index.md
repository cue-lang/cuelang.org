---
title: Using "encoding/yaml.Validate" and "encoding/yaml.ValidatePartial" as field validators
tags:
- commented cue
- encodings
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the built-in functions
[`encoding/yaml.Validate`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/yaml#Validate)
and
[`encoding/yaml.ValidatePartial`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/yaml#ValidatePartial)
as field validators.

They assert that properly-formed YAML, encoded in a string, adheres to specific
constraints by checking that the data and schema unify successfully.
`encoding.yaml/Validate` also requires that all non-optional fields are
present.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package example

import "encoding/yaml"

data: """
	a: 1
	b: "two"
	"""

// Validate requires that all non-optional fields in a schema are present in
// data, and that data adheres to schema constraints.
data: yaml.Validate(_outOfBoundsSchema)
data: yaml.Validate(_missingFieldSchema)

// ValidatePartial requires only that data adheres to schema constraints.
data: yaml.ValidatePartial(_outOfBoundsSchema)
data: yaml.ValidatePartial(_missingFieldSchema)

_outOfBoundsSchema: {
	a!: >99 // validation failure for both functions
	b!: string
}
_missingFieldSchema: {
	a!: int
	b!: string
	c!: bool // validation failure for yaml.Validate only
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldA==" >}}
$ cue vet
data: invalid value "a: 1\nb: \"two\"" (does not satisfy encoding/yaml.Validate): error in call to encoding/yaml.Validate: invalid value 1 (out of bound >99):
    ./file.cue:12:7
    ./file.cue:5:7
    ./file.cue:13:7
    ./file.cue:16:7
    ./file.cue:17:7
    ./file.cue:20:6
    yaml.Validate:1:4
data: invalid value "a: 1\nb: \"two\"" (does not satisfy encoding/yaml.Validate): error in call to encoding/yaml.Validate: field is required but not present:
    ./file.cue:13:7
    ./file.cue:5:7
    ./file.cue:12:7
    ./file.cue:16:7
    ./file.cue:17:7
    ./file.cue:26:2
data: invalid value "a: 1\nb: \"two\"" (does not satisfy encoding/yaml.ValidatePartial): error in call to encoding/yaml.ValidatePartial: invalid value 1 (out of bound >99):
    ./file.cue:16:7
    ./file.cue:5:7
    ./file.cue:12:7
    ./file.cue:13:7
    ./file.cue:17:7
    ./file.cue:20:6
    yaml.ValidatePartial:1:4
{{< /code-tab >}}
{{< /code-tabs >}}

{{< info >}}
These functions validate YAML data *that is encoded in a string*.

To validate data stored in a separate `.yaml` file, use CUE's native and
simpler unification instead.\
This is documented in
{{< linkto/inline "howto/validate-yaml-using-cue" >}}
{{< /info >}}

## Related content

- {{< linkto/related/howto "use-encoding-json-validate-as-a-field-validator" >}}
- The [`encoding/yaml`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/yaml)
  built-in package
