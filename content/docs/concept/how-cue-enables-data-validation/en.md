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

CUE is designed to make data validation **simple**, **powerful**, and **flexible**.

To achieve this, the project publishes the `cue`
[command line tool]({{< relref "docs/introduction/installation/#install-cue-from-official-release-binaries" >}}),
which allows a wide range of data validation tasks to be completed without
writing any code.
For more complex validation scenarios, CUE's
[powerful Go APIs]({{< relref "how-cue-works-with-go/#using-cues-go-api" >}})
deliver fine grained control.

This guide demonstrates some of the data validation capabilities of the `cue` command.

## CUE makes data validation *simple*

Validating data files with the `cue` command is easy. All we do is:

- define some constraints, and
- tell the `cue` command to check that each data file **unifies** successfully
  with the constraints.

[Unification]({{< relref "docs/tour/basics/unification" >}}) is CUE's core
operation - it's central to how the language and its tooling works.
It allows data and constraints to work at all scales, and is one of the
mechanisms that enables CUE to perform automated processes such as removing
boilerplate. You'll read more about unification later. <!-- TODO: link to boilerplate doc when it lands -->

As an example of CUE's simplicity, here's a set of data files that we'd like to
validate - two JSON files and some YAML:

<!-- TODO: move to multi-file upload when https://cuelang.org/issues/2991 is resolved -->
{{< columns >}}
{{{with upload "en" "data: alex"}}}
-- alex.json --
{
    "name": "Alex Atkinson",
    "type": "dog",
    "height": 55,
    "diet": "kibble"
}
{{{end}}}
{{< columns-separator >}}
{{{with upload "en" "data: bryn (broken)"}}}
-- bryn.json --
{
    "name": "Bryn Brown",
    "type": "goldfish",
    "height": "2",
    "diet": "flakes"
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

Writing a schema that validates these data files isn't difficult.
We just mirror the data structure in a CUE file,
marking important fields as either *optional* or *required* with `?:` and `!:` respectively,
and add some type information:

{{{with upload "en" "schema: CUE"}}}
-- schema.cue --
package validation

name!:   string // All animals have a name.
type!:   string // Every animal must have a type.
height?: int    // Optional, as we haven't managed to measure *every* animal just yet.
{{{end}}}

The `cue vet` command validates our three data files against this schema.
Each file is validated independently:

{{{with script "en" "cue vet #1"}}}
! cue vet . alex.json bryn.json charlie.yaml
{{{end}}}

`cue vet` caught a common JSON error in our data: a number incorrectly encoded as a string.
The error message tells us that the problem is on line 4 of the `bryn.json` file,
in the `height` field.
Let's correct that data:

{{{with upload "en" "data: bryn (fixed)"}}}
#force
-- bryn.json --
{
    "name": "Bryn Brown",
    "type": "goldfish",
    "height": 2,
    "diet": "flakes"
}
{{{end}}}

We can then repeat the `cue vet` command:

{{{with script "en" "cue vet #2"}}}
cue vet . alex.json bryn.json charlie.yaml
{{{end}}}

The command is silent, which tells us that our data validated successfully ...
but did you notice that the `diet` fields don't get flagged up, despite being
present in the data files but *not* in the schema?
This is because the constraints we declared in `schema.cue` were placed at the
top level of the `validation` package, and the top level of each CUE package
is left [open]({{< relref "docs/tour/types/closed" >}}).

The *effect* of this is that when we invoke `cue vet` by only telling it about
some CUE and some data files, its behaviour is to allow us to specify **only**
the important data fields that we care about, without having to fully describe
the data's structure.
This lets us get started quickly, performing partial validation of the most
critical data \- without having to spend time exhaustively documenting each and
every field.
As we'll see shortly, this behaviour can be changed by placing our constraints inside
[closed structs]({{< relref "docs/tour/types/closed" >}}).

## CUE makes data validation *powerful*

In the previous section we validated three simple data files against a trivial schema.

The schema contained *type constraints* that made sure certain fields
were of type `string` and `int`.
CUE's types also include `float`, `number` (the superset of `int` and `float`),
`bytes`, `null` and `bool`, but its constraints enable much more sophisticated
data validation than simple type checking.

Let's see some examples of different data validations that CUE makes possible,
using the same three data files that we worked with above:

{{< columns >}}
{{{with upload "en" "data: alex (reminder)"}}}
#force
-- alex.json --
{
    "name": "Alex Atkinson",
    "type": "dog",
    "height": 55,
    "diet": "kibble"
}
{{{end}}}
{{< columns-separator >}}
{{{with upload "en" "data: bryn (reminder)"}}}
#force
-- bryn.json --
{
    "name": "Bryn Brown",
    "type": "goldfish",
    "height": 2,
    "diet": "flakes"
}
{{{end}}}
{{< columns-separator >}}
{{{with upload "en" "data: charlie (reminder)"}}}
#force
-- charlie.yaml --
name: Charlie Cartwright
type: cat
diet: chicken
{{{end}}}
{{< /columns >}}

The `schema.cue` file is in place, as before. Let's create `policy.cue` as well:

{{<columns>}}
{{{with upload "en" "schema: CUE (reminder)"}}}
#force
-- schema.cue --
package validation

name!:   string
type!:   string
height?: int
{{{end}}}
{{<columns-separator>}}
{{{with upload "en" "policy: CUE (too restrictive)"}}}
-- policy.cue --
package validation

type?:   "dog" | "cat"
height?: >10
{{{end}}}
{{</columns>}}

The `policy.cue` file contains additional constraints for some data fields,
which CUE combines with the type constraints in `schema.cue` through a process
called **unification**. Let's see it in action:

{{{with script "en" "cue vet: policy (failure)"}}}
! cue vet . alex.json bryn.json charlie.yaml
{{{end}}}

It turns out that our new policy constraints are too restrictive, as they don't
permit goldfish, or short animals. Let's correct this by loosening our policies:

{{{with upload "en" "policy: CUE (correct)"}}}
#force
-- policy.cue --
package validation

type?:   "dog" | "cat" | "goldfish"
height?: >=1
{{{end}}}

We can then run `cue vet` again:

{{{with script "en" "cue vet: policy (success)"}}}
cue vet . alex.json bryn.json charlie.yaml
{{{end}}}

CUE unifies all the constraints that apply to a field, and checks that they're
all satisfied simultaneously.

In our example, unification allowed us to separate "schema" from "policy", but
these terms don't implicitly mean anything to CUE. Unification permits the
separation of validation concerns into *any number of aspects*, guided by
the structure that makes sense for your specific scenario.

For example: perhaps one team controls the specification of the field *names*
that are permitted, whilst another team controls their *types*, and a third
team imposes more fine grained controls over the fields' *values*. Unification
allows each team to control their own constraints independently, with CUE
taking responsibility for combining them.

CUE does the hard work of unifying all the aspects,
so that it can check that your data validates against *every* aspect.

### More Constraints

CUE enables powerful data validation by making a rich set of constraints
available out of the box.

You've already seen
[disjunctions]({{< relref "docs/tour/types/disjunctions" >}})
in action, constraining the `type` field, above.
Disjunctions are known as "sum types" in some other languages,
or "alternation" in regular expressions.

You've also seen
[bounds]({{< relref "docs/tour/types/bounds" >}})
being used to constrain the `height` field numerically.
Bounds work with `int` and `float` typed values,
using any of the comparison operators that you'd expect, such as `<`, `>=`, and `!=`.
CUE uses the same operators to constrain `string` and `bytes` values,
lexically, byte-by-byte.

Data validation often relies on regular expressions to match and constrain
string values, and CUE supports them through the `=~` and `!~` operators.
As you'll see in the following CUE, the language's
[standard library]({{< relref "docs/tour/packages/standard-library" >}})
also provides many built-in validator functions.
Here we use a pair of functions that can validate string data in a more
straightforward and clear way than regular expressions.

{{{with code "en" "constraints"}}}
! exec cue vet . data.yml
cmp stderr out
-- example.cue --
package validation

import "strings"

data: {
	// Each member's value must have this prefix.
	[_]: strings.HasPrefix("Super")
	// Each member's value must have this suffix.
	[_]: strings.HasSuffix("e")
	// Each value must start with an uppercase
	// ASCII letter and end with lowercase ASCII.
	[_]: =~"^[A-Z].*[a-z]$"
	// Each value must not contain the letter "v".
	[_]: !~"v"
}
-- data.yml --
data:
  a: Superlative
  b: supersede
  c: Superman
-- out --
data.b: invalid value "supersede" (does not satisfy strings.HasPrefix("Super")):
    ./example.cue:7:7
    ./data.yml:3:6
    ./example.cue:7:25
    ./example.cue:9:7
    ./example.cue:12:7
    ./example.cue:14:7
data.c: invalid value "Superman" (does not satisfy strings.HasSuffix("e")):
    ./example.cue:9:7
    ./data.yml:4:6
    ./example.cue:7:7
    ./example.cue:9:25
    ./example.cue:12:7
    ./example.cue:14:7
data.b: invalid value "supersede" (out of bound =~"^[A-Z].*[a-z]$"):
    ./example.cue:12:7
    ./data.yml:3:6
    ./example.cue:7:7
    ./example.cue:9:7
    ./example.cue:14:7
data.a: invalid value "Superlative" (out of bound !~"v"):
    ./example.cue:14:7
    ./data.yml:2:6
    ./example.cue:7:7
    ./example.cue:9:7
    ./example.cue:12:7
{{{end}}}

CUE also provides a way to ensure that only known fields are present in data by using
[definitions]({{< relref "docs/tour/basics/definitions" >}})
to create
[closed structs]({{< relref "docs/tour/types/closed" >}}).
Here's an example of a definition being used to flag up an extra field that
shouldn't be present in our data:

{{{with code "en" "definition"}}}
! exec cue vet . data.yml -d '#People'
cmp stderr out
-- schema.cue --
package validation

// #People is a list of zero or more #Person-s
#People: [...#Person]
#Person: {
	name!:    string
	address?: string
}
-- data.yml --
- name: Alex Atkinson
- name: Bryn Brown
  address: 123 Main Street, Springfield
