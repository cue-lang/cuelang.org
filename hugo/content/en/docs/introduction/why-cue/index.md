---
title: Why CUE?
weight: 30
---

<<<<<<< HEAD
=======
The features that make CUE so effective are the result of its careful design,
which is the product of decades of experience in the data and cofiguration
space. The language's behaviours are formally defined in
[The CUE Language Specification]({{< relref "/docs/reference/spec" >}}),
but you don't need to study the spec in order to understand how CUE can make
life easier.

Let's briefly run through a few of CUE's features, and discover the real-world
impact they can have on data, configuration, schema, and policy - no matter
your level of scale. On this page we'll see
that [types are values](#types-are-values),
why [order doesn't matter](#order-doesnt-matter), and also
how [templates make important data stand out](#templates-make-important-data-stand-out).

<!-- H3 so that it doesn't break the flow of the page-level LH TOC -->
### Types Are Values

CUE doesn't distinguish between types and values.
In CUE, types *are* values ... and values are types.\
This concept is fundamental to how CUE works, and here are some of its implications:

**1) CUE has a single, unified syntax for data and for constraints**

Here's an example of some simplistic CUE being used to plan out a garden:

{{< code-tabs >}}
{{< code-tab name="garden.cue" language="cue" area="left" >}}
import "math"

// Our planned garden features a circular lawn.
lawnRadius: 15

// We will pave around the lawn's circumference,
// but we only have 100 units of paving slabs.
pavingUnits: (2 * math.Pi * lawnRadius) & <=100

// The lawn requires πr² turf units to construct.
turfArea: math.Pi * (lawnRadius * lawnRadius)
// The lawn needs to be large enough for parties.
turfArea: >=750
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV2YWwgZ2FyZGVuLmN1ZQ==" >}}
$ cue eval garden.cue
turfArea: invalid value 706.8583470577034786540947612378881 (out of bound >=750):
    ./garden.cue:13:11
    ./garden.cue:11:11
{{< /code-tab >}}
{{< /code-tabs >}}

This example uses a concrete value (`lawnRadius`) to calculate the
values of two other fields, both of which have constraints placed on them using
[bounds]({{< relref "docs/tour/types/bounds" >}}).
In this simple form, everything -- the concrete data, the calculated fields,
and their constraints -- can sit in the same file, in the same namespace, using
the same syntax.
Constraints can live inline, as with `pavingUnits`, or be placed separately,
like `turfArea`. The intent of the constraints is clear for humans to read, but
also succinct and precise, allowing the `cue vet` command to flag up that our
planned lawn wouldn't be big enough!

**FIXME) Constraints are first-class values**

Constraints can be used like values because *they are values*.
They can be referred to, combined ("unified"), and evaluated using the same
consolidated syntax we saw above.

Here's some data and some constraints being processed by `cue eval` - notice
how CUE is able to *simplify* the unified constraints that apply to the
`myNumber` field by ruling out options that aren't possible given the
[disjunction]({{< relref "/docs/tour/types/disjunctions" >}})
("`|`") and bounds being unified:

{{< code-tabs >}}
{{< code-tab name="constraints.cue" language="cue" area="left" >}}
over10:    >10
under50:   <50
from5To40: >=5 & <=40
options:   9 | 10 | 11 | 39 | 40 | 41

myNumber: over10 & under50 & from5To40 & options
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV2YWwgY29uc3RyYWludHMuY3Vl" >}}
$ cue eval constraints.cue
over10:    >10
under50:   <50
from5To40: >=5 & <=40
options:   9 | 10 | 11 | 39 | 40 | 41
myNumber:  11 | 39 | 40
{{< /code-tab >}}
{{< /code-tabs >}}

CUE only requires that values must be concrete (i.e. a value that could be
represented in a format such as JSON or YAML) if they are exported, e.g. using
`cue export`. The `cue eval` shown here allows us to see the result of the
evaluation before any such export.

**2) CUE provides some basic types, but they aren't special** \<\<FIXME:heading

