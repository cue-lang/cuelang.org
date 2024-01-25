---
title: Using the built-in function "encoding/yaml.Validate" to validate that YAML adheres to a schema
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
as a field validator to assert that a string containing properly-formed YAML
adheres to a specific schema.

{{< warning >}}
`yaml.Validate` is used to validate YAML data *that is encoded in a string*.

To validate data stored in a separate `.yaml` file, use CUE's native and
simpler unification instead.\
This is documented in
[validating YAML with CUE]({{< relref "../validate-yaml-using-cue" >}})
{{< /warning >}}

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue"  area="top" >}}
package p

import "encoding/yaml"

yamlData: yaml.Validate(#schema)
yamlData: """
	a: some string
	b: 5
	"""

#schema: {
	a?: string
	b?: int & >10 // validation failure
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="bottom" >}}
$ cue vet file.cue
yamlData: invalid value "a: some string\nb: 5" (does not satisfy encoding/yaml.Validate({a?:string,b?:>10 & int})): error in call to encoding/yaml.Validate: invalid value 5 (out of bound >10):
    ./file.cue:5:11
    ./file.cue:6:11
    ./file.cue:13:12
    yaml.Validate:2:4
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content
  
- How to [use the built-in function "encoding/json.Validate"]({{< relref
    "../use-the-built-in-function-encoding-json-validate-to-validate-that-json-adheres-to-a-schema"
  >}}) to validate that JSON adheres to a schema
- The [`encoding/yaml`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/yaml)
  built-in package