- name: Charlie Cartwright
  age: 80
-- out --
2.age: field not allowed:
    ./data.yml:1:1
    ./data.yml:5:3
    ./schema.cue:4:11
    ./schema.cue:4:14
    ./schema.cue:5:10
{{{end}}}

The [language tour]({{< relref "docs/tour" >}}) demonstrates the full range of
CUE's constraints.

## CUE makes data validation *flexible*

{{{with _script_ "en" "HIDDEN: reset fs at start of section:flexible"}}}
rm -f *.cue *.yml *.yaml *.json
{{{end}}}

CUE delivers flexibility, letting you adopt its succinct and powerful language
at whatever pace is appropriate by enabling you to use your *existing* data and
schemas formats alongside CUE. It does this through its first class support for
various alternative schema and data formats - which can be combined, imported,
and exported.

The [Integrations]({{< relref "docs/integration" >}}) page contains links to the
different formats that CUE supports, but here's an example that demonstrates
CUE's flexibility through multiple formats being used *simultaneously:*

Let's start with a trivial
[Protobuf]({{< relref "docs/concept/how-cue-works-with-protocol-buffers" >}})
schema that defines `ExampleType`:

{{{with upload "en" "schema.proto"}}}
-- schema.proto --
message ExampleType {
  string aString = 1;
  int32  anInt   = 2;
  float  aFloat  = 3;
  bool   aBool   = 4;
}
{{{end}}}

