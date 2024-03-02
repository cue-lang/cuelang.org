---
title: Bounds
weight: 130
---

**Bounds** define
a lower bound, an upper bound, or inequality for a certain value,
all of which can be combined.
They work on numbers, strings, bytes, and `null`.

A bound is expressed using comparison operators such as `>`, `<=`, and `!=`.
It permits values where the comparison would return `true`,
and we say that *the bound is defined* for these values.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
#floatOver5:  >5.0   // type: float
#negativeNum: <0     // type: int | float
#afterL:      >"L"   // type: string
#notNull:     !=null // type: any except null

zero:      0    & >10          // failure
float10:   10.0 & #floatOver5
float5:    5.0  & #floatOver5  // failure
"num-6":   -6   & #negativeNum
A:         "A"  & #afterL      // failure
Z:         "Z"  & #afterL
isNull:    null & #notNull     // failure
isNotNull: "X"  & #notNull

float425:  42.5 & #notNull & <100 & #floatOver5
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgLWljIGZpbGUuY3Vl" >}}
$ cue eval -ic file.cue
zero:      _|_ // zero: invalid value 0 (out of bound >10)
float10:   10.0
float5:    _|_ // float5: invalid value 5.0 (out of bound >5.0)
"num-6":   -6
A:         _|_ // A: invalid value "A" (out of bound >"L")
Z:         "Z"
isNull:    _|_ // isNull: conflicting values null and !=null (mismatched types null and (bool|string|bytes|func|list|struct|number))
isNotNull: "X"
float425:  42.5
{{< /code-tab >}}
{{< /code-tabs >}}
