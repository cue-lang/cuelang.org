---
title: How CUE works with TOML
tags: [encodings, cue command]
authors: [jpluscplusm]
toc_hide: true
---

## Reading and writing TOML

The `cue` command natively supports reading and writing TOML files and data.
TOML can be processed by CUE's wide range of data, schema, and policy
validation capabilities.
Data in any supported encoding can be read and exported as TOML
-- as demonstrated here by
[`cue export`]({{< relref "docs/reference/command/cue-export" >}})
*unifying* its TOML, JSON, and CUE input files and producing TOML:

{{< code-tabs >}}
{{< code-tab name="a.toml" language="toml" area="left" >}}
a = "1"

[b]
c = 2.2

[b.d]
e = 3
{{< /code-tab >}}
{{< code-tab name="b.json" language="json" area="left" >}}
{
    "f": "4",
    "g": 5.5
}
{{< /code-tab >}}
{{< code-tab name="c.cue" language="cue" area="left" >}}
b: _
g: _

h: "six"
b: d: i: g + b.d.e
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLW91dCB0b21sIGEudG9tbCBiLmpzb24gYy5jdWU=" >}}
$ cue export --out toml a.toml b.json c.cue
a = '1'
f = '4'
g = 5.5
h = 'six'

[b]
c = 2.2

[b.d]
e = 3
i = 8.5
{{< /code-tab >}}
{{< /code-tabs >}}

The `cue` command can read and write
[a range of other formats]({{< relref "docs/integration" >}})
as well as TOML.

## Validating TOML files against a schema

CUE is often used to make systems safer without having to teach the underlying
system components about CUE. Because the `cue` tool can validate TOML files
using CUE's powerful and compact constraint syntax, it's easy to add
"pre-flight" checks to existing processes with CUE.

In this example,
[`cue vet`]({{< relref "docs/reference/command/cue-help-vet" >}})
is used to check that a hypothetical system's TOML input files are valid - and
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
{{< code-tab name="config-a.toml" language="toml" area="top-right" >}}
cluster = 'live05'
region = 'IMEA'
repository = 'source.company.example/alpha'
tags = ['prod']
{{< /code-tab >}}
{{< code-tab name="config-b.toml" language="toml" area="top-right" >}}
cluster = 'live03333333333333'
region = 'UK'
repository = 'github.com/Alex_Personal_Account/alpha-fork'
tags = ['dev']
{{< /code-tab >}}
{{< code-tab name="config-c.toml" language="toml" area="top-right" >}}
cluster = 'live05'
region = 'APAC'
repository = 'source.company.example/alpha'
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyBzY2hlbWEuY3VlIC1kICcjQ29uZmlnJyBjb25maWctYS50b21sIGNvbmZpZy1iLnRvbWwgY29uZmlnLWMudG9tbA==" >}}
$ cue vet -c schema.cue -d '#Config' config-a.toml config-b.toml config-c.toml
region: 2 errors in empty disjunction:
region: conflicting values "APAC" and "UK":
    ./config-b.toml:2:10
    ./schema.cue:5:15
    ./schema.cue:9:10
region: conflicting values "IMEA" and "UK":
    ./config-b.toml:2:10
    ./schema.cue:5:15
    ./schema.cue:9:19
cluster: invalid value "live03333333333333" (does not satisfy strings.MaxRunes(16)):
    ./schema.cue:4:15
    ./config-b.toml:1:11
    ./schema.cue:4:32
repository: invalid value "github.com/Alex_Personal_Account/alpha-fork" (out of bound =~"^source\\.company\\.example/"):
    ./schema.cue:6:15
    ./config-b.toml:3:14
{{< /code-tab >}}
{{< /code-tabs >}}

<!--
TODO(jm): link to an as-yet unwritten "how to validate TOML using CUE" guide.
Learn more in the How-to guide {{< linkto/inline "howto/validate-json-using-cue" >}}.
-->

## Processing and transforming TOML files

The `cue` tool can read and transform TOML files, producing output data in any
shape that's required. For example:

{{< code-tabs >}}
{{< code-tab name="data.toml" language="toml" area="top-right" >}}
a = 5
b = 4
{{< /code-tab >}}
{{< code-tab name="transform.cue" language="cue" area="top-left" >}}
a: int
b: int
c: 1 + a*b
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCBkYXRhLnRvbWwgdHJhbnNmb3JtLmN1ZSAtLW91dCB0b21s" >}}
$ cue export data.toml transform.cue --out toml
a = 5
b = 4
c = 21
{{< /code-tab >}}
{{< /code-tabs >}}

