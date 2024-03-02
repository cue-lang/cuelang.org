---
title: Lists
weight: 150
---

**Lists** define arbitrary sequences of CUE values,
and can be **closed** or **open**.
List members are called **elements**.

Closed lists state and fix their number of elements statically on every
definition of their elements or refinement of their elements' characteristics.

Open lists make use of an ellipsis (`...`) or an ellipsis-prefixed type.
They may have some predefined elements, or none.
They may also permit additional elements to be appended,
after the predefined elements.
Both the predefined and additional elements may be typed or untyped.

{{{with code "en" "tour"}}}
#nofmt Comment on first line gets indented.

exec cue eval -i file.cue
cmp stdout out
-- file.cue --
// Here, closed is specified incrementally but, in
// practice, its concrete data values could be
// specified in a single definition.
closed: [1, _, _] // The list is fixed at length 3.
closed: [_, 2, _] // 3 elements must be specified
closed: [_, _, 3] // for every definition.

// open is refined incrementally, for demonstration
// purposes. Notice how its evaluated value is
// concrete despite its persistent openness, and
// how some values are inferred from their
// unfified constraints.
open: [...] // No type information; list left open.
open: [...int] // All elements must be ints.
open: [...<100] // All elements must be under 100.
open: [...>0] // All elements must be positive.
open: [1, ...] // Element 1 is made concrete.
open: [_, >1, ...] // Element 2 is constrained ...
open: [_, <=2, ...] // ... twice.
open: [_, ...<=3] // Elements 2+ are constrained.
open: [_, _, >2,...] // Element 3 is constrained.
open: [_, _, _, ...] // Element 3 is vivified.

// closed is compatible with the values and
// constraints of open.
closed: open

// error is not compatible with the constraints
// of open.
error: [ 1, 2, 3, 1000]
error: open // validation failure
-- out --
closed: [1, 2, 3]
open: [1, 2, 3]
error: [1, 2, 3, _|_, // error.3: invalid value 1000 (out of bound <=3)
]
{{{end}}}

<!-- TODO: is this example worth saving?
{{{with code "en" "lists"}}}
exec cue eval -i lists.cue
cmp stdout result.txt
-- lists.cue --
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
-- result.txt --
IP: [uint8, uint8, uint8, uint8]
rfc1918: {
    "10.0.0.0/8": [10, uint8, uint8, uint8]
    "192.168.0.0/16": [192, 168, uint8, uint8]
    "172.16.0.0/12": [172, uint & >=16 & <=32, uint8, uint8]
}
PrivateIP: [10, uint8, uint8, uint8] | [192, 168, uint8, uint8] | [172, uint & >=16 & <=32, uint8, uint8]
valid: [10, 2, 3, 4]
invalid: _|_ // invalid: 3 errors in empty disjunction: (and 3 more errors)
{{{end}}}
-->
