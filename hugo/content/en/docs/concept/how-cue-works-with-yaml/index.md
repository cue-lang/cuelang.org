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

{{< code-tabs >}}
{{< code-tab name="data.yml" language="yml" area="left" >}}
a: 1
b: "2"
c: "three"
d: 4.4
{{< /code-tab >}}
{{< code-tab name="data.json" language="json" area="left" >}}
{
    "e": 5,
    "f": "6"
}
{{< /code-tab >}}
{{< code-tab name="data.cue" language="cue" area="left" >}}
g: "seven"
h: 4.4 * 2
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1sIGRhdGEueW1sIGRhdGEuanNvbiBkYXRhLmN1ZQ==" >}}
$ cue export --out yaml data.yml data.json data.cue
e: 5
a: 1
b: "2"
c: three
g: seven
"f": "6"
d: 4.4
h: 8.8
{{< /code-tab >}}
{{< /code-tabs >}}

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
{{< code-tab name="config-a.yaml" language="yaml" area="top-right" >}}
cluster: live05
region: IMEA
repository: source.company.example/alpha
tags:
  - prod
{{< /code-tab >}}
{{< code-tab name="config-b.yaml" language="yaml" area="top-right" >}}
cluster: live03333333333333
repository: github.com/Alex_Personal_Account/alpha-fork
region: UK
tags:
  - dev
{{< /code-tab >}}
{{< code-tab name="config-c.yaml" language="yaml" area="top-right" >}}
cluster: live05
region: APAC
repository: source.company.example/alpha
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCBzY2hlbWEuY3VlIC1kICcjQ29uZmlnJyBjb25maWctYS55YW1sIGNvbmZpZy1iLnlhbWwgY29uZmlnLWMueWFtbA==" >}}
$ cue vet schema.cue -d '#Config' config-a.yaml config-b.yaml config-c.yaml
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
{{< /code-tab >}}
{{< /code-tabs >}}

Learn more in this {{< linkto/related/howto "validate-yaml-using-cue" >}}.

## Processing and transforming YAML files

The `cue` tool can read and transform YAML files, producing output data in any
shape that's required. For example:

{{< code-tabs >}}
{{< code-tab name="data.yaml" language="yaml" area="top-right" >}}
a: 5
b: 4
{{< /code-tab >}}
{{< code-tab name="transform.cue" language="cue" area="top-left" >}}
a: int
b: int
c: 1 + a*b
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1sIGRhdGEueWFtbCB0cmFuc2Zvcm0uY3Vl" >}}
$ cue export --out yaml data.yaml transform.cue
a: 5
b: 4
c: 21
{{< /code-tab >}}
{{< /code-tabs >}}

Learn more about transforming data with CUE in these guides:

- {{< linkto/related/howto "combine-multiple-yaml-files-into-a-list" >}}
- {{< linkto/related/howto "combine-multiple-yaml-files-by-using-file-metadata" >}}

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

{{< code-tabs >}}
{{< code-tab name="config.cue" language="cue" area="top-left" >}}
import "encoding/yaml"

configMap: data: "point.yaml": yaml.Marshal({
	x: 1.2
	y: 3.45
})
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBjb25maWcuY3VlIC0tb3V0IGpzb24=" >}}
$ cue export config.cue --out json
{
    "configMap": {
        "data": {
            "point.yaml": "x: 1.2\n\"y\": 3.45\n"
        }
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}

### Parsing embedded YAML

The `yaml.Unmarshal` function performs the reverse operation to `yaml.Marshal`:
it turns a string containing embedded YAML into the structure represented by
the underlying data.

Here, some embedded YAML data is emitted as JSON:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
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
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWxlLmN1ZSAtZSBvdXRwdXQ=" >}}
$ cue export file.cue -e output
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
{{< /code-tab >}}
{{< /code-tabs >}}

### Validating embedded YAML

The `yaml.Validate` and `yaml.ValidatePartial` functions allow embedded YAML to
be validated against native CUE schema constraints.

Here, each member of the `item` map is checked against the `#Dimensions`
schema. The `cue` tool correctly catches and flags up two problems with the
data:

{{< code-tabs >}}
{{< code-tab name="furniture.cue" language="cue" area="top" >}}
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
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCBmdXJuaXR1cmUuY3Vl" >}}
$ cue vet furniture.cue
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
{{< /code-tab >}}
{{< /code-tabs >}}

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
