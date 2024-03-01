---
title: Concise Specifications
weight: 240
---

CUE has a convenient **shorthand form** for specifying single fields concisely:
`a: b: c: value`\
It can be mixed freely with CUE's other syntaxes.

**Pattern constraints** apply values to multiple fields.\
They affect those fields which match a pattern: `[pattern]: value`

A pattern constraint doesn't *specify* those fields which match its pattern.\
For instance, the pattern constraint "`[string]: 42`" doesn't bring *every* possible `string`
field into existence!

{{{with code "en" "tour"}}}
#nofmt https://github.com/cue-lang/cue/issues/722

exec cue export file.cue
cmp stdout out
-- file.cue --
// Specify fields concisely ...
fruit: apple: weight: 5
fruit: grape: weight: 2
// ... or don't. Mix and match forms as needed.
fruit: {
	melon: weight: 9
}

// Pattern constraints match multiple fields.
fruit: [string]: weight: int & <10

// Pattern constraints can specify multiple fields.
fruit: [string]: {
	isFruit:     true
	isVegetable: !isFruit
}
-- out --
{
    "fruit": {
        "apple": {
            "weight": 5,
            "isFruit": true,
            "isVegetable": false
        },
        "grape": {
            "weight": 2,
            "isFruit": true,
            "isVegetable": false
        },
        "melon": {
            "weight": 9,
            "isFruit": true,
            "isVegetable": false
        }
    }
}
{{{end}}}
