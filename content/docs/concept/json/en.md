---
title: How CUE works with JSON
tags:
- encodings
- cue command
authors:
- jpluscplusm
toc_hide: true
---

## Reading and writing JSON

[CUE is a superset of JSON]({{< relref "docs/tour/basics/json-superset" >}}).
Or, put differently, all valid JSON is CUE.

Because all JSON files are CUE files they can be read by the `cue` tool,
allowing them to be processed by CUE's wide range of data, schema, and policy
validation capabilities.
<!-- TODO: add links for capabilities -->

The `cue` tool can also **generate** JSON. In fact, JSON is its default output
format.

This makes it trivial to convert input formats into JSON - demonstrated here by
`cue` **unifying** all its input files:
<!-- TODO: add link to unification concept guide -->

{{{with code "en" "basic export"}}}
#location right right right right left

exec cue export data.yml data.yaml data.json data.cue
cmp stdout out
-- data.yml --
a: 1
b: "2"
-- data.yaml --
c: "three"
d: 4.4
-- data.json --
{
    "e": 5,
    "f": "6"
}
-- data.cue --
g: "seven"
h: 4.4 * 2
-- out --
{
    "e": 5,
    "c": "three",
    "a": 1,
    "g": "seven",
    "f": "6",
    "d": 4.4,
    "b": "2",
    "h": 8.8
}
{{{end}}}

In addition to JSON, `cue` can read and write
[a range of other formats]({{< relref "docs/integration" >}}).

## Embedding JSON in CUE

CUE is often used to generate configuration files. Some systems expect or allow
their configuration files to contain JSON embedded inside string fields,
irrespective of the file's data format.

CUE's standard library provides
[a built-in `json` package](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json)
containing functions that generate, parse, validate, and format JSON from
within CUE.

### Generating embedded JSON

In this example a
[Kubernetes ConfigMap](https://kubernetes.io/docs/concepts/configuration/configmap/)
contains a JSON file encoded as a single string field, embedded inside YAML.
This is enabled by the `json.Marshal` function:

{{{with code "en" "marshal json"}}}
exec cue export config.cue --out yaml
cmp stdout out
-- config.cue --
import "encoding/json"

configMap: data: "point.json": json.Marshal({
	x: 1.2
	y: 3.45
})
-- out --
configMap:
  data:
    point.json: '{"x":1.2,"y":3.45}'
{{{end}}}

### Parsing embedded JSON

The `json.Unmarshal` function performs the reverse operation to `json.Marshal`.
It turns a string containing embedded JSON into the data structure represented
by the underlying JSON. Here, a
[JSON Web Token](https://en.wikipedia.org/wiki/JSON_Web_Token) is emitted as
YAML:

{{{with code "en" "unmarshal json"}}}
exec cue export token.cue --out yaml
cmp stdout out
-- token.cue --
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
-- out --
output:
  header:
    alg: HS256
    typ: JWT
  payload:
    sub: "1234567890"
    name: John Doe
    iat: 1516239022
{{{end}}}

### Validating embedded JSON

The `json.Validate` function allows embedded JSON to be validated against
native CUE schema constraints.

Here, each member of the `item` map is checked against the `#Dimensions`
schema. The `cue` tool correctly catches and flags up two problems with the
data:

{{{with code "en" "cue-validate-json"}}}
#location top bottom

! exec cue vet furniture.cue
cmp stderr out
-- furniture.cue --
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
-- out --
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
{{{end}}}

### Other `json` functions

The `json` package contains other useful functions, including those that format
JSON specifically for humans to read, or for machines to consume. These
functions are demonstrated in guides that you can discover through the site's
search page:
&#x1F50D;&nbsp;[search for how-to guides mentioning "encoding/json"](/search/?q="encoding/json"%20contentType:"How-to%20Guides")
