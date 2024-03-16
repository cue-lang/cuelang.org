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

CUE makes it easy to validate the consistency and correctness of your data.
From **JSON files** to **YAML documents** and beyond, CUE's concise syntax and
powerful constraints FIXME

FIXME: client-side validation motivation from
https://cuelang.org/docs/concept/data-validation-use-case/#client-side-validation

In this guide, we'll explore some ways that CUE helps ensure data validity by
starting small, and building out from there.

**On this page**: FIXME
- Validating data files
- Prohibiting unknown fields
- Multiple data items in one file (FIXME:heading)
- References
- Document databases

## Validating data files

Validating data files with the `cue` command is simple: we define a schema,
and tell `cue` to test that one or more files *unify* successfully with the schema.
[Unification]({{< relref "docs/tour/basics/duplicate-fields" >}}) is CUE's most
fundamental operation. It's central to how the language works, and how it
allows data and constraints to work at both small and large scales, and is one
of the mechanisms that permit CUE to perform automated processes such as
removing boilerplate.

{{< info >}}
CUE says that two values are able to "unify" if they **don't conflict**.
This can be as trivial as the values literally being the same
(`42` doesn't conflict with `42`, but *does* conflict with `"foo"`)
but more commonly involves a **type**
(`42` doesn't conflict with `number`, but *does* conflict with `string`)
or a **constraint**
(`42` conflicts with `<=10` and unifies successfully with `>40.1`).
{{< /info >}}

Unification allows simplistic data files to be validated succinctly and easily,
by writing a schema that mirrors the data structure and then using the `cue`
command to check that the schema and data files unify successfully.
Schemas are most flexible when written using CUE's
[required field]({{< relref "docs/howto/mark-a-field-as-required" >}})
(`someField!: ...`) and
[optional field]({{< relref "docs/howto/mark-a-field-as-optional" >}})
(`someField?: ...`) markers.

Here's an example that uses the `cue vet` command to catch a missing required
field in a data file, with the `cue vet` command failing loudly:

<!-- TODO: roll this missing required field demo into a later, multi-data-file example
  after https://github.com/cue-lang/cue/issues/2520 is addressed. -->

{{< code-tabs >}}
{{< code-tab name="charlie.yaml" language="yaml" area="bottom-left" >}}
name: Charlie Cartwright
location: Ripon, North Yorkshire
species: cat
diet: kibble
{{< /code-tab >}}
{{< code-tab name="schema.cue" language="cue" area="bottom-right" >}}
name!:     string // name is required
id!:       int    // id is required
location?: string // location is optional
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top" type="terminal" codetocopy="Y3VlIHZldCBzY2hlbWEuY3VlIGNoYXJsaWUueWFtbA==" >}}
$ cue vet schema.cue charlie.yaml
id: field is required but not present:
    ./schema.cue:2:1
{{< /code-tab >}}
{{< /code-tabs >}}

Notice how the `species` and `diet` data fields *don't* get flagged up, despite
being present in the data but not in the schema? This is deliberate.
When we tell `cue vet` about CUE and data files alone, the command's behaviour
is to **allow us to specify only the data fields that we care about, without
having to *fully* describe the data's structure**.
If we *want* to exhaustively describe every field, disallowing unwanted fields,
then CUE also has us covered.

### Validating multiple data files

Mentioning multiple data files alongside some CUE changes the behaviour of `cue
vet` slightly, so that it
**validates each data file against the CUE *in isolation*.**

Each file can be encoded in a different format that `cue` understands, as shown
here where we catch a common problem with JSON ... numbers encoded as strings:

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue" area="bottom-right" >}}
name!:     string // name is required
id!:       int    // id is required
location?: string // location is optional
{{< /code-tab >}}
{{< code-tab name="fred.json" language="json" area="bottom-left" >}}
{
    "id": "1",
    "name": "Fred",
    "location": "San Francisco",
    "species": "cat"
}
{{< /code-tab >}}
{{< code-tab name="charlie.yaml" language="yaml" area="bottom-left" >}}
id: 2
name: Charlie Cartwright
location: Ripon, North Yorkshire
species: cat
diet: kibble
{{< /code-tab >}}
{{< code-tab name="nemo.yml" language="yml" area="bottom-left" >}}
id: 3
name: Nemo Clownfish
species: A. ocellaris
subfamily: Amphiprioninae
family: Pomacentridae
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top" type="terminal" codetocopy="Y3VlIHZldCBzY2hlbWEuY3VlIGZyZWQuanNvbiBjaGFybGllLnlhbWwgbmVtby55bWw=" >}}
$ cue vet schema.cue fred.json charlie.yaml nemo.yml
id: conflicting values "1" and int (mismatched types string and int):
    ./fred.json:2:11
    ./schema.cue:2:12
{{< /code-tab >}}
{{< /code-tabs >}}

Notice that location of the problem in `fred.json` is flagged:
line 2 needs some attention.
Additional fields are still permitted in these example data files,
but now let's see how CUE lets us *prevent* unwanted fields from being present.

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

### Multiple data items in one file (FIXME:heading)

FIXME: prose + example

## References / internal consistency

- bounds with references
- multiple structs (or lists) with membership constrained by each other's contents (or similar)

## Document databases

FIXME: adapt https://cuelang.org/docs/concept/data-validation-use-case/#validating-document-oriented-databases

FIXME: remainder of guide - what else needs covering?

## Next steps

Interested in learning more about CUE? Here's what you could try next:

- Test out CUE in your browser, with the [CUE playground](/play)
- Take a [tour through the CUE language]({{< relref "docs/tour" >}})
- Read about
  [the technologies that CUE directly integrates with]({{< relref "docs/integration" >}})
<!-- TODO: extend list when more docs have landed -->
