---
title: Validating data files using file embedding
toc_hide: true
authors: [jpluscplusm]
tags: [validation]
---
{{<sidenote text="Requires CUE v0.12.0 or later">}}

CUE's
[file embedding]({{<relref"docs/reference/command/cue-help-embed">}})
feature provides a flexible way to validate the contents of data files, and to
record the precise constraints that should be used to validate each file in the
future.
File embedding is an alternative to using
[the `--path`/`-l` flag]({{<relref"docs/concept/using-the-cue-export-command/inputs/#static-locations">}})
to specify data files' locations using command parameters.
Here's how to use it to validate data files:
<!-- TODO: swap the above link for a section in the cue-vet command when it's published -->

{{{with code "en" "example"}}}
#location top-left top-left top-right top-right bottom
exec cue mod init

! exec cue vet -c .:validate
cmp stderr out
-- validate.cue --
// Enable file embedding.
@extern(embed)

package validate

// Embed the contents of some data files and
// constrain their contents using two schemas.
alpha: #A @embed(file=data/alpha.json)
beta:  #B @embed(file=data/beta.yaml)
-- constraints.cue --
package validate

// #A permits two fields with integer values.
#A: {X: int, O: int}

// #B extends #A by requiring each field's
// value to be greater than 100.
#B: #A & {[_]: >100}
-- data/alpha.json --
{
    "X": 1,
    "O": 2.2
}
-- data/beta.yaml --
X: 11
O: 222
-- out --
alpha.O: conflicting values 2.2 and int (mismatched types float and int):
    ./constraints.cue:4:17
    data/alpha.json:3:10
beta.X: invalid value 11 (out of bound >100):
    ./constraints.cue:8:16
    data/beta.yaml:1:4
{{{end}}}

The file embedding in this example validates a pair of individually named files,
but can also be used to reference multiple files using filesystem globs.
See {{<linkto/inline"howto/embed-files-in-cue-evaluation">}} for more detail.

File embedding can only be used [inside a module]({{<relref"docs/concept/modules">}}),
and works with CUE v0.12.0 or later.

## Related content

- {{<linkto/related/reference"command/cue-help-embed">}}
- {{<linkto/related/howto"embed-files-in-cue-evaluation">}}
- {{<linkto/related/concept"modules">}}
