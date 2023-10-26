---
title: "Configuration use case"
description: "Managing text-based files to define a desired state of a system"
---

Arguably, validation should be the foremost task of any configuration language.
Most configuration languages, however, focus on boilerplate removal.
CUE is different in that it takes the validation first stance.
But CUE's constraints are also effective at reducing boilerplate,
although the approach it takes is quite different from conventional
data templating languages.

CUE basic operation merges configurations in a way that the outcome is
always the same regardless of the order in which it is carried out
(it is associative, commutative and idempotent).
This property is the foundation for many other favorable properties, as discussed below.


## Core issues addressed by CUE

### Type checking

 For large code bases, no one will question a requirement to
 have a compiled/typed language.
 Why should one not require the same kind of rigor for data?

Many configuration languages, including GCL and its offspring, focus on
reducing boilerplate as the primary task of configuration.
Support for typing, however, is minimal or almost non-existent.

Some languages do add typing support, but it is usually
limited to validating basic types, as is common with programming languages.
For data, however, this is insufficient.
Evidence of this is the uprise of standards like CDDL and OpenAPI that
go beyond basic typing.

In CUE types and values are a unified concept, which gives it very
expressive, yet intuitive and compact, typing capabilities.

```text
#Spec: {
	kind: string

	name: {
		first:   !="" // must be specified and non-empty
		middle?: !="" // optional, but must be non-empty when specified
		last:    !=""
	}

	// The minimum must be strictly smaller than the maximum and vice versa.
	minimum?: int & <maximum
	maximum?: int & >minimum
}

// A spec is of type #Spec
spec: #Spec
spec: {
	knid: "Homo Sapiens" // error, misspelled field

	name: first: "Jane"
	name: last:  "Doe"
}
```

### Simplicity at Scale

When using a configuration language to reduce boilerplate
one should consider whether the reduced verbosity is worth the
increased complexity.
Most configurations use an override model to reducing boilerplate:
an existing configuration is used as a base and modified to result in
a new configuration.
This is often in the form of inheritance.

For small-scale projects,
using inheritance can be too complex, and the simplicity of
spelling everything out is often a superior approach.
For large-scale projects, however, using inheritance often leads to deep
layerings of modifications, making it very hard to see where values come from.
In the end, it is again questionable whether the added complexity is worth it.

Like with other configuration languages, CUE can add complexity if values
are organized to come from multiple places.
However, as CUE disallows overrides, deep layerings are naturally prevented.
More importantly, CUE can also enhance readability.
A definition in one file may apply to values in many other files.
Where one would usually have to open all these files to verify validity;
with CUE one can see it at a glance.

CUE's approach has been battle-tested in computational linguistics where it
has been used for decades to describe human languages;
effectively very large, complex and irregular configurations.


### Abstractions versus Direct Access

A common debate for configuration languages is whether a language should
provide an abstraction layer for APIs.
On the one hand, abstraction layers allow for protecting the user against misuse.
On the other hand, they need to keep up with API changes and are
inevitably prone to drift.
So it goes.

CUE addresses both issues.
On the one hand, its fine-grained typing allows layering detailed constraints
on top of native APIs, without the need for an abstraction layer.
New features can be used without support of existing definitions.

