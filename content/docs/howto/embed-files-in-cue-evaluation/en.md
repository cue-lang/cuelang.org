---
title: Embedding files in a CUE evaluation
authors: [jpluscplusm]
toc_hide: true
---

{{{with _script_ "en" "HIDDEN: use CUE prerelease for access to @embed() feature"}}}
export PATH=/cues/$CUELANG_CUE_PRERELEASE:$PATH
{{{end}}}

Users frequently need to load JSON, YAML, or other types of files into their CUE
code. As CUE only supports `import` declarations that reference CUE packages,
users currently resort to the CUE tooling layer ([`cue cmd`]({{< relref
"docs/reference/command/cue-help-cmd/" >}})) to load non-CUE files, which can be
overly complex for their needs.

The `@embed()` attribute is designed to enable workflows that require data to
be loaded at evaluation time.

{{<info>}}
The `@embed()` attribute is experimental, and its behaviour is subject to change.
Please subscribe to {{<issue 3264>}}discussion #3264{{</issue>}} for updates.
{{</info>}}

Note to use `@embed` you will need:

{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
{{{end}}}

{{{with step}}}
Enable the embed experiment:

{{{with script "en" "enable embed experiment"}}}
export CUE_EXPERIMENT=embed
{{{end}}}
{{{end}}}

{{{with step}}}
Include the `@extern(embed)` directive at the top of each CUE file that the
`@embed()` attribute. Use `@embed()` to embed either a single named file or a
glob identifying multiple files:

{{{with upload "en" "files"}}}
#location left right right right
-- example.cue --
@extern(embed)

package p

oneFile:   _ @embed(file=a.json)
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
{{{end}}}

By default, files are decoded using the encoding implied by the file name
extension. It's an error if the extension is not known. This can be overridden
using `type=$filetype`, where `$filetype` can be any file type described in [`cue
help filetypes`]({{< relref "docs/reference/command/cue-help-filetypes/" >}}).

{{{end}}}

{{{with step}}}
Export the resulting configuration:

{{{with script "en" "display result"}}}
cue eval
{{{end}}}
{{{end}}}

## Next steps

[The embedding
proposal](https://github.com/cue-lang/proposal/blob/main/designs/3264-embed.md)
contains more detail about the `@embed()` feature. Your feedback on the proposal
is most welcome - please submit it via {{<issue 3264>}}discussion
#3264{{</issue>}}.

{{<issue 3264>}}Discussion #3264{{</issue>}} will be updated when the embedding
proposal is accepted or modified, and when feedback is posted - please subscribe
to the discussion to receive these updates.
