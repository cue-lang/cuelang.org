---
title: The cue vet command
weight: 200
authors: [jpluscplusm]
tags: [cue command]
# Hide this page from the *in-body* index at /docs/reference/command/ because
# that index is used to present the list of automated help-text texts.
# It *doesn't* remove it from the LHNav index presented by the same hierarchy.
# cf. https://cuelang.org/examples/basic/front-matter/
hide_summary: true
---

The `cue vet` command ...

{{{with code "en" "cue vet"}}}
#location top-left top-right bottom
! exec cue vet . data.json -d '#Foo'
cmp stderr out
-- schema.cue --
package example

#Foo: {
	bar!: int
	baz?: string
}
-- data.json --
{
    "bar": 42,
    "baz": 4.2,
    "quux": "X"
}
-- out --
baz: conflicting values 4.2 and string (mismatched types float and string):
    ./data.json:3:12
    ./schema.cue:5:8
quux: field not allowed:
    ./data.json:4:5
    ./schema.cue:3:7
{{{end}}}

The default behaviours of `cue export` can be overriden using parameters to
control its inputs, output, and operation.

The command can ...

To learn more, refer to:

- {{< linkto/related/concept "using-the-cue-vet-command" >}} --
  an in-depth guide to `cue vet`
- {{< linkto/related/reference "command/cue-help-vet" >}} --
  the built-in help text for the `cue vet` command