On the other hand, CUE's order independence allows abstraction layers
to inject arbitrary raw API in a controlled manner,
allowing a general escape hatch to support new or uncovered features.
See the Manual section of the
[Kubernetes tutorial](https://github.com/cue-labs/cue-by-example/blob/main/003_kubernetes_tutorial/README.md)
for an example.

### Tooling

A configuration language usually transforms its configurations to
a lower-level representation, like JSON, YAML, or Protobuf so that
it can be consumed by tools taking in these languages.
Piping such output to the needed tools works initially;
but sooner or later one will get the desire to automate this,
usually in the form of some kind of tool.

And so it goes.
The rise of systems requiring advanced configuration has been paired
with a rise of even more specialized command line tools.
The core structure of all these tools is more or less the same.
More annoyingly, many have overlapping functionality yet are hardly extendable
or interoperable.
In the latter case, one may see the need to layer on yet another set of tools.

Having tools like `kubectl` or `etcdctl` that directly control
core infrastructure makes sense, but at higher levels of
abstraction one needs a more open approach.

CUE attempts to address this by providing an open,
declarative scripting layer on top of the configuration layer.
Aside from the above-mentioned case, it is designed to address various
other issues:

- inject environmental data into configuration, something not allowed
  in CUE itself (it is pure, or hermetic, or side-effect free)
- inject computed data into configurations as part of a pipeline
- allow composability of tool integration

Again, the ability to deterministically merge data from different sources
make this a shoo-in task for CUE.


## Comparisons

### Inheritance-based configuration languages

Inheritance, is
not commutative and idempotent in the general case. In other words, order
matters.
This makes it hard to track where values are coming from.
This is not only true for humans, but also machines.
It makes it very complicated, if not impossible, to do any kind of
automation.
The complexity of inheritance is even bigger if values
can enter an object from one of several directions (super, overlay, etc.).

The basic operation of CUE is commutative, associative and idempotent.
This order independence helps both
humans and machines. The resulting model is much less complex.

{{< info >}}
### Inheritance in CUE
Although CUE does not have inheritance in the override sense, it does have
the notion of one value being an instance of another.
In fact, this is a core principle.

Let's use a real-world example to make this distinction clear:
In the override model of inheritance, one can take an existing template,
say a dog, and modify it to become a cat.
Trim the ears, dry off the nose, and what have you.

In CUE, it is a matter of classification.
Cats and dogs are both instances of animals, but once an entity is defined
to be a cat, it can never become a dog.
To most humans (aka computer scientists that have not become accustomed
to inheritance) this makes total sense.
{{< /info >}}

Although one can create instances of values (remember, types are values),
one can not alter any of the values of a parent.
A template acts as a type.
Just as in statically typed languages where one cannot assign an integer to
a string, one cannot violate the properties of a type in CUE.

These restrictions reduce flexibility, but also enhance clarity.
To ensure that a configuration holds a certain property, just declare it
in any file included in the project to make it so.
There is no need to look at other files.
As we saw; the imposed restrictions can also improve, rather than hurt,
the ability to remove boilerplate compared to inheritance-based languages.

The complexity of inheritance-based models also hampers automation.
The introduction of GCL was paired with the promise of advanced tooling.
The mantra of declarative languages was even repeated with some of
its offspring.
The tooling never materialized, though, as the model made it intractable.

CUE already provides power tools like trim, and its API provides
unify and subsumption operations for incomplete configurations, the building
blocks for powerful analysis.


<!-- TODO:
### Imperative Configuration Languages
-->

### Jsonnet/ GCL

Like Jsonnet, CUE is a superset of JSON.
They also are both influenced by GCL.
CUE, in turn is influenced by Jsonnet.
This may give the semblance that the languages are very similar.
At the core, though, they are very different.

CUE's focus is data validation whereas Jsonnet focuses on data templating
(boilerplate removal).
Jsonnet was not designed with validation in mind.

Jsonnet and GCL can be quite powerful at reducing boilerplate.
The goal of CUE is not to be better at boilerplate removal than Jsonnet or GCL.
CUE was designed to be an answer to two major shortcomings of these approaches:
complexity and lack of typing.
Jsonnet reduces some of the complexities of GCL, but largely falls into the
same category.
For CUE, the tradeoff was to add typing and reduce complexity
(for humans and machines), at the expense of giving up flexibility.


### HCL

HCL has some striking similarities with GCL.
But whether this was a coincidence or deliberate, it removes the core
source of complexity of GCL: inheritance.

It does introduce a poor man's version of inheritance: file overlays.
Fields may be defined in multiple files that get overwritten in a certain
order of the file names.
Although not nearly as complex as GCL, it does have some of the same issues.

Also, whether the removal of inheritance was a coincidence or great insight,
there is no construct given in return that one might need for larger scale
configuration management.
This means the use of HCL may hit a ceiling for medium to larger setups.

So what CUE has to offer to users of HCL is: typing, better growth prospects
to larger scale operations, and eliminating the peculiarities of file overlays.

CUE does borrow one construct from HCL: the folding of single-field objects
onto a single line was directly inspired by HCL's very similar approach.


<!--
Possible other comparisons:
 - Kustomize
 - Python offshoots: Picolo, Coil, etc.
 - Skylark as a special case.
 - Nix
 - using plain YAML/JSON
-->
