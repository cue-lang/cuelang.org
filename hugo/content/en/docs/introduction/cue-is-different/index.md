---
title: Some Unique Differences
weight: 20
---

As you just saw in
[*A Familiar Look and Feel*]({{< relref "cue-is-familiar" >}}),
CUE can be used to encode data using a friendlier, more convenient syntax than
JSON - and some folks do just that. However many teams also rely on the
language's particular capabilities to validate and secure their data and
configurations, and these abilities build on some rather unique
characteristics.

Let's take a look at some aspects of CUE that you might not have
experienced in a language before ...

### Order Doesn't Matter

Most languages require variables, fields, or data to be declared before they're
used - especially when one data value depends on the value of another.

**CUE is different:** in CUE, *fields can be defined in any order*.

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

But watch what happens when we try and specify a field with two incompatible
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

CUE's design ensures that combining values in any order always gives the same
result. Later, in *Why CUE?*, we'll see some of the situations and use cases
that have elegant solutions enabled by this property.

### Types Are Values

In many languages there's a strong distinction between the concrete "values"
that a variable or field can be assigned (such as `"foo"`, `4.2`, or `true`)
and the "types" that describe *sets* of permissible values (strings,
floating-point numbers and booleans, respectively). Most languages don't
provide a first-class mechanism to constrain values more precisely, leaving any
nuanced value constraints for the user to implement in code and check
explicitly, at runtime.

**CUE is different:** *CUE doesn't differentiate between values and types*.

This is a powerful concept that, as you'll see shortly, allows you to define
detailed constraints - but it also simplifies the process of learning and using
CUE. Because the language has a single, unified syntax for data and for
constraints, there is no separate schema or data definition language to learn.
The syntax even encompasses concepts such as sum types and enums - even null
coalescing is reduced down to this single construct.

Whilst CUE does provide a type hierarchy that includes `string`, `float`,
and `bool`, along with `bytes`, `int`, `number`, `null`, `[...]` (list), and
`{...}` (struct), these are simply well-known names for constraints that limit
a field's value to well-defined sets or ranges.
The power of CUE comes from constructing precise constraints using these types
as a starting point, progressively layering and unifying additional constraints
built with CUE's rich set of primitives and built-in functions.

Here's an example that uses
[bounds]({{< relref "docs/tour/types/bounds" >}}) (`>`, `<=`, etc)
to construct constraints that limit a number's value, unified with additional
constraints from a
[disjunction]({{< relref "/docs/tour/types/disjunctions" >}})
("`|`") that requires a value to be one option from a prescribed set:

{{< code-tabs >}}
{{< code-tab name="constraints.cue" language="cue" area="left" >}}
#over10:    >10
#under50:   <50
#from5To40: >=5 & <=40
#options:   9 | 10 | 11 | 39 | 40 | 41

myNumber: int & #over10 & #under50
myNumber: #from5To40
myNumber: #options
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV2YWwgY29uc3RyYWludHMuY3Vl" >}}
$ cue eval constraints.cue
#over10:    >10
#under50:   <50
#from5To40: >=5 & <=40
#options:   9 | 10 | 11 | 39 | 40 | 41
myNumber:   11 | 39 | 40
{{< /code-tab >}}
{{< /code-tabs >}}

In the `cue eval` output, notice how CUE is able to *simplify* the constraints
that apply to the `myNumber` field by ruling out options that definitely aren't
possible, due to the implicit and explicit unification of the constraints that
we defined.

Later, in *Why CUE?*, we'll see how CUE's merging of types, values, and
constraints into a single concept enables effective and concise schema and
policy validation.

### Push Constraints, Don't Pull Them

CUE's constraints act as data validators:

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue" area="top-left" >}}
A: int
B: float
C: string
{{< /code-tab >}}
{{< code-tab name="policy.cue" language="cue" area="top-left" >}}
A: <=99
B: >4.2
C: !="rm -rf /"
{{< /code-tab >}}
{{< code-tab name="data.yml" language="yml" area="top-right" >}}
A: 100
B: 1.1
C: "rm -rf /"
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCBzY2hlbWEuY3VlIHBvbGljeS5jdWUgZGF0YS55bWw=" >}}
$ cue vet schema.cue policy.cue data.yml
A: invalid value 100 (out of bound <=99):
    ./policy.cue:1:4
    ./data.yml:1:4
B: invalid value 1.1 (out of bound >4.2):
    ./policy.cue:2:4
    ./data.yml:2:4
C: invalid value "rm -rf /" (out of bound !="rm -rf /"):
    ./policy.cue:3:4
    ./data.yml:3:4
    ./schema.cue:3:4
{{< /code-tab >}}
{{< /code-tabs >}}

*Pattern constraints* impose constraints on all the fields whose names match
their pattern. They're written as\
`[pattern]: value`, where `pattern` must be either a value
of type string, or the wildcard value `_` (called "top"). Here's an
example of pattern constraints in action:

{{< code-tabs >}}
{{< code-tab name="constraints.cue" language="cue" area="top-left" >}}
A: {
	// Every field  must be an int.
	[_]: int
	// Every field whose name starts with b must
	// be 10 or greater.
	[=~"^b"]: >=10
}
{{< /code-tab >}}
{{< code-tab name="data.yml" language="yml" area="top-right" >}}
A:
  foo: 4.2
  bar: 100
  baz: 5
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCBjb25zdHJhaW50cy5jdWUgZGF0YS55bWw=" >}}
$ cue vet constraints.cue data.yml
A.foo: conflicting values 4.2 and int (mismatched types float and int):
    ./constraints.cue:3:7
    ./data.yml:2:8
A.baz: invalid value 5 (out of bound >=10):
    ./constraints.cue:6:12
    ./data.yml:4:8
{{< /code-tab >}}
{{< /code-tabs >}}

Pattern constraints *don't* instantiate every field that their pattern might
match. If they *did*, then the example pattern constraint of `[string]: >10`
would bring every field with a name matching `string` into existence - i.e.
*every possible field*, which would take an unacceptable amount of time to
compute, no matter how powerful your hardware! So: a pattern constraint merely
acts on fields by imposing its constraints on *existing* fields that match its
pattern.

Many languages have a form of import, or perhaps inheritance, that allows
lower-level (more deeply nested) components to pull restrictions in from some
other entity by specifying them at the point of use.

**CUE is different:** *unification and pattern constraints offer a simple way
to impose constraints from above*.

CUE has a robust
[package]({{< relref "/docs/concept/modules-packages-instances" >}}) system
and a carefully designed
[module]({{< relref "/docs/reference/modules" >}}) system
which support imports and cross-entity data and constraint sharing.
Before reaching for those tools, however, it's worth discovering just how
flexible and powerful pattern constraints and unification can be!

In *Why CUE?* we'll see how pattern constraints are the backbone of a highly
productive mechanism for reducing boilerplate data and configuration, whilst
also enforcing more centralised policy constraints on nested data.

{{< warning >}}
**On the next page**: discover how CUE's differences have a real impact on data
handling and validation, and why teams trust it with their configurations at
all scales.
{{< /warning >}}

*Next page:* [Why CUE?]({{< relref "why-cue" >}})
