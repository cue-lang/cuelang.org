---
title: Different, Yet Familiar
weight: 10
---


## CUE Is Familiar

CUE will probably feel rather familiar if you've spent any time working with
data. CUE shares some syntax with JSON, but **significantly** improves the
experience of managing JSON by hand.

In its very simplest form, CUE looks a lot like JSON.
This is because CUE is a superset of JSON, which means that all valid JSON is
CUE - but *not* vice versa.
Manually managing JSON can be somewhat painful, so CUE introduces several
conveniences to make writing and reading data much easier:

- single-line comments are allowed, starting with `//` and extending to the end of the line
- field names without special characters don’t need to be quoted
- the outermost curly braces in a CUE file are optional
- commas after a field are optional (and are usually omitted)
- commas after the final element of a list are allowed
- literal multiline strings are allowed, and don't require newlines to be encoded
- nested structs containing one (or a few) fields have a convenient shorthand

Here's some data encoded as commented CUE, alongside the equivalent JSON
document. Notice how the CUE lacks curly braces at the top and bottom, and
doesn't have commas after each field's value:

{{{with code "en" "CUE improves on JSON"}}}
#location left right
exec cue export example.cue --out json
cmp stdout out
-- example.cue --
strings: {
	singleLine: "Double quotes == string literal"
	multiLine: """
		Multiline strings start and end with triple
		double-quotes - no escaping of newlines!
		"""
}

// Many field names don't need to be quoted
// (but can be, if you want).
foo_Bar: 1
baz2:    2.2

// Some field names do need quotes, such as those
// that start with numbers, or contain spaces,
// hyphens, or other special characters.
"qu ux": "3.33"
"4":     "four"

a: deeply: nested: field: "value"

// A list's final element can be followed by
// an optional comma, making additions or
// deletions at the end of the list less fiddly.
aList: [
	"a",
	"b",
	"c",
]
anotherList: [1, 2, 3, 4, 5]
-- out --
{
    "strings": {
        "singleLine": "Double quotes == string literal",
        "multiLine": "Multiline strings start and end with triple\ndouble-quotes - no escaping of newlines!"
    },
    "foo_Bar": 1,
    "baz2": 2.2,
    "qu ux": "3.33",
    "4": "four",
    "a": {
        "deeply": {
            "nested": {
                "field": "value"
            }
        }
    },
    "aList": [
        "a",
        "b",
        "c"
    ],
    "anotherList": [
        1,
        2,
        3,
        4,
        5
    ]
}
{{{end}}}

## CUE Is Different

As you've just seen, CUE can be used to encode data using a friendlier, more
convenient syntax than JSON - and some folks do just that.
However many teams also rely on the language's powerful capabilities to
validate and secure their data and configurations - and these abilities build
on some rather unique characteristics.

Let's take a look at some aspects of CUE that you might not have
experienced in a language before ...

### Order Doesn't Matter

Most languages require variables, fields, or data to be declared before they're
used - especially when one data value depends on the value of another.

**CUE is different**: in CUE, *fields can be defined in any order*.

This property drives many of CUE's most powerful features, and is referred to
as *order irrelevance*. It applies at all levels of granularity:

- within the fields of each data *struct* (which is what JSON calls an "object"),
- across the fields and structs defined inside a single `.cue` file,
- when merging multiple `.cue` files that make up a CUE *package*.

Order irrelevance flows from the rules of CUE's most fundamental operation,
called **unification**. Unification is the process by which CUE determines if
values are compatible with one another. It occurs when you explicitly use
the `&` operator, or implicitly when you mention a field multiple times.

In formal terms, unification is defined so that the operation is associative,
commutative, idempotent, and recursive. This means that when values are
unified, CUE guarantees that every possible order in which they *might* be
combined produces the same underlying data structure, and therefore it doesn't
matter which *specific* ordering is chosen - even when unifying deeply nested
data.

In practical terms, unification's rules mean that:

