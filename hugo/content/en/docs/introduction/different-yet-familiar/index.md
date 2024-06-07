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

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="left" >}}
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

// A list's final element can be followed by
// an optional comma, making additions or
// deletions at the end of the list less fiddly.
aList: [
	"a",
	"b",
	"c",
]
anotherList: [1, 2, 3, 4, 5]
a: deeply: nested: field: "value"
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBleGFtcGxlLmN1ZSAtLW91dCBqc29u" >}}
$ cue export example.cue --out json
{
    "strings": {
        "singleLine": "Double quotes == string literal",
        "multiLine": "Multiline strings start and end with triple\ndouble-quotes - no escaping of newlines!"
    },
    "foo_Bar": 1,
    "baz2": 2.2,
    "qu ux": "3.33",
    "4": "four",
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
    ],
    "a": {
        "deeply": {
            "nested": {
                "field": "value"
            }
        }
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}

## CUE Is Different

As you've just seen, CUE can be used to encode data using a friendlier, more
convenient syntax than JSON - and some folks do just that.
However many teams also rely on the language's powerful capabilities to
validate and secure their data and configurations, and these abilities build on
some rather unique characteristics.

Let's take a look at some aspects of CUE that you might not have
experienced in a language before ...

### Order Doesn't Matter

In CUE, **fields can be declared in any order**.
This property lies at the heart of many of CUE's behaviours and is often
referred to as *order irrelevance*. It applies at all levels of granularity:

- within the fields of each data *struct* (which is what JSON calls an "object"),
- across the fields and structs defined inside a single `.cue` file,
- when merging multiple `.cue` files that make up a CUE *package*.

Order irrelevance flows from the fact that the rules of CUE's most fundamental
operation guarantee that *every* possible ordering results in the same <!--FIXME: need to mention that it's the order of combining things that we're talking about here -->
underlying data structure - so it doesn't matter which *specific* ordering is
chosen. This operation is called **unification**, and it is the process by
which CUE determines if values are compatible with one another.

Unification occurs explicitly when you use the `&` operator, or implicitly when
you mention a field multiple times.
In formal terms, unification is associative, commutative and idempotent.
In *practical* terms, unification's rules mean that:

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

In this example, `A` and `B` are specified using implicit and explicit unification, respectively:

{{< code-tabs >}}
{{< code-tab name="data.cue" language="cue" area="top-left" >}}
A: 1
B: 2 & 2
A: 1
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBkYXRhLmN1ZSAtLW91dCB5YW1s" >}}
$ cue export data.cue --out yaml
A: 1
B: 2
{{< /code-tab >}}
{{< /code-tabs >}}

In this example you might be wondering if these unifications have any point -
surely no-one would *actually* specify\
`B: 2 & 2`? Wouldn't `B: 2` be sufficient?

In the case of the `B` field's value, you'd be right - this is simply a
demonstration of explict unification so that you can recognise it when we use
it later.
However the `A` field (whose value is assigned using implicit unification) is
more interesting when we realise that, by default, **the `cue` command
implicitly unifies the top level of all the data it's given**.
This means that when we invoke the `cue` command and tell it about different
sources of data, the evaluation result is the unification of all those sources.

To see what this means in practice, we'll unify some CUE, JSON, and YAML,
simply by mentioning the data files. Notice how `data-1.cue` uses CUE's
shorthand to succinctly define a nested struct that contains a single field,
avoiding several curly braces spread over several lines.

{{< code-tabs >}}
{{< code-tab name="data-1.cue" language="cue" area="top-left" >}}
CUE: true
a: b: c: 1
{{< /code-tab >}}
{{< code-tab name="data-2.json" language="json" area="top-right" >}}
{
    "JSON": true,
    "a": {
        "b": {
            "d": 2
        }
    }
}
{{< /code-tab >}}
{{< code-tab name="data-3.yml" language="yml" area="top-right" >}}
YAML: true
a:
  b:
    e: 3
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCBkYXRhLTEuY3VlIGRhdGEtMi5qc29uIGRhdGEtMy55bWwgLS1vdXQganNvbg==" >}}
$ cue export data-1.cue data-2.json data-3.yml --out json
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
{{< /code-tab >}}
{{< /code-tabs >}}

But look what happens when we try and specify a field with two incompatible
values - the `cue` command emits an error message pointing out the
incompatibility and the evaluation fails:

{{< code-tabs >}}
{{< code-tab name="data.cue" language="cue" area="top-left" >}}
source: "CUE"
{{< /code-tab >}}
{{< code-tab name="data.json" language="json" area="top-right" >}}
{
    "source": "JSON"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCBkYXRhLmN1ZSBkYXRhLmpzb24=" >}}
$ cue export data.cue data.json
source: conflicting values "CUE" and "JSON":
    ./data.cue:1:9
    ./data.json:2:15
{{< /code-tab >}}
{{< /code-tabs >}}

CUE's design ensures that combining CUE values in any order always gives the
same result. Later, in "Why CUE?", we'll see some of the situations and use
cases that have elegant solutions enabled by this property.

### Types are Values

<!-- FIXME from here -->

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
```cue
moscow: {
	name:    "Moscow"
	pop:     11.92M
	capital: true
}
```
{{< columns-separator >}}
Schema
```cue
municipality: {
	name:    string
	pop:     int
	capital: bool
}
```
{{< columns-separator >}}
CUE
```cue
largeCapital: {
	name:    string
	pop:     >5M
	capital: true
}
```
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
```json
{
    "a": 3,
    "b": {
        "c": "foo"
    }
}
```

could be represented as

```cue
"a": 3
"b": "c": "foo"
```

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

```cue
jobs: {
	foo: acmeMonitoring & {...}
	bar: acmeMonitoring & {...}
	baz: acmeMonitoring & {...}
}
```

one can write

```cue
jobs: [string]: acmeMonitoring

jobs: {
	foo: {...}
	bar: {...}
	baz: {...}
}
```

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
