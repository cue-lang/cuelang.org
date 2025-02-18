---
title: Validating data files against local schema using file embedding
toc_hide: true
authors: [jpluscplusm]
---

{{{with code "en" "example"}}}
#location top-left top-left top-left top-right top-right bottom
! exec cue vet .:validate
cmp stderr out
-- validate.cue --
// Enable file embedding.
@extern(embed)

package validate

import "cue.example/schema"

// Embed the contents of some data files.
alpha: _ @embed(file=data/alpha.json)
beta:  _ @embed(file=data/beta.yaml)

// Constrain the contents of the data files.
alpha: schema.#A
beta:  schema.#B
-- schema/schemas.cue --
package schema

#A: {
	A: int
	B: int
	C: int
}
#B: #A & {
	[_]: >100
}
-- cue.mod/module.cue --
// This file's contents cause this example to be
// run inside a CUE module, which is required to
// use file embedding. You shouldn't create this
// file manually - use "cue mod init" instead.
module: "cue.example"
language: version: "v0.12.0"
-- data/alpha.json --
{
    "A": 1,
    "B": 22,
    "C": 333
}
-- data/beta.yaml --
A: "one"
B: 2.2
C: 3
-- out --
beta.A: conflicting values "one" and int (mismatched types string and int):
    ./schema/schemas.cue:4:5
    ./schema/schemas.cue:8:5
    ./validate.cue:14:8
    data/beta.yaml:1:4
beta.B: conflicting values 2.2 and int (mismatched types float and int):
    ./schema/schemas.cue:5:5
    ./schema/schemas.cue:8:5
    ./validate.cue:14:8
    data/beta.yaml:2:4
beta.C: invalid value 3 (out of bound >100):
    ./schema/schemas.cue:9:7
    data/beta.yaml:3:4
{{{end}}}

## Related content

- {{<linkto/related/reference"command/cue-help-embed">}}
- {{<linkto/related/reference"command/cue-help-mod-init">}}
