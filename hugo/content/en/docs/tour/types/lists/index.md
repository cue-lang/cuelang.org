---
title: Lists
weight: 150
---

**Lists** define arbitrary sequences of CUE values,
and can be **closed** or **open**.
List members are called **elements**.

Closed lists state and fix their length, statically, each and every time they
specify their elements.

Open lists are indicated by an ellipsis (`...`) or an ellipsis-prefixed type.
They may contain some predefined elements, or none.
Open lists permit additional elements to be appended, after the predefined elements.
Both the predefined and additional elements may be typed or untyped.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
L: [1, 2, 3, 4] // A closed list with 4 elements.

// C is closed.
C: [1, _, _] // Length is fixed at 3.
C: [_, 2, _] // 3 elements must be specified
C: [_, _, 3] // on each definition.

// S and O are constrained identically. Their
// values are concrete, despite being open.
S: [1, 2, 3, ...int]
O: [...] // No type information; list is open.
O: [_, _, _, ...] // There are at least 3 elements.
O: [...int] // All elements are ints.
O: [1, ...] // Element 1 is made concrete.
O: [_, 2, ...] // Element 2 is made concrete.
O: [_, _, 3, ...] // Element 3 is made concrete.

// C, L, and S are compatible with O's
// constraints.
L: O
C: O
S: O

// error is not compatible with O's constraints.
error: [1, 2, 3, "4"]
error: O // validation failure
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgLWkgZmlsZS5jdWU=" >}}
$ cue eval -i file.cue
L: [1, 2, 3, 4]
C: [1, 2, 3]
S: [1, 2, 3]
O: [1, 2, 3]
error: [1, 2, 3, _|_, // error.3: conflicting values "4" and int (mismatched types string and int)
]
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