- Data is immutable: if a field is made concrete by assigning it a specific
  value, that value is fixed and cannot be changed. (This might appear
  restrictive at first glance, but in reality CUE gives you plenty of options
  to cater for the different problematic situations you might be imagining!)
- Data and constraints can be combined from multiple sources predictably and
  efficiently, optionally using a convenient shorthand form for specifying
  sparsely-populated structs.
- If a field is declared more than once, then all its assigned values must be
  compatible with each other. When only specifying concrete data, this
  simplifies down: all the assigned values must be *identical*.

In this example, `A` is specified using implicit unification, and `B` is
specified using explicit unification:

{{{with code "en" "simple unification"}}}
exec cue export data.cue --out yaml
cmp stdout out
-- data.cue --
A: 1
B: 2 & 2
A: 1
-- out --
A: 1
B: 2
{{{end}}}

In this example you might be wondering if these unifications have any point -
surely no-one would *actually* specify\
`B: 2 & 2`? Wouldn't `B: 2` be sufficient?

In the case of the value of `B`, you'd be right to wonder - this is simply a
demonstration of explict unification so that you can recognise it, when it's
used later in more interesting situations.
Implicit unification, however (as with field `A`), becomes more interesting when
we learn that, by default, *the `cue` command implicitly unifies the top level
of all the data it's given*.
This means that when we invoke the `cue` command and tell it about different
sources of data, the evaluation result is the unification of all those sources.

To see what this means in practice, we'll unify some CUE, JSON, and YAML,
simply by mentioning the data files. Notice how `data-1.cue` uses CUE's
shorthand to succinctly define a nested struct that contains a single field,
avoiding several curly braces spread over several lines.

{{{with code "en" "multi-file unification"}}}
#location top-left top-right top-right bottom
exec cue export data-1.cue data-2.json data-3.yml --out json
cmp stdout out
-- data-1.cue --
CUE: true
a: b: c: 1
-- data-2.json --
{
    "JSON": true,
    "a": {
        "b": {
            "d": 2
        }
    }
}
-- data-3.yml --
YAML: true
a:
  b:
    e: 3
-- out --
{
    "JSON": true,
    "YAML": true,
    "CUE": true,
    "a": {
        "b": {
            "d": 2,
            "e": 3,
            "c": 1
        }
    }
}
{{{end}}}

But watch what happens when we try and specify a field with two incompatible
values - the `cue` command emits an error message pointing out the
incompatibility and the evaluation fails:

{{{with code "en" "unification failure"}}}
! exec cue export data.cue data.json
cmp stderr out
-- data.cue --
source: "CUE"
-- data.json --
{
    "source": "JSON"
}
-- out --
source: conflicting values "CUE" and "JSON":
    ./data.cue:1:9
    ./data.json:2:15
{{{end}}}

CUE's design ensures that combining values in any order always gives the same
result. Later, in *Why CUE?*, we'll see some of the situations and use cases
that have elegant solutions enabled by this property.

### Types are Values


In many languages there's a strong distinction between the concrete "values"
that a variable or field can be assigned (such as `"foo"`, `4.2`, or `true`)
and the "types" that describe *sets* of permissible values (strings,
floating-point numbers and booleans, respectively). Most languages don't
provide a first-class mechanism to constrain values more precisely, leaving any
nuanced value constraints for the user to implement in code and check
explicitly, at runtime.

**CUE is different**: *CUE doesn't differentiate between values and types*.

This is a powerful concept that, as you'll see shortly, allows you to define
detailed constraints - but it also simplifies the process of learning and using
CUE. Because the language has a single, unified syntax for data and for
constraints, there is no separate schema or data definition language to learn.
The syntax even encompasses concepts such as sum types and enums - even null
coalescing is reduced down to this single construct.

So, whilst CUE does provide a type hierarchy that includes `string`, `float`,
and `bool`, along with `bytes`, `int`, `number`, `null`, `[...]` (list), and
`{...}` (struct), these are simply well-known names for constraints that limit
a field's value to well-known sets. The power of CUE comes from constructing
precise constraints using these building blocks as a starting point, and then
layering more detail on top, using CUE's rich set of constraint primitives.