Let's include a JSON Schema file that adds some constraints to a couple of
`ExampleType`'s fields:

{{{with upload "en" "schema.json"}}}
-- schema.json --
{
    "$schema": "http://json-schema.org/draft-07/schema",
    "definitions": {
        "ExampleType": {
            "type": "object",
            "properties": {
                "aString": {
                    "type": "string",
                    "pattern": "^Multiplication"
                },
                "anInt": {
                    "type": "number",
                    "minimum": 5,
                    "maximum": 100,
                    "exclusiveMaximum": true
                }
            }
        }
    }
}
{{{end}}}

And let's add some CUE policy that constrains `ExampleType`'s fields in ways
that the other formats can't express:

{{{with upload "en" "policy.cue"}}}
-- policy.cue --
import "strings"

#ExampleType: {
	// aString is a required field, and its value must contain
	// the interpolated string result of squaring anInt.
	aString!: strings.Contains("\(anInt*anInt)")

	// anInt must be strictly greater than aFloat.
	anInt?: >aFloat

	// The final two fields are left unconstrained.
	aFloat?: _
	aBool?:  _
}
{{{end}}}

We'll carefully construct some data such that it violates constraints from each
of these schema and policy files:

{{{with upload "en" "data.yml (broken)"}}}
-- data.yml --
aString: "Doesn't start with 'Multiplication', and doesn't contain the square of anInt"
anInt: 5
aFloat: 99.0
aBool: "this is not a boolean value"
{{{end}}}