Learn more about transforming data with CUE in these How-to guides:

- {{< linkto/inline "howto/transform-json-with-cue" >}}
- {{< linkto/inline "howto/combine-multiple-json-files-into-a-list" >}}
- {{< linkto/inline "howto/combine-multiple-json-files-by-using-file-metadata" >}}

These guides explain things in terms of JSON data, but the techniques they
demonstrate apply equally to TOML because CUE treats all data encodings as
equivalent.

## Embedding TOML file data inside CUE
{{< sidenote text="Requires CUE v0.12.0 or later" >}}

The [file embedding]({{<relref"docs/howto/embed-files-in-cue-evaluation">}})
feature allows data files (including TOML) to be read when some CUE is evaluated.
This provides an alternative way to use CUE to validate data files against
schemas and constraints, and also gives CUE configurations access to data
stored in non-CUE files:

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="top-left" >}}
@extern(embed)

package p

_conf: _ @embed(file=config.toml)
_data: _ @embed(glob=env/*.toml)

info: {
	version: _conf.version
	source:  _data["env/\(_conf.source).toml"].text
}
{{< /code-tab >}}
{{< code-tab name="config.toml" language="toml" area="top-right" >}}
source = 'bar'
version = '1.42.0'
{{< /code-tab >}}
{{< code-tab name="env/foo.toml" language="toml" area="top-right" >}}
text = 'Some foo'
{{< /code-tab >}}
{{< code-tab name="env/bar.toml" language="toml" area="top-right" >}}
text = 'A bar'
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLW91dCB0b21s" >}}
$ cue export --out toml
[info]
source = 'A bar'
version = '1.42.0'
{{< /code-tab >}}
{{< /code-tabs >}}

File embedding is available from CUE v0.12.0 onwards.
Find out more about this powerful validation feature in
{{<linkto/inline"howto/embed-files-in-cue-evaluation">}}.
## Encoding TOML inside CUE

CUE is frequently used to generate configuration files. Some systems allow
their configuration files to contain TOML encoded in string fields,
irrespective of the file's main data format.

CUE's standard library provides
[a built-in `toml` package](https://pkg.go.dev/cuelang.org/go/pkg/encoding/toml)
containing functions that generate and parse TOML from within CUE, as shown here.

### Generating encoded TOML

In this example a *Kubernetes ConfigMap* contains a TOML file encoded as a
single string field, in a YAML document. This is enabled by the
`toml.Marshal` function:

{{< code-tabs >}}
{{< code-tab name="config.cue" language="cue" area="top-left" >}}
import "encoding/toml"

configMap: data: "point.toml": toml.Marshal({
	x: 1.2
	y: 3.45
})
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBjb25maWcuY3VlIC0tb3V0IHlhbWw=" >}}
$ cue export config.cue --out yaml
configMap:
  data:
    point.toml: |
      x = 1.2
      y = 3.45
{{< /code-tab >}}
{{< /code-tabs >}}

### Parsing encoded TOML

The `toml.Unmarshal` function performs the reverse operation to `toml.Marshal`:
it turns a string containing TOML into the structure represented by
the encoded data.

Here, some encoded TOML data (a *Rust crate manifest*) is emitted as YAML:

{{< code-tabs >}}
{{< code-tab name="config.cue" language="cue" area="top-left" >}}
import "encoding/toml"

_cargo: """
	[package]
	name = "hello_world"
	version = "0.1.0"
	edition = "2021"

	[dependencies]
	serde = "1.0"
	"""
output: cargo: toml.Unmarshal(_cargo)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBjb25maWcuY3VlIC0tb3V0IHlhbWw=" >}}
$ cue export config.cue --out yaml
output:
  cargo:
    package:
      name: hello_world
      version: 0.1.0
      edition: "2021"
    dependencies:
      serde: "1.0"
{{< /code-tab >}}
{{< /code-tabs >}}

## Converting TOML files to CUE

The [`cue import`]({{< relref "docs/reference/command/cue-help-import" >}})
command can create a CUE file for each TOML file it's given -- and can even
recognise encoded YAML and JSON fields, and convert those structures
recursively.

Examples of this command being used can be found in the
[`cue import`]({{< relref "docs/reference/command/cue-help-import" >}})
reference documentation.
<!-- TODO: refer to a better page than the plain text CLI help text -->
<!-- TODO: what example could work inline, here? -->

## Related content

- {{< linkto/related/concept "how-cue-works-with-yaml" >}}
- {{< linkto/related/concept "how-cue-works-with-json" >}}
