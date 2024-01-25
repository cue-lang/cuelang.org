---
title: Using the built-in function "encoding/json.Validate" to validate that JSON adheres to a schema
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
as a field validator to assert that a string containing properly-formed JSON
adheres to a specific schema.

{{< warning >}}
`json.Validate` is used to validate JSON data *that is encoded in a string*.

To validate data stored in a separate `.json` file, use CUE's native and
simpler unification instead.\
This is documented in
[validating JSON with CUE]({{< relref "../validate-json-using-cue" >}})
{{< /warning >}}

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue"  area="top" >}}
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
	a?: string
	b?: int & >10 // validation failure
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="bottom" >}}
$ cue vet file.cue
jsonData: invalid value "{\n\t\"a\": \"some string\",\n\t\"b\": 5\n}" (does not satisfy encoding/json.Validate({a?:string,b?:>10 & int})): error in call to encoding/json.Validate: invalid value 5 (out of bound >10):
    ./file.cue:5:11
    ./file.cue:6:11
    ./file.cue:15:12
    json.Validate:3:7
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- How to [use the built-in function "encoding/yaml.Validate"]({{< relref
    "../use-the-built-in-function-encoding-yaml-validate-to-validate-that-yaml-adheres-to-a-schema"
  >}}) to validate that YAML adheres to a schema
- The [`encoding/json`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json)
  built-in package
