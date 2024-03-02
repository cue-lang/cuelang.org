---
title: Disjunctions of Structs
weight: 120
---

Disjunctions work for any type, including structs.

In this example each `#Floor` of a specific building
must have a exit if it is on level 0 or 1,
but not if it is on any other level.
(A neater way to encode the `level` constraints would be to use *bounds*, as
shown on the next page.)

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
#Floor: {
	level:   int  // floor's level
	hasExit: bool // floor has an exit?
}

// Constraints on the possible values of #Floor.
#Floor: {
	level:   0 | 1
	hasExit: true
} | {
	level:   -3 | -2 | -1 | 2 | 3 | 4
	hasExit: false
}

multiStoreyBuilding: floors: [...#Floor]
multiStoreyBuilding: floors: [
	{level: -2},
	{level: -1},
	{level: 0},
	{level: 1},
	{level: 2},
]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWxlLmN1ZQ==" >}}
$ cue export file.cue
{
    "multiStoreyBuilding": {
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
}
{{< /code-tab >}}
{{< /code-tabs >}}
