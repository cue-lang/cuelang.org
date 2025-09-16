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

{{{with code "en" "export"}}}
#location left left left right

exec cue export --out toml a.toml b.json c.cue
cmp stdout out
-- a.toml --
a = "1"

[b]
c = 2.2

[b.d]
e = 3
-- b.json --
{
    "f": "4",
    "g": 5.5
}
-- c.cue --
b: _
g: _

h: "six"
b: d: i: g + b.d.e
-- out --
a = '1'
f = '4'
g = 5.5
h = 'six'

[b]
c = 2.2

[b.d]
e = 3
i = 8.5
{{{end}}}

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

{{{with code "en" "vet"}}}
#location top-left top-right top-right top-right bottom
# TODO: add mistakes into more than 1 TOML file when https://github.com/cue-lang/cue/issues/2511 is closed
# TODO: remove a required field when https://github.com/cue-lang/cue/issues/2869 is closed

! exec cue vet -c schema.cue -d '#Config' config-a.toml config-b.toml config-c.toml
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
-- config-a.toml --
cluster = 'live05'
region = 'IMEA'
repository = 'source.company.example/alpha'
tags = ['prod']
-- config-b.toml --
cluster = 'live03333333333333'
region = 'UK'
repository = 'github.com/Alex_Personal_Account/alpha-fork'
tags = ['dev']
-- config-c.toml --
cluster = 'live05'
region = 'APAC'
repository = 'source.company.example/alpha'
-- out --
region: 2 errors in empty disjunction:
region: conflicting values "APAC" and "UK":
    ./config-b.toml:2:10
    ./schema.cue:9:10
region: conflicting values "IMEA" and "UK":
    ./config-b.toml:2:10
    ./schema.cue:9:19
cluster: invalid value "live03333333333333" (does not satisfy strings.MaxRunes(16)):
    ./schema.cue:4:15
    ./config-b.toml:1:11
    ./schema.cue:4:32
repository: invalid value "github.com/Alex_Personal_Account/alpha-fork" (out of bound =~"^source\\.company\\.example/"):
    ./schema.cue:6:15
    ./config-b.toml:3:14
{{{end}}}

<!--
TODO(jm): link to an as-yet unwritten "how to validate TOML using CUE" guide.
Learn more in the How-to guide {{< linkto/inline "howto/validate-json-using-cue" >}}.
-->

## Processing and transforming TOML files

The `cue` tool can read and transform TOML files, producing output data in any
shape that's required. For example:

{{{with code "en" "transform"}}}
#location top-right top-left bottom

exec cue export data.toml transform.cue --out toml
cmp stdout out
-- data.toml --
a = 5
b = 4
-- transform.cue --
a: int
b: int
c: 1 + a*b
-- out --
a = 5
b = 4
c = 21
{{{end}}}

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

{{{with code "en" "files"}}}
#location top-left top-right top-right top-right bottom
exec cue mod init

exec cue export --out toml
cmp stdout out
-- example.cue --
@extern(embed)

package p

_conf: _ @embed(file=config.toml)
_data: _ @embed(glob=env/*.toml)

info: {
	version: _conf.version
	source:  _data["env/\(_conf.source).toml"].text
}
-- config.toml --
source = 'bar'
version = '1.42.0'
-- env/foo.toml --
text = 'Some foo'
-- env/bar.toml --
text = 'A bar'
-- out --
[info]
source = 'A bar'
version = '1.42.0'
{{{end}}}

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

{{{with code "en" "marshal"}}}
exec cue export config.cue --out yaml
cmp stdout out
-- config.cue --
import "encoding/toml"

configMap: data: "point.toml": toml.Marshal({
	x: 1.2
	y: 3.45
})
-- out --
configMap:
  data:
    point.toml: |
      x = 1.2
      y = 3.45
{{{end}}}

### Parsing encoded TOML

The `toml.Unmarshal` function performs the reverse operation to `toml.Marshal`:
it turns a string containing TOML into the structure represented by
the encoded data.

Here, some encoded TOML data (a *Rust crate manifest*) is emitted as YAML:

{{{with code "en" "unmarshal"}}}
exec cue export config.cue --out yaml
cmp stdout out
-- config.cue --
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
-- out --
output:
  cargo:
    package:
      name: hello_world
      version: 0.1.0
      edition: "2021"
    dependencies:
      serde: "1.0"
{{{end}}}

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
