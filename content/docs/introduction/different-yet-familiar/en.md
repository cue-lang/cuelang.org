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

- C-style comments ("`//`") are allowed
- field names without special characters don’t need to be quoted
- the outermost curly braces in a CUE file are optional
- commas after a field are optional (and are usually omitted)
- commas after the final element of a list are allowed
- multiline strings don't require newlines to be escaped

Here's some data encoded in commented CUE, alongside the equivalent JSON document
(note the lack of curly braces at the top and bottom, and the missing commas after each field's value):

{{{with code "en" "CUE improves on JSON"}}}
#location left right
exec cue export example.cue --out json
cmp stdout out
-- example.cue --
singleLineString: "some string"
multiLineString: """
	Triple quotes mark the start and end of a
	multiline string. No newline-escaping required!
	"""

// Many field names don't need to be quoted (but
// can be, if you really want to).
foo:    1
BAR:    2
baz_42: 3 // Underscores don't require quotes.
"quux": 4 // These quotes are optional.

// Some field names do need quotes, such as those
// that start with numbers, or contain spaces,
// hyphens, or other special characters.
"4foo":  5
"b ar":  6
"b-az":  7
"q:uux": 8
"q^uux": 9

// A list's final element can be followed by
// an optional comma, making additions or
// deletions at the end of the list less fiddly.
aList: [
	"a",
	"b",
	"c",
]
-- out --
{
    "singleLineString": "some string",
    "multiLineString": "Triple quotes mark the start and end of a\nmultiline string. No newline-escaping required!",
    "foo": 1,
    "BAR": 2,
    "baz_42": 3,
    "quux": 4,
    "4foo": 5,
    "b ar": 6,
    "b-az": 7,
    "q:uux": 8,
    "q^uux": 9,
    "aList": [
        "a",
        "b",
        "c"
    ]
}
{{{end}}}


## CUE Is Different

As you've just seen, CUE can be used to encode data using a friendlier, more
human-focussed syntax than JSON - and some folks do just that.
Many teams, however, rely on the language's powerful capabilities to validate
and secure their data and configurations, and these abilities build on some
rather unique characteristics.

Let's continue by taking a look at some aspects of CUE that you might not have
experienced in a language before ...

### Order Doesn't Matter

In CUE, **fields can be declared in any order**.
This property lies at the heart of many of CUE's behaviours and is often
referred to as *order irrelevance*. It applies at all levels of granularity:

- within the fields of each data *struct* (which is what JSON calls an "object"),
- across the fields and structs defined inside a single `.cue` file,
- when merging multiple `.cue` files that make up a CUE *package*.

Order irrelevance flows from the fact that the rules of CUE's most fundamental
operation guarantee that *every* possible ordering results in the same
underlying data structure - so it doesn't matter which *specific* ordering is
chosen. This operation is called **unification**.

In formal terms, unification is associative, commutative and idempotent.
In *practical* terms, unification means that:

- Data is immutable: if a field is made concrete by assigning it a specific
  value, that value is fixed and cannot be changed. This might appear
  restrictive at first glance, but in reality CUE gives you plenty of options
  to cater for the different problematic situations you might be imagining!
- Data and constraints can be combined from multiple sources predictably and
  efficiently, optionally using a convenient shorthand form for specifying
  sparsely-populated structs.
- If a field is declared more than once, then all its assigned values must be
  compatible with each other. When only specifying concrete data, this
  simplifies down: all the assigned values must be *identical*.

Unification occurs explicitly when you use the `&` operator, or implicitly when
you mention a field multiple times. In this example, `A` and `B` are specified
using implicit and explicit unification, respectively:

{{{with code "en" "simple unification"}}}
exec cue export data.cue --out yaml
cmp stdout out
-- data.cue --
A: 1

B: 2 & 2

C: 3
A: 1
-- out --
A: 1
B: 2
C: 3
{{{end}}}

Reading that example, you might be wondering if the unifications have any point -
surely no-one would *actually* specify `B: 2 & 2`? Wouldn't `B: 2` be sufficient?

In the case of the `B` field, you'd be right - this is simply a demonstration
of the syntax so that you can recognise it later.
But with the `A` field, a more interesting situation occurs when we realise
that **CUE unifies all the data it's given**. 

This means that when we invoke the `cue` command and tell it about various
different sources of data, the result is the *unification* of all those
sources. In this example, we'll unify some CUE, some JSON, and some YAML,
simply by mentioning the data files. Notice how the CUE data uses a convenient
shorthand for adding deeply nested fields into the JSON and YAML data
structures:

{{{with code "en" "multi-file unification"}}}
#location top top top bottom
exec cue export data-1.cue data-2.json data-3.yml --out json
cmp stdout out
-- data-1.cue --
"data from CUE": true

a: b: c: 1
-- data-2.json --
{
    "data from JSON": true,
    "a": {
        "b": {
            "d": 2
        }
    }
}
-- data-3.yml --
data from YAML: true
a:
  b:
    e: 3
-- out --
{
    "data from JSON": true,
    "data from YAML": true,
    "data from CUE": true,
    "a": {
        "b": {
            "d": 2,
            "e": 3,
            "c": 1
        }
    }
}
{{{end}}}



But look what happens when we try and specify a field 

Here's an example

 CUE   There are exceptions to this rule, such as the members of a list (which are inherently ordered), but 


CUE's design ensures that combining CUE values in any
order always gives the same result
(it is associative, commutative and idempotent).
This makes CUE particularly well-suited for cases where CUE
constraints are combined from different sources:

- Data validation: different departments or groups can each
define their own constraints to apply to the same set of data.

- Code extraction and generation: extract CUE definitions from
multiple sources (Go code, Protobuf), combine them into a single
definition, and use that to generate definitions in another
format (e.g. OpenAPI).

- Configuration: values can be combined from different sources
  without one having to import the other.

The ordering of values also allows set containment analysis of entire
configurations.
Where most validation systems are limited to checking whether a concrete
value matches a schema, CUE can validate whether any instance of
one schema is also an instance of another (is it backwards compatible?),
or compute a new schema that represents all instances that match
two other schema.

### Types are Values

CUE does not distinguish between values and types.
This is a powerful notion that allows CUE to define ultra-detailed
constraints, but it also simplifies things considerably:
there is no separate schema or data definition language to learn
and related language constructs such as sum types, enums,
and even null coalescing collapse onto a single construct.

Below is a demonstration of this concept.
On the left one can see a JSON object (in CUE syntax) with some properties
about the city of Moscow.
The middle column shows a possible schema for any municipality.
On the right one sees a mix between data and schema as is exemplary of CUE.

{{< columns >}}
Data
{{{with code "en" "data"}}}
-- in.cue --
moscow: {
	name:    "Moscow"
	pop:     11.92M
	capital: true
}
{{{end}}}
{{< columns-separator >}}
Schema
{{{with code "en" "schema"}}}
-- in.cue --
municipality: {
	name:    string
	pop:     int
	capital: bool
}
{{{end}}}
{{< columns-separator >}}
CUE
{{{with code "en" "CUE"}}}
-- in.cue --
largeCapital: {
	name:    string
	pop:     >5M
	capital: true
}
{{{end}}}
{{< /columns >}}

In general, in CUE one starts with a broad definition of a type, describing
all possible instances.
One then narrows down these definitions, possibly by combining constraints
from different sources (departments, users), until a concrete data instance
remains.


### Push, not pull, constraints

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
