---
title: Embedding a data file in a CUE evaluation
authors: [jpluscplusm]
toc_hide: true
---

FIXME: prose

{{{with _script_ "en" "HIDDEN: use CUE tip for access to @embed() feature"}}}
export PATH=/cues/$CUELANG_CUE_TIP:$PATH
{{{end}}}

{{{with script "en" "enable embed experiment"}}}
#TODO: remove experiment as&when it's not required
export CUE_EXPERIMENT=embed
{{{end}}}

{{{with upload "en" "files"}}}
#location left right
-- example.cue --
@extern(embed) // FIXME: use @embed() when it's available

package example

someData: _ @embed(file=data.json)
-- data.json --
{
    "dataFromJson": true,
    "aList": [
        1,
        2,
        3
    ],
    "anObject": {
        "foo": "a",
        "bar": "b",
        "baz": "c"
    }
}
{{{end}}}

{{{with script "en" "foo"}}}
cue eval
{{{end}}}

