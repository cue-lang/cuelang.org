---
title: "Field Comprehensions"
weight: 5
---

CUE also supports comprehensions for fields.

One cannot refer to generated fields with references.
Instead, one must use indexing.

{{{with code "en" "fieldcomp"}}}
exec cue eval -c fieldcomp.cue
cmp stdout result.txt
-- fieldcomp.cue --
import "strings"

#a: ["Barcelona", "Shanghai", "Munich"]

for k, v in #a {
	"\( strings.ToLower(v) )": {
		pos:     k + 1
		name:    v
		nameLen: len(v)
	}
}
-- result.txt --
barcelona: {
    pos:     1
    name:    "Barcelona"
    nameLen: 9
}
shanghai: {
    pos:     2
    name:    "Shanghai"
    nameLen: 8
}
munich: {
    pos:     3
    name:    "Munich"
    nameLen: 6
}
{{{end}}}
