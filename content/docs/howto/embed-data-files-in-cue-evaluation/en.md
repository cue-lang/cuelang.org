---
title: Embedding data files in a CUE evaluation
authors: [jpluscplusm]
toc_hide: true
---

{{{with _script_ "en" "HIDDEN: use CUE tip for access to @embed() feature"}}}
export PATH=/cues/$CUELANG_CUE_TIP:$PATH
{{{end}}}

Sometimes it's necessary for CUE to include non-CUE data in a configuration.
The `@embed()` attribute is designed to enable workflows that require data to
be embedded.

{{<info>}}
The `@embed()` attribute is experimental, and its behaviour is subject to change.
Please subscribe to {{<issue 3264>}}discussion #3264{{</issue>}} for updates.
{{</info>}}

{{{with step}}}
Enable the embedding experiment by setting the `CUE_EXPERIMENT` environment variable:
{{{with script "en" "enable embed experiment"}}}
export CUE_EXPERIMENT=embed
{{{end}}}
{{{end}}}

{{{with step}}}
This guide uses the following files:

{{{with upload "en" "files"}}}
#location left right right right
-- example.cue --
@extern(embed) // foo bar baz

package p

oneFile:   _ @embed(file=a.json)
manyFiles: _ @embed(glob=*.json)
-- a.json --
{
    "anObject": {
        "foo": "a",
        "bar": "b",
        "baz": "c"
    }
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
    "aField": "a value"
}
{{{end}}}
{{{end}}}

{{{with step}}}
Display the result of an evaluation performed in the context of the data files shown above:
{{{with script "en" "display result"}}}
cue eval
{{{end}}}
{{{end}}}

## Related content

- [The embedding proposal](https://github.com/cue-lang/proposal/blob/main/designs/3264-embed.md)
  contains more detail about the `@embed()` feature - your feedback is
  extremely welcome!
- {{<issue 3264>}}Discussion #3264{{</issue>}} will be updated when the
  embedding proposal is accepted or modified - please subscribe on GitHub to
  receive these updates
