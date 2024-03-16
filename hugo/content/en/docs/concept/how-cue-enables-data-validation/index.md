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

As an example, here's a set of data files that we'd like to validate - two YAML
files and a JSON file:

<!-- TODO: move to multi-file upload when https://cuelang.org/issues/2991 is resolved -->
{{< columns >}}
```yml { title="alex.yml" }
name: Alex Atkinson
type: dog
height: 55
diet: kibble
```
{{< columns-separator >}}
```json { title="bryn.json" }
{
    "name": "Bryn Brown",
    "type": "goldfish",
    "height": "2"
}
```
{{< columns-separator >}}
```yaml { title="charlie.yaml" }
name: Charlie Cartwright
type: cat
diet: chicken
```
{{< /columns >}}

Writing a schema that validates these data files is easy. We simply mirror the
data structure in a CUE file, marking important fields as either *optional* or
*required*, with `?:` and `!:` respectively:

```cue { title="schema.cue" }
package example

name!:   string // All animals have a name.
type!:   string // Every animal must have a type.
height?: int    // We haven't measured each and every animal, yet.
```

The `cue vet` command validates our three data files against this schema.
Each file is validated independently:

<!-- TODO: roll this missing required field demo into a later, multi-data-file example
  after https://github.com/cue-lang/cue/issues/2520 is addressed. -->

```text { title="TERMINAL" codeToCopy="Y3VlIHZldCAuIGFsZXgueW1sIGJyeW4uanNvbiBjaGFybGllLnlhbWw=" }
$ cue vet . alex.yml bryn.json charlie.yaml
height: conflicting values "2" and int (mismatched types string and int):
    ./bryn.json:4:15
    ./schema.cue:5:10
```

`cue vet` caught a common JSON error in our data: a number incorrectly encoded as a string.
The error message tells us that the problem is on line 4 of the `bryn.json` file,
in the `height` field.
Let's correct that data, and then repeat the command:

{{<columns>}}
```json { title="bryn.json" }
{
    "name": "Bryn Brown",
    "type": "goldfish",
    "height": 2
}
```
{{<columns-separator>}}
```text { title="TERMINAL" codeToCopy="Y3VlIHZldCAuIGFsZXgueW1sIGJyeW4uanNvbiBjaGFybGllLnlhbWw=" }
$ cue vet . alex.yml bryn.json charlie.yaml
```
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
schema.

The schema contained *type constraints* that made sure fields
were of type `string` and `int`.
CUE's types also include `float`, `number` (the superset of `int` and `float`),
`bytes`, `null` and `bool`, but its constraints enable much more sophisticated
data validation than simple type checking.

Let's see some examples of more nuanced validation, using the same three data
files that we worked with above:

{{< columns >}}
```yml { title="alex.yml" }
name: Alex Atkinson
type: dog
height: 55
diet: kibble
```
{{< columns-separator >}}
```json { title="bryn.json" }
{
    "name": "Bryn Brown",
    "type": "goldfish",
    "height": 2
}
```
{{< columns-separator >}}
```yaml { title="charlie.yaml" }
name: Charlie Cartwright
type: cat
diet: chicken
```
{{< /columns >}}

The `schema.cue` file is present from above, but now let's add `policy.cue` as well:

{{<columns>}}
```cue { title="schema.cue" }
package example

name!:   string
type!:   string
height?: int
```
{{<columns-separator>}}
```cue { title="policy.cue" }
package example

type?:   "dog" | "cat"
height?: >10
```
{{</columns>}}

This policy file contains additional constraints for some data fields, which
CUE combines with the type constraints in `schema.cue` through a process called
**unification**. Let's see it in action:

```text { title="TERMINAL" codeToCopy="Y3VlIHZldCAuIGFsZXgueW1sIGJyeW4uanNvbiBjaGFybGllLnlhbWw=" }
$ cue vet . alex.yml bryn.json charlie.yaml
type: 2 errors in empty disjunction:
type: conflicting values "cat" and "goldfish":
    ./bryn.json:3:13
    ./policy.cue:3:18
type: conflicting values "dog" and "goldfish":
    ./bryn.json:3:13
    ./policy.cue:3:10
height: invalid value 2 (out of bound >10):
    ./policy.cue:4:10
    ./bryn.json:4:15
```

It turns out that our new policy constraints are too restrictive, as they don't
permit goldfish, or short animals. Let's loosen our initial policy, and `cue
vet` again:

{{<columns>}}
```cue { title="policy.cue" }
package example