The `cue vet` command unifies all the constraints, showing us the full extent
of our data validation problem:

{{{with script "en" "multi-format cue vet (failure)"}}}
! cue vet policy.cue schema.proto schema.json data.yml -d '#ExampleType'
{{{end}}}

However, if we update and fix the data, then the same `cue vet` command is
silent - indicating that the data validated succesfully against the unified set
of constraints:

{{{with upload "en" "data.yml (fixed)"}}}
#force
-- data.yml --
aString: Multiplication - 5 x 5 == 25
anInt: 5
aFloat: 4.0
aBool: false
{{{end}}}

{{{with script "en" "multi-format cue vet (success)"}}}
cue vet policy.cue schema.proto schema.json data.yml -d '#ExampleType'
{{{end}}}

The range of formats and encodings that CUE supports is outlined in <!-- TODO: link to a less CLI-y doc -->
[`cue help filetypes`]({{< relref "docs/reference/command/cue-help-filetypes" >}}).
The `cue` command can also process its standard input stream in any of the
formats it understands, as described in
[`cue help inputs`]({{< relref "docs/reference/command/cue-help-inputs" >}}).

## Future plans

You've seen how CUE enables
[simple data validation](#cue-makes-data-validation-simple),
letting you start small by checking the most important data using a succinct
and easy-to-grasp format that intuitively mirrors your underlying data.

You watched CUE's
[powerful data validation](#cue-makes-data-validation-powerful)
being used to combine the requirements imposed by multiple teams expressed
through its rich set of primitive constraints and its standard library.

You saw how the range of formats that CUE supports can deliver
[flexible data validation](#cue-makes-data-validation-flexible) that combines
existing data, schema, and policy assets with newer, more powerful CUE
constraints.

This is all possible, today, using CUE, but one of the project's goals is to
act as an *interlingua*: a bidirectional bridge between all the formats that
CUE speaks, linking constraints with data sources of truth - no matter where
they exist. This will allow constraints from any source to be translated into
formats suitable for systems that don't yet understand CUE (such as document
databases that only understand JSON Schema) so that they can passively
benefit from the language's advanced capabilities.

## Next steps

Interested in learning more about CUE? Here's what you could try next:

- Test out CUE in your browser in the [CUE playground](/play)
- Take a tour through the CUE language with the
  [language tour]({{< relref "docs/tour" >}})
- Read about
  [the technologies that CUE directly integrates with]({{< relref "docs/integration" >}}),
  such as:
  - {{< linkto/related/concept "how-cue-works-with-json" >}}
  - {{< linkto/related/concept "how-cue-works-with-yaml" >}}
  - {{< linkto/related/concept "how-cue-works-with-json-schema" >}}
  - {{< linkto/related/concept "how-cue-works-with-protocol-buffers" >}}
  - {{< linkto/related/concept "how-cue-works-with-openapi" >}}
- {{< linkto/related/reference "command/cue-help-filetypes" >}}
  -- how to control which formats the `cue` command processes
- {{< linkto/related/reference "command/cue-help-inputs" >}}
  -- how the `cue` command assembles its inputs, including its standard input stream
