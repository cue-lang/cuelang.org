---
title: Embedding multiple data files in a CUE evaluation
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
#location left right right right
-- example.cue --
@extern(embed) // FIXME: use @embed() when it's available

package example

someData: _ @embed(glob=*.json)
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

{{{with script "en" "foo"}}}
cue eval
{{{end}}}

