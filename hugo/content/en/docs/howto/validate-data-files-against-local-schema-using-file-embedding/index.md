---
title: Validating data files against local schema using file embedding
toc_hide: true
authors: [jpluscplusm]
---

{{< code-tabs >}}
{{< code-tab name="validate.cue" language="cue" area="top-left" >}}
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
{{< /code-tab >}}
{{< code-tab name="schema/schemas.cue" language="cue" area="top-left" >}}
package schema

#A: {
	A: int
	B: int
	C: int
}
#B: #A & {
	[_]: >100
}
{{< /code-tab >}}
{{< code-tab name="cue.mod/module.cue" language="cue" area="top-left" >}}
// This file's contents cause this example to be
// run inside a CUE module, which is required to
// use file embedding. You shouldn't create this
// file manually - use "cue mod init" instead.
module: "cue.example"
language: version: "v0.12.0"
{{< /code-tab >}}
{{< code-tab name="data/alpha.json" language="json" area="top-right" >}}
{
    "A": 1,
    "B": 22,
    "C": 333
}
{{< /code-tab >}}
{{< code-tab name="data/beta.yaml" language="yaml" area="top-right" >}}
A: "one"
B: 2.2
C: 3
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAuOnZhbGlkYXRl" >}}
$ cue vet .:validate
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
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- {{<linkto/related/reference"command/cue-help-embed">}}
- {{<linkto/related/reference"command/cue-help-mod-init">}}
