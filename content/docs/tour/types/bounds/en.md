---
title: Bounds
weight: 130
---

**Bounds** define a lower bound,
an upper bound,
or inequality for a certain value,
all of which can be combined arbitrarily.
They work on numbers, strings, bytes, and null.

A bound is expressed using comparison operators such as `>`, `<=`, and `!=`.
It permits values where the comparison would return `true`,
and we say that *the bound is defined for these values*.

{{{with code "en" "tour"}}}
#nofmt https://github.com/cue-lang/cue/issues/2913

exec cue eval -i file.cue -e examples
cmp stdout out
-- file.cue --
floatOver5:     >5.0     // type: float
negativeNumber: <0       // type: int | float
negativeInt:    <0 & int // type: int
afterL:         >"L"     // type: string
notNull:        !=null   // type: any except null

examples: {
	float10:   10.0 & floatOver5
	float5:     5.0 & floatOver5     // failure
	"float-5": -5.0 & negativeNumber
	"num-6":   -6   & negativeNumber
	"float-7": -7.0 & negativeInt    // failure
	"int-7":   -7   & negativeInt
	A:         "A"  & afterL         // failure
	L:         "L"  & afterL         // failure
	LA:        "LA" & afterL
	Z:         "Z"  & afterL
	aa:        "aa" & afterL
	isNull:    null & notNull        // failure
	isNotNull: "X"  & notNull
}
-- out --
float10:   10.0
float5:    _|_ // examples.float5: invalid value 5.0 (out of bound >5.0)
"float-5": -5.0
"num-6":   -6
"float-7": _|_ // examples."float-7": conflicting values -7.0 and int (mismatched types float and int)
"int-7":   -7
A:         _|_ // examples.A: invalid value "A" (out of bound >"L")
L:         _|_ // examples.L: invalid value "L" (out of bound >"L")
LA:        "LA"
Z:         "Z"
aa:        "aa"
isNull:    _|_ // examples.isNull: conflicting values null and !=null (mismatched types null and (bool|string|bytes|func|list|struct|number))
isNotNull: "X"
{{{end}}}