CUE handles constraints identically to the "basic types" that constraints build
up from. The language doesn't treat the `float`  constraint as being any more
important or fundamental than the additional constraint `float & >10`. CUE only
cares about values' relative positions in its value lattice - a concept you can
read more about in
[The Logic of CUE]({{< relref "/docs/concept/the-logic-of-cue" >}}).

**3) Any value can be used as a constraint**

Because types are values, and values are types, any value can be *used* as a
type or, as CUE prefers to say, any value can be used as a *constraint*.

Each time a field is declared CUE links that field's *name* to a *value*. As
you'll read shortly, in [Order Doesn't Matter](FIXME), that value can be
further refined, resulting in the unified constraints that the field's concrete
value *must* adhere to.

Each fiel

 The value might be By defining a field, we link that its name to that value, and also 

i.e. Anything that can be declared as a LHS can be used as a RHS.
Nested values. Nested constraints.

Finish with (and extend) existing municipality/largeCapital example. e.g.

```
largeCapital: municipality
moscow: largeCapital
```

### Order Doesn't Matter

i.e. Order independence / irrelevance.
Split into multiple files.
Constraints are unified.
Use existing "Separate configuration from computation" prose and the "mix in" idea.

### Templates Make Important Data Stand Out

i.e. Boilerplate avoidance; push constraints, don't pull; 










<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>












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


# PRE-UPDATE PAGE CONTENT BELOW HERE

### Separate configuration from computation

There comes a time that one (seemingly) will need do complex
computations to generate some configuration data.
But simplicity of a configuration language can be paramount when one quickly
needs to make changes.
These are obviously conflicting interests.

CUE takes the stance that computation and configuration should
be separated.
And CUE actually makes this easy.
The data that needs to be computed can be generated outside of CUE
and put in a file that is to be mixed in.
The data can even be generated in CUE's scripting layer and automatically
injected in a configuration pipeline.
Both approaches rely on CUE's property that the order in which this data gets
added is irrelevant.



### Be useful at all scales

The usefulness of a language may depend on the scale of the project.
Having too many different languages can put a cognitive strain on
developers, though, and migrating from one language to another as
scaling requirements change can be very costly.
CUE aims to minimize these costs
by covering a myriad of data- and configuration-related tasks at all scales.

**Small scale**
At small scales, reducing boilerplate in configurations is not necessarily
the best thing to do.
Even at a small scale, however, repetition can be error prone.
For such cases, CUE can define schema to validate otherwise
typeless data files.

**Medium scale**
As soon the desire arises to reduce boilerplate, the `cue` tool can
help to automatically rewrite configurations.
See the Quick and Dirty section of the
[Kubernetes tutorial](https://github.com/cue-labs/cue-by-example/blob/main/003_kubernetes_tutorial/README.md)
for an example using the `import` and `trim` tool.
Thousands of lines can be obliterated automatically using this approach.

**Large scale**
CUE's underlying formalism was developed for large-scale configuration.
Its import model incorporates best practices for large-scale engineering
and it is optimized for automation.
A key to this is advanced tooling.
The mathematical model underlying CUE's operations allows for
automation that is intractable for most other approaches.
CUE's `trim` command is an example of this.


### Tooling

Automation is key.
Nowadays, a good chunk of code gets generated, analyzed, reformatted,
and so on by machines.
The CUE language, APIs, and tooling have been designed to allow for
machine manipulation.
Aspects of this are:

- make the language easy to scan and parse,
- restrictions on imports,
- allow any piece of data to be split across files and generated
  from different sources,
- define packages at the directory level,
- and of course its value and type model.

The order independence also plays a key role in this.
It allows combining constraints from various sources without having
to define any order in which they are to be applied to get
predictable results.


<!-- something about this?
Not turing complete.
Run in contexts where cost is hard to attribute.
Easier to make claims about termination (smart contracts).
-->
