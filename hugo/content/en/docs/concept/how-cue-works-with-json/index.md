---
title: How CUE works with JSON
tags:
- encodings
- cue command
authors:
- jpluscplusm
toc_hide: true
aliases:
- json
---

## Reading and writing JSON

[CUE is a superset of JSON]({{< relref "docs/tour/basics/json-superset" >}}).
In other words: *all valid JSON is CUE*.

The `cue` tool natively supports reading and writing JSON files. In fact, JSON
is its default output format.

This allows JSON files to be processed by CUE's wide range of data, schema, and
policy validation capabilities, and to convert input formats to JSON - as
demonstrated here by
[`cue export`]({{< relref "docs/reference/command/cue-help-export" >}})
*unifying* all its JSON, YAML, and CUE input files as JSON:
<!-- TODO: add links for capabilities -->
<!-- TODO: add link to unification concept guide -->

{{< code-tabs >}}
{{< code-tab name="data.json" language="json" area="left" >}}
{
    "a": 1,
    "b": "2",
    "c": "three",
    "d": 4.4
}
{{< /code-tab >}}
{{< code-tab name="data.yml" language="yml" area="left" >}}
e: 5
f: "6"
{{< /code-tab >}}
{{< code-tab name="data.cue" language="cue" area="left" >}}
g: "seven"
h: 4.4 * 2
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBkYXRhLmpzb24gZGF0YS55bWwgZGF0YS5jdWU=" >}}
$ cue export data.json data.yml data.cue
{
    "a": 1,
    "b": "2",
    "c": "three",
    "e": 5,
    "g": "seven",
    "d": 4.4,
    "f": "6",
    "h": 8.8
}
{{< /code-tab >}}
{{< /code-tabs >}}

In addition to JSON, `cue` can read and write
[a range of other formats]({{< relref "docs/integration" >}}).

## Validating JSON files against a schema

CUE is often used to make systems safer without having to teach the underlying
system components about CUE. Because the `cue` tool can validate JSON files
using CUE's powerful and compact constraint syntax, it's easy to add
"pre-flight" checks to existing processes with CUE.

In this example,
[`cue vet`]({{< relref "docs/reference/command/cue-help-vet" >}})
is used to check that a hypothetical system's JSON input files are valid - and
catches a problematic deployment early in the process:

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue" area="top-left" >}}
import "strings"

#Config: {
	cluster!:    strings.MaxRunes(16)
	region!:     #Region
	repository!: =~#"^source\.company\.example/"#
	tags?: [...#Tags]
}
#Region: "APAC" | "IMEA"
#Tags:   "prod" | "stage" | "qa" | "test" | "dev"
{{< /code-tab >}}
{{< code-tab name="config-a.json" language="json" area="top-right" >}}
{
    "cluster": "live05",
    "region": "IMEA",
    "repository": "source.company.example/alpha",
    "tags": [
        "prod"
    ]
}
{{< /code-tab >}}
{{< code-tab name="config-b.json" language="json" area="top-right" >}}
{
    "cluster": "live03333333333333",
    "repository": "github.com/Alex_Personal_Account/alpha-fork",
    "region": "UK",
    "tags": [
        "dev"
    ]
}
{{< /code-tab >}}
{{< code-tab name="config-c.json" language="json" area="top-right" >}}
{
    "cluster": "live05",
    "region": "APAC",
    "repository": "source.company.example/alpha"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCBzY2hlbWEuY3VlIC1kICcjQ29uZmlnJyBjb25maWctYS5qc29uIGNvbmZpZy1iLmpzb24gY29uZmlnLWMuanNvbg==" >}}
$ cue vet schema.cue -d '#Config' config-a.json config-b.json config-c.json
region: 2 errors in empty disjunction:
region: conflicting values "APAC" and "UK":
    ./config-b.json:4:15
    ./schema.cue:5:15
    ./schema.cue:9:10
region: conflicting values "IMEA" and "UK":
    ./config-b.json:4:15
    ./schema.cue:5:15
    ./schema.cue:9:19
cluster: invalid value "live03333333333333" (does not satisfy strings.MaxRunes(16)):
    ./schema.cue:4:15
    ./config-b.json:2:16
    ./schema.cue:4:32
repository: invalid value "github.com/Alex_Personal_Account/alpha-fork" (out of bound =~"^source\\.company\\.example/"):
    ./schema.cue:6:15
    ./config-b.json:3:19
{{< /code-tab >}}
{{< /code-tabs >}}

Learn more in the How-to guide {{< linkto/inline "howto/validate-json-using-cue" >}}.

## Processing and transforming JSON files

The `cue` tool can read and transform JSON files, producing output data in any
shape that's required. For example:

{{< code-tabs >}}
{{< code-tab name="data.json" language="json" area="top-right" >}}
{
    "a": 5,
    "b": 4
}
{{< /code-tab >}}
{{< code-tab name="transform.cue" language="cue" area="top-left" >}}
a: int
b: int
c: 1 + a*b
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCBkYXRhLmpzb24gdHJhbnNmb3JtLmN1ZQ==" >}}
$ cue export data.json transform.cue
{
    "a": 5,
    "b": 4,
    "c": 21
}
{{< /code-tab >}}
{{< /code-tabs >}}

Learn more about transforming data with CUE in these How-to guides:

- {{< linkto/inline "howto/transform-json-with-cue" >}}
- {{< linkto/inline "howto/combine-multiple-json-files-into-a-list" >}}
- {{< linkto/inline "howto/combine-multiple-json-files-by-using-file-metadata" >}}

## Embedding JSON in CUE

CUE is frequently used to generate configuration files. Some systems allow
their configuration files to contain JSON embedded inside string fields,
irrespective of the file's main data format.

CUE's standard library provides
[a built-in `json` package](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json)
containing functions that generate, parse, validate, and format JSON from
within CUE - some of which are shown here.

### Generating embedded JSON

In this example a *Kubernetes ConfigMap* contains a JSON file encoded as a
single string field, embedded inside YAML. This is enabled by the
`json.Marshal` function:

{{< code-tabs >}}
{{< code-tab name="config.cue" language="cue" area="top-left" >}}
import "encoding/json"

configMap: data: "point.json": json.Marshal({
	x: 1.2
	y: 3.45
})
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBjb25maWcuY3VlIC0tb3V0IHlhbWw=" >}}
$ cue export config.cue --out yaml
configMap:
  data:
    point.json: '{"x":1.2,"y":3.45}'
{{< /code-tab >}}
{{< /code-tabs >}}

### Parsing embedded JSON

The `json.Unmarshal` function performs the reverse operation to `json.Marshal`:
it turns a string containing embedded JSON into the structure represented by
the underlying data.

Here, a *JSON Web Token* is emitted as YAML:

{{< code-tabs >}}
{{< code-tab name="token.cue" language="cue" area="top-left" >}}
import "encoding/json"

_jwt: {
	header: #"{"alg":"HS256","typ":"JWT"}"#
	payload: """
		{
		  "sub": "1234567890",
		  "name": "John Doe",
		  "iat": 1516239022
		}
		"""
}
output: header:  json.Unmarshal(_jwt.header)
output: payload: json.Unmarshal(_jwt.payload)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCB0b2tlbi5jdWUgLS1vdXQgeWFtbA==" >}}
$ cue export token.cue --out yaml
output:
  header:
    alg: HS256
    typ: JWT
  payload:
    sub: "1234567890"
    name: John Doe
    iat: 1516239022
{{< /code-tab >}}
{{< /code-tabs >}}

### Validating embedded JSON

The `json.Validate` function allows embedded JSON to be validated against
native CUE schema constraints.

Here, each member of the `item` map is checked against the `#Dimensions`
schema. The `cue` tool correctly catches and flags up two problems with the
data:

{{< code-tabs >}}
{{< code-tab name="furniture.cue" language="cue" area="top" >}}
import "encoding/json"

#Dimensions: {
	width:  number
	depth:  number
	height: number
}

