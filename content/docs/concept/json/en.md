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
In other words: all valid JSON is CUE.

The `cue` tool natively supports reading and writing JSON files - in fact, JSON
is its default output format.

This allows JSON files to be processed by CUE's wide range of data, schema, and
policy validation capabilities, and to convert input formats to JSON.
<!-- TODO: add links for capabilities -->

This is demonstrated here by `cue` **unifying** all its CUE, JSON and YAML
input files as JSON, including a YAML file containing multiple documents:
<!-- TODO: add link to unification concept guide -->

{{{with code "en" "export"}}}
#location right right right left

exec cue export data.yml data.json data.cue
cmp stdout out
-- data.yml --
a: 1
b: "2"
---
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
    "a": 1,
    "c": "three",
    "g": "seven",
    "f": "6",
    "b": "2",
    "d": 4.4,
    "h": 8.8
}
{{{end}}}

In addition to JSON, `cue` can read and write
[a range of other formats]({{< relref "docs/integration" >}}).

## Validating JSON files against a schema

CUE is often used to make systems safer without having to teach the underlying
system components about CUE. Because the `cue` tool can validate JSON files
using CUE's powerful and compact constraint syntax, it's easy to add
"pre-flight" checks to an existing process with CUE.

In this example, `cue` is used to check that a hypothetical system's JSON input
files are valid - and catches a problematic deployment early in the process:

{{{with code "en" "vet"}}}
#location top-left top-right top-right top-right bottom
# TODO: add mistakes into more than 1 JSON file when https://github.com/cue-lang/cue/issues/2511 is closed
# TODO: remove a required field when https://github.com/cue-lang/cue/issues/2869 is closed

! exec cue vet schema.cue -d '#Config' config-a.json config-b.json config-c.json
cmp stderr out
-- schema.cue --
import "strings"

#Config: {
	cluster!:    strings.MaxRunes(16)
	region!:     #Region
	repository!: =~#"^source\.company\.example/"#
	tags?: [...#Tags]
}
#Region: "APAC" | "IMEA"
#Tags:   "prod" | "stage" | "qa" | "test" | "dev"
-- config-a.json --
{
    "cluster": "live05",
    "region": "IMEA",
    "repository": "source.company.example/alpha",
    "tags": [
        "prod"
    ]
}
-- config-b.json --
{
    "cluster": "live03333333333333",
    "repository": "github.com/Alex_Personal_Account/alpha-fork",
    "region": "UK",
    "tags": [
        "dev"
    ]
}
-- config-c.json --
{
    "cluster": "live05",
    "region": "APAC",
    "repository": "source.company.example/alpha"
}
-- out --
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
{{{end}}}

## Processing and transforming JSON files

The `cue` tool can read and transform JSON files, producing output data in any
shape that's required. The following guides demonstrate this in action:

- {{< linkto/related/howto "combine-multiple-json-files-into-a-list" >}}
- {{< linkto/related/howto "combine-multiple-json-files-by-using-file-metadata" >}}

## Embedding JSON in CUE

CUE is frequently used to generate configuration files. Some systems allow
their configuration files to contain JSON embedded inside string fields,
irrespective of the file's main data format.

CUE's standard library provides
[a built-in `json` package](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json)
containing functions that generate, parse, validate, and format JSON from
within CUE - some of which are shown here.

### Generating embedded JSON

In this example a
[Kubernetes ConfigMap](https://kubernetes.io/docs/concepts/configuration/configmap/)
contains a JSON file encoded as a single string field, embedded inside YAML.
This is enabled by the `json.Marshal` function:

{{{with code "en" "marshal"}}}
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

The `json.Unmarshal` function performs the reverse operation to `json.Marshal`:
it turns a string containing embedded JSON into the structure represented by
the underlying data.

Here, a
[JSON Web Token](https://en.wikipedia.org/wiki/JSON_Web_Token) is emitted as
YAML:

{{{with code "en" "unmarshal"}}}
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

{{{with code "en" "validate"}}}
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

The [`json` package](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json)
contains other useful functions, including those that format JSON specifically
for humans to read, or for machines to consume. These functions are
demonstrated in guides that you can discover through the site's search page:
&#x1F50D;&nbsp;
[search for how-to guides mentioning "encoding/json"](/search/?q="encoding/json"%20contentType:"How-to%20Guides")

## Converting JSON files to CUE

Because
[every valid JSON file is also a CUE file]({{< relref "docs/tour/basics/json-superset" >}}),
one very easy way to convert JSON files to CUE is simply to rename them from
`.json` to `.cue`!

For more complex situations, the `cue` tool's
[`import`]({{< relref "docs/reference/cli/cue-import" >}}) command can create a
CUE file for each JSON file it's given, and can even recognise embedded YAML
and JSON fields, and convert those structures recursively.

Examples of this command being used can be found in the
[`cue import` CLI reference documentation]({{< relref "docs/reference/cli/cue-import" >}}).

<!-- TODO: refer to a better page than the plain text CLI help text -->
<!-- TODO: what example would work inline, here? -->
