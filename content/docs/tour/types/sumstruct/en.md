---
title: Disjunctions of Structs
weight: 120
---

Disjunctions work for any type, including structs.

In this example each `#Floor` of a building
must have a exit if it is on level 0 or 1,
but not if it is on any other level.
(A neater way to encode the `level` constraints would be to use *bounds*, as
shown on the next page.)

{{{with code "en" "tour"}}}
exec cue export file.cue
cmp stdout out
-- file.cue --
#Floor: {
	level?:   int  // floor's level
	hasExit?: bool // floor has an exit?
}

// Constraints on the possible values of #Floor.
#Floor: {
	level:   0 | 1
	hasExit: true
} | {
	level:   -3 | -2 | -1 | 2 | 3 | 4
	hasExit: false
}

floors: [...#Floor]
floors: [
	{level: -2},
	{level: -1},
	{level: 0},
	{level: 1},
	{level: 2},
]
-- out --
{
    "floors": [
        {
            "level": -2,
            "hasExit": false
        },
        {
            "level": -1,
            "hasExit": false
        },
        {
            "level": 0,
            "hasExit": true
        },
        {
            "level": 1,
            "hasExit": true
        },
        {
            "level": 2,
            "hasExit": false
        }
    ]
}
{{{end}}}