// Validate each member of the map against a schema.
item: [string]: json.Validate(#Dimensions)

// bed is correctly specified.
item: bed: #"{ "width": 2, "height": 0.1, "depth": 2 }"#
// table's width is incorrectly specified as a string.
item: table: #"{ "width": "34", "height": 23, "depth": 0.2 }"#
// painting's height field name is incorrectly upper-cased.
item: painting: #"{ "width": 34, "HEIGHT": 12, "depth": 0.2 }"#
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCBmdXJuaXR1cmUuY3Vl" >}}
$ cue vet furniture.cue
item.painting: invalid value "{ \"width\": 34, \"HEIGHT\": 12, \"depth\": 0.2 }" (does not satisfy encoding/json.Validate({width:number,depth:number,height:number})): error in call to encoding/json.Validate: field not allowed:
    ./furniture.cue:10:17
    ./furniture.cue:3:14
    ./furniture.cue:17:17
    json.Validate:1:1
    json.Validate:1:16
item.table: invalid value "{ \"width\": \"34\", \"height\": 23, \"depth\": 0.2 }" (does not satisfy encoding/json.Validate({width:number,depth:number,height:number})): error in call to encoding/json.Validate: conflicting values number and "34" (mismatched types number and string):
    ./furniture.cue:10:17
    ./furniture.cue:4:10
    ./furniture.cue:15:14
    json.Validate:1:1
    json.Validate:1:12
{{< /code-tab >}}
{{< /code-tabs >}}

### Other `json` functions

The
[`json` package](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json)
contains other useful functions, including those that format JSON specifically
for humans to read, or for machines to consume. These functions are
demonstrated in guides that you can discover through the site's search page:
&#x1F50D;&nbsp;
[search for how-to guides mentioning "encoding/json"](/search/?q=encoding/json%20contentType:%22How-to%20Guides%22)

## Converting JSON files to CUE

Because
[every valid JSON file is also a CUE file]({{< relref "docs/tour/basics/json-superset" >}}),
one very easy way to convert JSON files to CUE is simply to rename them from
`.json` to `.cue`!

In more complex situations
[`cue import`]({{< relref "docs/reference/command/cue-help-import" >}})
can create a CUE file for each JSON file it's given, and can even recognise
embedded YAML and JSON fields, and convert those structures recursively.

Examples of this command being used can be found in the
[`cue import` CLI reference documentation]({{< relref "docs/reference/command/cue-help-import" >}}).

<!-- TODO: refer to a better page than the plain text CLI help text -->
<!-- TODO: what example could work inline, here? -->

## Related content

- {{< linkto/related/concept "how-cue-works-with-yaml" >}}
