---
title: How CUE enables data validation
tags:
- validation
aliases:
- docs/concept/data-validation-use-case
authors:
- jpluscplusm
toc_hide: true
---

CUE is designed to make data validation **easy**, **powerful**, and **flexible**.

Let's visit each of those characteristics in turn ...

<!--
FIXME: client-side validation motivation from
https://cuelang.org/docs/concept/data-validation-use-case/#client-side-validation

In this guide, we'll explore some ways that CUE helps ensure data validity by
starting small, and building out from there.

-->

## CUE makes data validation *easy*

Validating data files with the `cue` command is simple. All we have to do is:

- define some constraints, and
- tell `cue` to test that each data file **unifies** successfully with the
  constraints.

[Unification]({{< relref "docs/tour/basics/duplicate-fields" >}}) is CUE's core
operation - it's central to how the language and its tooling works.
It allows data and constraints to work at all scales, and is one of the
mechanisms that permit CUE to perform automated processes such as removing
boilerplate. You'll see more about unification later.

<!--
{{< info >}}
CUE says that two values are able to "unify" if they **don't conflict**.
This can be as trivial as the values literally being the same
(`42` doesn't conflict with `42`, but *does* conflict with `"foo"`)
but more commonly involves a **type**
(`42` doesn't conflict with `number`, but *does* conflict with `string`)
or a **constraint**
(`42` conflicts with `<=10` and unifies successfully with `>40.1`).
{{< /info >}}
-->

Here's an example set of data files that we'd like to validate - two YAML files and a JSON file:

<!-- TODO: move to multi-file upload when https://cuelang.org/issues/2991 is resolved -->
{{< columns >}}
{{{with upload "en" "data: alex"}}}
-- alex.yml --
name: Alex Atkinson
type: dog
height: 55
diet: kibble
{{{end}}}
{{< columns-separator >}}
{{{with upload "en" "data: bryn (broken)"}}}
-- bryn.json --
{
    "name": "Bryn Brown",
    "type": "goldfish",
    "height": "2"
}
{{{end}}}
{{< columns-separator >}}
{{{with upload "en" "data: charlie"}}}
-- charlie.yaml --
name: Charlie Cartwright
type: cat
diet: chicken
{{{end}}}
{{< /columns >}}

Writing a schema that validates these data files is easy. We simply mirror the
data structure in a CUE file, marking important fields as either *optional* or
*required*, with `?:` and `!:` respectively:

{{{with upload "en" "schema: CUE"}}}
-- schema.cue --
package example

name!:   string // All animals have a name.
type!:   string // Every animal must have a type.
height?: int    // We haven't measured each and every animal, yet.
{{{end}}}

The `cue vet` command validates our three data files against this schema.
Each file is validated independently:

<!-- TODO: roll this missing required field demo into a later, multi-data-file example
  after https://github.com/cue-lang/cue/issues/2520 is addressed. -->

{{{with script "en" "cue vet #1"}}}
! cue vet . alex.yml bryn.json charlie.yaml
{{{end}}}

`cue vet` caught a common type error in our data, telling us that line 4 of the
`bryn.json` file mistakenly contains a string value where it should be an
integer (in the `height` field).
Let's correct that data, and then repeat the command:

{{<columns>}}
{{{with upload "en" "data: bryn (fixed)"}}}
#force
-- bryn.json --
{
    "name": "Bryn Brown",
    "type": "goldfish",
    "height": 2
}
{{{end}}}
{{<columns-separator>}}
{{{with script "en" "cue vet #2"}}}
cue vet . alex.yml bryn.json charlie.yaml
{{{end}}}
{{</columns>}}

The command is silent, which tells us that our data validated successfully.

Notice how the `diet` fields in `alex.yml` and `charlie.yaml` *don't* get
flagged up, despite being present in the data but not in the schema?  This is
deliberate.

When we invoke `cue vet` by only telling it about some CUE and some data files,
its behaviour is to allow us to specify **only** the important data fields that
we care about, without having to fully describe the data's structure. This lets
us get started easily, performing partial validation of the most critical data
\- without having to spend time exhaustively documenting each and every field.
As we'll see shortly, this behaviour can be changed.

## CUE makes data validation *powerful*

In the previous section we validated three simple data files against a trivial
schema. The schema contained *type constraints* that made sure specific fields
were of type `string` and `int`. CUE's types also include `float`, `number`
(the superset of `int` and `float`), `bytes`, `null` and `bool`, but its
*constraints* enable much more sophisticated data validation than simple type
checking.

<!-- FIXME: example building on previous section:

- policy.cue, unified with schema.cue:
  - height: <50
  - type: disjunction omitting "goldfish"

Point out: unification applies to constraints, not just values.
Show failure x2, fix policy.
(Vet should show both failures in a single invocation.)
Mention other constraints. Mention closedness.
Example with bounds using references (or is this under "flexible"?)
-->

## CUE makes data validation *flexible*

<!-- FIXME: fresh(?) example, using JSON Schema alone (directly), and then unifying it with additional CUE detail

Show data being validated from files, then an example from stdin.
"if" clause, applying constraints selectively.
-->

<!--
## Document databases
FIXME: adapt https://cuelang.org/docs/concept/data-validation-use-case/#validating-document-oriented-databases

FIXME: remainder of guide - what else needs covering?
-->

<!-- FIXME: delete when not needed
### Prohibiting unknown fields

As we've seen, the simplest way of invoking `cue vet` optimises for a common
case: where unknown fields need to be permitted in data files, whilst
validating known fields.
That's useful when folks are starting out with data validation, before they've
invested the time needed to construct schemas that *fully* describes their data
\- but some teams need to be more rigorous.

CUE can **prohibit unknown fields using its concept of
[closedness]({{< relref "docs/tour/types/closed" >}})**.

In this example we take the data from the previous example,
fix its problem, and re-validate it against a closed schema
that rejects unknown fields -
the `#Pet` [definition]({{< relref "docs/tour/basics/definitions" >}}):

{{{with code "en" "closedness"}}}
#location bottom-right bottom-left bottom-left bottom-left top

! exec cue vet schema.cue -d '#Pet' nemo.yml charlie.yaml fred.json
cmp stderr out
-- schema.cue --
#Pet: {
	id!:       int
	name!:     string
	location?: string
	species?:  string
	diet?:     string
}
-- nemo.yml --
id: 3
name: Nemo Clownfish
species: A. ocellaris
subfamily: Amphiprioninae
family: Pomacentridae
-- charlie.yaml --
id: 1
name: Charlie Cartwright
location: Ripon, North Yorkshire
species: cat
diet: kibble
-- fred.json --
{
    "id": 2,
    "name": "Fred",
    "location": "San Francisco",
    "species": "cat"
}
-- out --
family: field not allowed:
    ./nemo.yml:5:1
    ./schema.cue:1:7
subfamily: field not allowed:
    ./nemo.yml:4:1
    ./schema.cue:1:7
{{{end}}}

Nemo's `family` and `subfamily` fields aren't permitted because they're not
mentioned in the `#Pet` schema.


-->

## Next steps

Interested in learning more about CUE? Here's what you could try next:

- Test out CUE in your browser, with the [CUE playground](/play)
- Take a [tour through the CUE language]({{< relref "docs/tour" >}})
- Read about
  [the technologies that CUE directly integrates with]({{< relref "docs/integration" >}}), including FIXME
- FIXME links to recently landed docs
