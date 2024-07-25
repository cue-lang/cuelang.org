---
title: How CUE works with YAML
tags:
- encodings
- cue command
authors:
- jpluscplusm
toc_hide: true
aliases:
- yaml
---

## Reading and writing YAML

The `cue` tool natively supports reading and writing YAML files, including
those containing multiple documents.

This allows YAML files to be processed by CUE's wide range of data, schema, and
policy validation capabilities, and to convert input formats to YAML - as
demonstrated here by
[`cue export`]({{< relref "docs/reference/command/cue-help-export" >}})
*unifying* all its YAML, JSON, and CUE input files as YAML:
<!-- TODO: add links for capabilities -->
<!-- TODO: add link to unification concept guide -->

{{{with code "en" "export"}}}
#location left left left right

exec cue export --out yaml data.yml data.json data.cue
cmp stdout out
-- data.yml --
a: 1
b: "2"
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
e: 5
a: 1
b: "2"
c: three
g: seven
"f": "6"
d: 4.4
h: 8.8
{{{end}}}

In addition to YAML, `cue` can read and write
[a range of other formats]({{< relref "docs/integration" >}}).

## Validating YAML files against a schema

CUE is often used to make systems safer without having to teach the underlying
system components about CUE. Because the `cue` tool can validate YAML files
using CUE's powerful and compact constraint syntax, it's easy to add
"pre-flight" checks to existing processes with CUE.

In this example,
[`cue vet`]({{< relref "docs/reference/command/cue-help-vet" >}})
is used to check that a hypothetical system's YAML input files are valid - and
catches a problematic deployment early in the process:

{{{with code "en" "vet"}}}
#location top-left top-right top-right top-right bottom
# TODO: add mistakes into more than 1 YAML file when https://github.com/cue-lang/cue/issues/2511 is closed
# TODO: remove a required field when https://github.com/cue-lang/cue/issues/2869 is closed

! exec cue vet schema.cue -d '#Config' config-a.yaml config-b.yaml config-c.yaml
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
-- config-a.yaml --
cluster: live05
region: IMEA
repository: source.company.example/alpha
tags:
  - prod
-- config-b.yaml --
cluster: live03333333333333
repository: github.com/Alex_Personal_Account/alpha-fork
region: UK
tags:
  - dev
-- config-c.yaml --
cluster: live05
region: APAC
repository: source.company.example/alpha
-- out --
region: 2 errors in empty disjunction:
region: conflicting values "APAC" and "UK":
    ./config-b.yaml:3:9
    ./schema.cue:5:15
    ./schema.cue:9:10
region: conflicting values "IMEA" and "UK":
    ./config-b.yaml:3:9
    ./schema.cue:5:15
    ./schema.cue:9:19
cluster: invalid value "live03333333333333" (does not satisfy strings.MaxRunes(16)):
    ./schema.cue:4:15
    ./config-b.yaml:1:10
    ./schema.cue:4:32
repository: invalid value "github.com/Alex_Personal_Account/alpha-fork" (out of bound =~"^source\\.company\\.example/"):
    ./schema.cue:6:15
    ./config-b.yaml:2:13
{{{end}}}

Learn more in the How-to guide {{< linkto/inline "howto/validate-yaml-using-cue" >}}.

## Processing and transforming YAML files

The `cue` tool can read and transform YAML files, producing output data in any
shape that's required. For example:

{{{with code "en" "transform"}}}
#location top-right top-left bottom

exec cue export --out yaml data.yaml transform.cue
cmp stdout out
-- data.yaml --
a: 5
b: 4
-- transform.cue --
a: int
b: int
c: 1 + a*b
-- out --
a: 5
b: 4
c: 21
{{{end}}}

Learn more about transforming data with CUE in these How-to guides:

- {{< linkto/inline "howto/transform-yaml-with-cue" >}}
- {{< linkto/inline "howto/combine-multiple-yaml-files-into-a-list" >}}
- {{< linkto/inline "howto/combine-multiple-yaml-files-by-using-file-metadata" >}}

## Embedding YAML in CUE

CUE is frequently used to generate configuration files. Some systems allow
their configuration files to contain YAML embedded inside string fields,
irrespective of the file's main data format.

