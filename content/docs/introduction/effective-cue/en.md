---
title: Effective CUE
weight: 40
---

CUE is designed to help users and teams manage data and configuration across
all scales. Here are some strategies that help make your use of CUE more
effective.

### Start with broad definitions and get progressively more specific

In general, using CUE, we start with a broad definition of a type that
describes all possible instances of the type. We then narrow down these
definitions, often combining constraints from multiple sources (e.g. different
departments, teams, and users), until a concrete data instance remains.

Here's a demonstration of this at a small scale. Keep in mind that CUE permits
this approach to be used effectively at far larger scales:

{{< columns >}}
{{{with upload "en" "schema"}}}
-- schema.cue --
package geo

#Municipality: {
	name:    string
	pop:     int
	capital: bool
}
{{{end}}}
{{< columns-separator >}}
{{{with upload "en" "CUE"}}}
-- native.cue --
package geo

#LargeCapital: #Municipality & {
	name:    string
	pop:     >5M
	capital: true
}
{{{end}}}
{{< columns-separator >}}
{{{with upload "en" "data"}}}
-- data.cue --
package geo

kinshasa: #LargeCapital & {
	name:    "Kinshasa"
	pop:     16.315M
	capital: true
}
{{{end}}}
{{< /columns >}}
{{{with _script_ "en" "HIDDEN: vet"}}}
cue vet .:geo
{{{end}}}

### Separate configuration from computation

Situations often arise where it looks like we'll need to do complex
computations to generate some configuration data. This approach is generally in
conflict with the goal of using a *simple* configuration language that permits
and encourages changes that can be understood in isolation, at speed, possibly
by non-domain experts.

CUE has a stance that computation and configuration should be separated - and
*unification* makes this easy, because of *order irrelevance*.
Data that needs to be be computed can be generated outside CUE, and mixed into
a configuration using unification, CUE packages, and the `cue` command's
support for a variety of
[different data encodings]({{< relref "/docs/integration" >}}).

The processes that compute this data can even be orchestrated by a CUE
[workflow command]({{< relref "docs/concept/how-cue-enables-configuration" >}}#tooling-and-automation),
enhancing developer workflows and performing inline computation input/output
validation.

### Make appropriate choices for your level of scale

The usefulness of a specific language can depend on the scale of the project
being developed, but adopting the "perfect" language for every new scale
milestone can put a cognitive strain on developers. CUE aims to minimize the
high cost of migrating from one language to another, as scaling requirements
change, by delivering solutions to data- and configuration-related tasks at all
scales:

- **Small scale**: reducing boilerplate in configurations is not necessarily
  the most effective thing to do. However, even at a small scale, repetition
  can be tedious and lead to errors. For these situations, where it might be
  best to keep small configurations specified and updated in isolation, CUE can
  be used to define schemas that validate type-free
  [JSON]({{< relref "/docs/howto/validate-json-using-cue" >}}) and
  [YAML]({{< relref "/docs/howto/validate-yaml-using-cue" >}}) files.
- **Medium scale**: when the size or complexity of configurations reaches a
  certain point, reducing boilerplate may start to become a more attractive
  proposition. As you saw, earlier in this introduction, CUE can be used to
  isolate such boilerplate, with the `cue trim` command removing it
  automatically. It's not uncommon for thousands of lines to be obliterated
  using this approach.
- **Large scale**: The
  [formalism that underlies CUE](https://github.com/cue-lang/cue/blob/master/doc/ref/impl.md)
  was specifically developed for large-scale configuration. CUE's import model
  incorporates many best practices for large-scale engineering, and the
  language is optimized for automation through advanced tooling. The
  mathematical model and
  [the logic of CUE]({{< relref "/docs/concept/the-logic-of-cue" >}})
  permits automation that's inaccessible for most other approaches - such as
  `cue trim`'s capabilities. Read the next section, *Tooling*, for more on
  this.

### Know when to invest in building specialized tooling

Automation is key. In contemporary operations, a large amount of code and
configuration gets generated, analyzed, reformatted, and mananged by machines.
The CUE language, its APIs, and its tooling have been designed to allow for
this mechanical manipulation, and you should anticipate taking advantage of
these capabilities as the scale and complexity of your mission grows.

CUE's automation-friendly design is exemplified by these characteristics:

- the language is easy to scan and parse
- there are specific restrictions on imports that prevent configuration graphs
  of unbounded complexity
- data can be split across files and generated from different sources
- order irrelevance permits values and constraints to be mixed together easily,
  without having to specify (or care about) the order in which they're combined
- packages are defined at the directory level
- its first-class value and type model is unparalleled.

*Next page:* [Installing CUE]({{< relref "installation" >}})
