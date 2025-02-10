---
title: Embedding files in a CUE evaluation
authors: [jpluscplusm]
toc_hide: true
---

Users frequently need to load JSON, YAML, or other types of files into their CUE code.
Because CUE's `import` declarations only allow references to CUE packages,
some workflows resort to using the tooling layer
([`cue cmd`]({{< relref "docs/reference/command/cue-help-cmd/" >}}))
to load non-CUE files. This can complicate the process if the tooling layer's
advanced features aren't otherwise needed.

The `@embed()` attribute is designed to simplify workflows that require data to
be loaded at evaluation time, and is available by default from version
`v0.12.0` of CUE onwards. This guide demonstrates the following version:

{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
{{{end}}}

## Embedding files in an evaluation

{{{with step}}}
Initialize a CUE module, or use an existing module if that's appropriate in
your situation:

{{{with script "en" "cue mod init"}}}
cue mod init
{{{end}}}
{{{end}}}

{{{with step}}}
Include the `@extern(embed)` directive at the top of each CUE file that uses the
`@embed()` attribute. Use `@embed()` to embed either a single named file, or a
glob identifying multiple files:

{{{with upload "en" "files"}}}
#location left right right right right
-- example.cue --
@extern(embed)

package p

oneFile:   _ @embed(file=README.md,type=text)
manyFiles: _ @embed(glob=*.json)
-- a.json --
{
    "aField": "a value"
}
-- b.json --
{
    "aList": [
        1,
        2,
        3
    ]
}
-- c.json --
{
    "anObject": {
        "foo": "a",
        "bar": "b",
        "baz": "c"
    }
}
-- README.md --
# How to use this project

## Installation

Fetch the latest release from the official site,
and unpack it in your home directory. Next ...
{{{end}}}

By default, files are decoded using the encoding implied by their filename
extension, and it's an error if the extension is not known. Files or globs with
an unknown filename extension can be loaded by adding the
`type=<filetype>` parameter, where `<filetype>` can be any type described in
[`cue help filetypes`]({{< relref "docs/reference/command/cue-help-filetypes/" >}}).
{{{end}}}

{{{with step}}}
Export the resulting configuration:

{{{with script "en" "display result"}}}
cue export --out yaml
{{{end}}}
{{{end}}}

## Related content

- {{<linkto/related/reference "command/cue-help-filetypes/" >}}