CUE's standard library provides
[a built-in `yaml` package](https://pkg.go.dev/cuelang.org/go/pkg/encoding/yaml)
containing functions that generate, parse, and validate YAML from
within CUE - some of which are shown here.

### Generating embedded YAML

In this example a *Kubernetes ConfigMap* contains a YAML file encoded as a
single string field, embedded inside JSON. This is enabled by the
`yaml.Marshal` function:

{{{with code "en" "marshal"}}}
exec cue export config.cue --out json
cmp stdout out
-- config.cue --
import "encoding/yaml"

configMap: data: "point.yaml": yaml.Marshal({
	x: 1.2
	y: 3.45
})
-- out --
{
    "configMap": {
        "data": {
            "point.yaml": "x: 1.2\n\"y\": 3.45\n"
        }
    }
}
{{{end}}}

### Parsing embedded YAML

The `yaml.Unmarshal` function performs the reverse operation to `yaml.Marshal`:
it turns a string containing embedded YAML into the structure represented by
the underlying data.

Here, some embedded YAML data is emitted as JSON:

{{{with code "en" "unmarshal"}}}
exec cue export file.cue -e output
cmp stdout out
-- file.cue --
import "encoding/yaml"

output: yaml.Unmarshal(data)
data: """
	  user: charlie
	  name: Charlie Cartwright
	  colour: orange
	  species: cat
	  address:
	    - 42 Lancashire Road
	    - Ripon
	    - North Yorkshire
	"""
-- out --
{
    "user": "charlie",
    "name": "Charlie Cartwright",
    "colour": "orange",
    "species": "cat",
    "address": [
        "42 Lancashire Road",
        "Ripon",
        "North Yorkshire"
    ]
}
{{{end}}}

### Validating embedded YAML

The `yaml.Validate` and `yaml.ValidatePartial` functions allow embedded YAML to
be validated against native CUE schema constraints.

Here, each member of the `item` map is checked against the `#Dimensions`
schema. The `cue` tool correctly catches and flags up two problems with the
data:

{{{with code "en" "validate"}}}
#location top bottom

! exec cue vet furniture.cue
cmp stderr out
-- furniture.cue --
import "encoding/yaml"

#Dimensions: {
	width:  number
	depth:  number
	height: number
}

// Validate each member of the map against a schema.
item: [string]: yaml.Validate(#Dimensions)

// bed is correctly specified.
item: bed: """
	width: 2
	height: 0.1
	depth: 2
	"""
// table's width is incorrectly specified as a string.
item: table: """
	width: "34"
	height: 23
	depth: 0.2
	"""
// painting's height field name is incorrectly upper-cased.
item: painting: """
	width: 34
	HEIGHT: 12
	depth: 0.2
	"""
-- out --
item.painting: invalid value "width: 34\nHEIGHT: 12\ndepth: 0.2" (does not satisfy encoding/yaml.Validate({width:number,depth:number,height:number})): error in call to encoding/yaml.Validate: field not allowed:
    ./furniture.cue:10:17
    ./furniture.cue:3:14
    ./furniture.cue:25:17
    yaml.Validate:2:1
item.table: invalid value "width: \"34\"\nheight: 23\ndepth: 0.2" (does not satisfy encoding/yaml.Validate({width:number,depth:number,height:number})): error in call to encoding/yaml.Validate: conflicting values number and "34" (mismatched types number and string):
    ./furniture.cue:10:17
    ./furniture.cue:4:10
    ./furniture.cue:19:14
    yaml.Validate:1:8
{{{end}}}

### Other `yaml` functions

The
[`yaml` package](https://pkg.go.dev/cuelang.org/go/pkg/encoding/yaml)
contains other useful functions which are demonstrated in guides that you can
discover through the site's search page:
&#x1F50D;&nbsp;
[search for how-to guides mentioning "encoding/yaml"](/search/?q=encoding/yaml%20contentType:%22How-to%20Guides%22)

## Converting YAML files to CUE

[`cue import`]({{< relref "docs/reference/command/cue-help-import" >}})
can create a CUE file for each YAML file it's given, and can even recognise
embedded YAML and JSON fields, and convert those structures recursively.

Examples of this command being used can be found in the
[`cue import` CLI reference documentation]({{< relref "docs/reference/command/cue-help-import" >}}).

<!-- TODO: refer to a better page than the plain text CLI help text -->
<!-- TODO: what example could work inline, here? -->

## Related content

- {{< linkto/related/concept "how-cue-works-with-json" >}}
