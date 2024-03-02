---
title: Lists
weight: 150
---

**Lists** define arbitrary sequences of CUE values,
and can be **closed** or **open**.
List members are called **elements**.

A closed list statically defines its length each and every time its elements are specified.

Open lists may contain some predefined elements,
followed by `...` and an optional value that constrains any elements that follow.
Open lists permit additional elements to be specified elsewhere, after the predefined elements.
Both the predefined and additional elements may be constrained.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
// A is an open list with 3 predefined elements.
// Any additional elements must be ints.
A: [1, 2, 3, ...int]

// B is a closed list with 4 elements which is
// compatible with A's constraints.
B: [1, 2, 3, 4] & A

// C is a closed list with 3 elements which is
// compatible with A's constraints.
C: [1, _, _] & A
C: [_, 2, _] // 3 elements must be specified on
C: [_, _, 3] // each and every definition.

// D is an open list containing at least 2 ints,
// and is compatible with A's constraints.
D: [int, int, ...int] & A

// Closed lists with different lengths don't unify.
unifyFailBC: B & C
// Element type mismatches prevent unification.
unifyFailA: A & [1, 2, 3, "4"]

// E is built up incrementally as an example.
// E has identical constraints to A.
E: [...] // No type information; list is open.
E: [_, _, _, ...] // There are at least 3 elements.
E: [...int] // All elements are ints.
E: [1, ...] // Element 1 is made concrete.
E: [_, 2, ...] // Element 2 is made concrete.
E: [_, _, 3, ...] // Element 3 is made concrete.
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgLWkgZmlsZS5jdWU=" >}}
$ cue eval -i file.cue
A: [1, 2, 3]
B: [1, 2, 3, 4]
C: [1, 2, 3]
D: [1, 2, 3]
unifyFailBC: _|_ // unifyFailBC: incompatible list lengths (3 and 4) (and 2 more errors)
unifyFailA: [1, 2, 3, _|_, // unifyFailA.3: conflicting values "4" and int (mismatched types string and int)
]
E: [1, 2, 3]
{{< /code-tab >}}
{{< /code-tabs >}}

<!-- TODO: is this example worth saving?
{{< code-tabs >}}
{{< code-tab name="lists.cue" language="cue" area="top-left" >}}
import "list"

// uint8 is a predefined identifier for the bound
// >=0 & <=255, and list.Repeat(X,Y) returns a
// list containing list X repeated Y times.
IP: list.Repeat([uint8], 4)

// IPv4 private subnets, as defined in RFC1918.
rfc1918: {
	// Each member of rfc1918 is unified with
	// IP, thereby fixing its length at 4 and
	// constraining its elements to uint8.
	[_]: IP

	// We do not have to specify a value for
	// all the elements of each member - only
	// those that need to be constrained by
	// the rules of RFC1918.
	"10.0.0.0/8": [10, ...]
	"192.168.0.0/16": [192, 168, ...]
	"172.16.0.0/12": [172, >=16 & <=32, ...]
}

PrivateIP:
	rfc1918."10.0.0.0/8" |
	rfc1918."192.168.0.0/16" |
	rfc1918."172.16.0.0/12"

valid: PrivateIP
valid: [10, 2, 3, 4]

invalid: PrivateIP
invalid: [203, 0, 113, 42] // validation failure
{{< /code-tab >}}
{{< code-tab name="result.txt" language="txt" area="top-right" >}}
IP: [uint8, uint8, uint8, uint8]
rfc1918: {
    "10.0.0.0/8": [10, uint8, uint8, uint8]
    "192.168.0.0/16": [192, 168, uint8, uint8]
    "172.16.0.0/12": [172, uint & >=16 & <=32, uint8, uint8]
}
PrivateIP: [10, uint8, uint8, uint8] | [192, 168, uint8, uint8] | [172, uint & >=16 & <=32, uint8, uint8]
valid: [10, 2, 3, 4]
invalid: _|_ // invalid: 3 errors in empty disjunction: (and 3 more errors)
{{< /code-tab >}}
{{< /code-tabs >}}
-->