type?:   "dog" | "cat" | "goldfish"
height?: >0
```
{{<columns-separator>}}
```text { title="TERMINAL" codeToCopy="Y3VlIHZldCAuIGFsZXgueW1sIGJyeW4uanNvbiBjaGFybGllLnlhbWw=" }
$ cue vet . alex.yml bryn.json charlie.yaml
```
{{</columns>}}

As this example shows, CUE unifies all the constraints that apply to a field.

In our example, unification allowed us to separate "schema" from "policy", but
these terms don't implicitly mean anything to CUE.  Unification permits the
separation of validation concerns into *any number* of facets, guided only by
the structure that makes sense for a specific scenario.

For example, perhaps one team controls the specification of the field names
that are permitted, whilst another team controls their types, and a third team
imposes more fine grained controls over the fields' values. Unification allows
each team to control its own constraints, with CUE taking responsibility for
combining them and checking that data validates against every facet
simultaneously.

### Constraints

CUE empowers validation by making a rich set of constraint primitives
available, out of the box.

You've already seen
[disjunctions]({{< relref "docs/tour/types/disjunctions" >}})
in action, constraining the `type` field, above.
Disjunctions are referred to as "alternation" in some other languages.

You've also seen
[bounds]({{< relref "docs/tour/types/bounds" >}})
being used to constrain the `height` field.
Bounds work with `int`- and `float`-typed values,
with all the comparison operators you'd expect such as `<`, `>=`, and `!=`.
CUE also allows these comparison operators to constrain `string` and `bytes` values,
lexically, byte-by-byte.

Data validation often relies on regular expressions to match and constrain
string values, and CUE supports this fully. However, as you'll see in this next
example CUE, the
[standard library]({{< relref "docs/tour/packages/standard-library" >}})
provides many built-in functions to validate data - including some that simplify
certain kinds of string constraints.
```cue
package constraints

import "strings"

#Polymer: {
	name!:               strings.Prefix("Poly") | "Nylon"
	name!:               strings.Suffix("ate") | strings.Suffix("ene") | "Nylon"
	crystallinityMin!:   number
	crystallinityMax!:   number
	crystallinityRange!: number
	crystallinityRange!: crystallinityMax - crystallinityMin
}

polymers: [...#Polymer] & [{
	name:               "Polyoxymethylene"
	crystallinityMin:   70
	crystallinityMax:   80
	crystallinityRange: 10
}, {
	name:               "Polyethylene terephthalate"
	crystallinityMin:   30
	crystallinityMax:   40
	crystallinityRange: 10
}, {
	name:               "Polybutylene terephthalate"
	crystallinityMin:   40
	crystallinityMax:   50
	crystallinityRange: 10
}, {
	name:               "Polytetrafluoroethylene"
	crystallinityMin:   60
	crystallinityMax:   80
	crystallinityRange: 20
}, {
	name:               "Nylon"
	crystallinityMin:   35
	crystallinityMax:   45
	crystallinityRange: 10
}]
```



The [language tour]({{< relref "docs/tour" >}}) demonstrates the full range of
CUE's constraints, but of particular note in the example above are
[definitions](FIXME),
which ensure that only named fields are present in the underlying data,
[regular expressions](FIXME)
being used to constrain string data,
and functions from the built-in
[`strings` package](https://pkg.go.dev/cuelang.org/go/pkg/strings#section-documentation),
which are often easier to understand than regular expressions.

{{<info>}}
### Unification

CUE says that two values are able to "unify" if they **don't conflict**.\
This can be as trivial as the two values literally being identical:
- the value `42` doesn't conflict with `42`, but it does conflict with `"foo"`.

It can also involve a type:
- the value `42` doesn't conflict with `number`, but it does conflict with `string`.

As we'll see shortly, unification also applies to **constraints**: 
- the value `42` conflicts with `<= 10` and unifies successfully with `> 40.1`.
{{</info>}}

<!-- FIXME: example building on previous section:

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

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue" area="bottom-right" >}}
#Pet: {
	id!:       int
	name!:     string
	location?: string
	species?:  string
	diet?:     string
}
{{< /code-tab >}}
{{< code-tab name="nemo.yml" language="yml" area="bottom-left" >}}
id: 3
name: Nemo Clownfish
species: A. ocellaris
subfamily: Amphiprioninae
family: Pomacentridae
{{< /code-tab >}}
{{< code-tab name="charlie.yaml" language="yaml" area="bottom-left" >}}
id: 1
name: Charlie Cartwright
location: Ripon, North Yorkshire
species: cat
diet: kibble
{{< /code-tab >}}
{{< code-tab name="fred.json" language="json" area="bottom-left" >}}
{
    "id": 2,
    "name": "Fred",
    "location": "San Francisco",
    "species": "cat"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top" type="terminal" codetocopy="Y3VlIHZldCBzY2hlbWEuY3VlIC1kICcjUGV0JyBuZW1vLnltbCBjaGFybGllLnlhbWwgZnJlZC5qc29u" >}}
$ cue vet schema.cue -d '#Pet' nemo.yml charlie.yaml fred.json
family: field not allowed:
    ./nemo.yml:5:1
    ./schema.cue:1:7
subfamily: field not allowed:
    ./nemo.yml:4:1
    ./schema.cue:1:7
{{< /code-tab >}}
{{< /code-tabs >}}

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
