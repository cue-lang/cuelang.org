---
title: How CUE enables data validation
tags:
authors:
- jpluscplusm
toc_hide: true
---

CUE makes it easy to validate the consistency and correctness of your data.
From **JSON files** to **YAML documents** and beyond, CUE's concise syntax and
powerful constraints FIXME

In this guide, we'll explore some ways that CUE helps ensure data validity by
starting small and building out from there.

**On this page**: FIXME

## Validating a data file

Validating data files with the `cue` CLI tool is simple: we define a schema,
and tell `cue` to test that one or more files unify successfully with the schema.
This *unification* approach means that, for simplistic data files, validating
them can be as uncomplicated as writing a schema file that mirrors the data
file structure.

Here we catch a missing field in a data file, with the `cue vet` command
failing loudly:

<!-- TODO: roll this missing required field demo into a later, multi-data-file example
  after https://github.com/cue-lang/cue/issues/2520 is addressed. -->

{{{with code "en" "required"}}}
#location bottom-left bottom-right top
! exec cue vet data.yaml schema.cue
cmp stderr out
-- data.yaml --
name: Charlie Cartwright
location: Ripon, North Yorkshire
species: cat
diet: kibble
-- schema.cue --
name!:     string // name is required
id!:       int    // id is required
location?: string // location is optional
-- out --
id: field is required but not present:
    ./schema.cue:2:1
{{{end}}}

Notice how the `species` and `diet` fields *don't* get flagged up, despite
being present in the data but not in the schema?  This is deliberate. `cue vet`'s
behaviour in the simplest case, where we only mention one or more data files
and a `.cue` file, is to allow us to specify *just the data elements that we
care about*, without having to fully describe the data's structure. CUE allows
for more rigor around extra, unwanted fields - as we'll see shortly.

## Validating multiple data files

Mentioning multiple data files and a CUE file tells `cue vet` to validate each
data file against the CUE *in isolation*.

Here, we catch a common problem with JSON - numbers encoded as strings:

{{{with code "en" "constraint violation"}}}
#location bottom-right bottom-left bottom-left bottom-left top

! exec cue vet data.yaml data.json data.yml schema.cue
cmp stderr out
-- schema.cue --
name!:     string // name is required
id!:       int    // id is required
location?: string // location is optional
-- data.yaml --
id: 1
name: Charlie Cartwright
location: Ripon, North Yorkshire
species: cat
diet: kibble
-- data.json --
{
    "id": "2",
    "name": "Fred",
    "location": "San Francisco",
    "species": "cat"
}
-- data.yml --
id: 3
name: Nemo Clownfish
family: Pomacentridae
subfamily: Amphiprioninae
-- out --
id: conflicting values "2" and int (mismatched types string and int):
    ./data.json:2:11
    ./schema.cue:2:12
{{{end}}}

Notice that the data file at fault (`data.json`) has the location of its
problem flagged up (line 2). As before, additional fields are permitted in the
data files - but we'll address that next.

## Prohibiting unknown fields

The common case optimised for by `cue vet` allows extra fields to be present in
data files. That's useful when starting out, but folks often need to be more
rigorous and prohibit unknown fields. CUE does this through the concept of
[closedness]({{< relref "docs/tour/types/closed" >}}).

Here, we've fixed the problem in the previous example's data, and re-validate
it against a **closed** schema that rejects unknown fields:

{{{with code "en" "closedness"}}}
#location bottom-right bottom-left bottom-left bottom-left top

! exec cue vet data.yaml data.json data.yml schema.cue -d '#Pet'
cmp stderr out
-- schema.cue --
#Pet: {
	id!:       int
	name!:     string
	location?: string
	species?:  string
	diet?:     string
}
-- data.yaml --
id: 1
name: Charlie Cartwright
location: Ripon, North Yorkshire
species: cat
diet: kibble
-- data.json --
{
    "id": 2,
    "name": "Fred",
    "location": "San Francisco",
    "species": "cat"
}
-- data.yml --
id: 3
name: Nemo Clownfish
family: Pomacentridae
subfamily: Amphiprioninae
-- out --
family: field not allowed:
    ./data.yml:3:1
    ./schema.cue:1:7
subfamily: field not allowed:
    ./data.yml:4:1
    ./schema.cue:1:7
{{{end}}}

FIXME: remainder of guide

## Next steps

Interested in learning more about CUE? Here's what you could try next:

- Test out CUE in your browser, with the [CUE playground](/play)
- Take a [tour through the CUE language]({{< relref "docs/tour" >}})
- Read about [the technologies that CUE directly integrates with]({{< relref
  "docs/integration" >}})
<!-- TODO: extend list when more docs have landed -->