Here's an example that uses 
[bounds]({{< relref "docs/tour/types/bounds" >}}) (`>`, `<=`, etc)
to construct constraints that limit a number's value, unified with additional
constraints from a
[disjunction]({{< relref "/docs/tour/types/disjunctions" >}})
("`|`") that requires a value to be one option from a prescribed set:

{{{with code "en" "constraints are values too"}}}
#location left right
exec cue eval constraints.cue
cmp stdout out
-- constraints.cue --
#over10:    >10
#under50:   <50
#from5To40: >=5 & <=40
#options:   9 | 10 | 11 | 39 | 40 | 41

myNumber: int & #over10 & #under50
myNumber: #from5To40
myNumber: #options
-- out --
#over10:    >10
#under50:   <50
#from5To40: >=5 & <=40
#options:   9 | 10 | 11 | 39 | 40 | 41
myNumber:   11 | 39 | 40
{{{end}}}

Notice how CUE is able to *simplify* the constraints that apply to the
`myNumber` field by ruling out options that aren't possible, because of the
implicit (repeatedly mentioned) and explicit (`&`) unification of the
constraints that we defined.

Later, in *Why CUE?*, we'll see how CUE's merging of types, values, and
constraints into a single concept enables powerful schema and policy validation.

### Push, not pull, constraints

# FIXME from here vvvVVVvvv

CUE's constraints act as data validators, but also double as
a mechanism to reduce boilerplate.
This is a powerful approach, but requires some different thinking.
With traditional inheritance approaches one specifies the templates that
are to be inherited from at each point they should be used.
In CUE, instead, one selects a set of nodes in the configuration to which
to apply a template.
This selection can be at a different point in the configuration altogether.

Another way to view this, a JSON configuration, say, can be
defined as a sequence of path-leaf values.
For instance,
{{{with code "en" "json"}}}
-- in.json --
{
    "a": 3,
    "b": {
        "c": "foo"
    }
}
{{{end}}}

could be represented as

{{{with code "en" "cue form of json"}}}
-- in.cue --
"a": 3
"b": "c": "foo"
{{{end}}}

All the information of the original JSON file is retained in this
representation.

CUE generalizes this notion to the following pattern:
```
<set of nodes>: <constraints>
```
Each field declaration in CUE defines a set of nodes to which to apply
a specific constraint.
Because order doesn't matter, multiple constraints can be applied to the
same nodes, all of which need to apply simultaneously.
Such constraints may even be in different files.
But they may never contradict each other:
if one declaration says a field is `5`, another may not override it to be `6`.
Declaring a field to be both `>5` and `<10` is valid, though.

This approach is more restricted than full-blown inheritance;
it may not be possible to reuse existing configurations.
On the other hand, it is also a more powerful boilerplate remover.
For instance, suppose each job in a set needs to use a specific
template.
Instead of having to spell this out at each point,
one can declare this separately in a one blanket statement.

So instead of

{{{with code "en" "non-dry"}}}
-- in.cue --
jobs: {
	foo: acmeMonitoring & {...}
	bar: acmeMonitoring & {...}
	baz: acmeMonitoring & {...}
}
{{{end}}}

one can write

{{{with code "en" "dry"}}}
-- in.cue --
jobs: [string]: acmeMonitoring

jobs: {
	foo: {...}
	bar: {...}
	baz: {...}
}
{{{end}}}

There is no need to repeat the reference to the monitoring template for
each job, as the first already states that all jobs _must_ use `acmeMonitoring`.
Such requirements can be specified across files.

This approach not only reduces the boilerplate contained in `acmeMonitoring`
but also removes the repetitiveness of having to specify
this template for each job in `jobs`.
At the same time, this statement acts as a type enforcement.
This dual function is a key aspect of CUE and
typed feature structure languages in general.

This approach breaks down, of course, if the restrictions in
`acmeMonitoring` are too stringent and jobs need to override them.
To this extent, CUE provides mechanisms to allow defaults, opt-out, and
soft constraints.
