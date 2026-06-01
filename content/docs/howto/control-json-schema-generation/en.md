---
title: Controlling JSON Schema generation output
tags: [encodings, cue command]
authors: [rogpeppe]
toc_hide: true
---

When generating [JSON Schema](https://json-schema.org/) from CUE, there are
several ways to control the output. This guide shows how different CUE
constructs affect the generated schema, and how to select which definitions to
export.

<!--more-->

## Selecting a definition with `-e`

{{{with step}}}
The `-e` flag selects which definition to convert. Create a CUE file with
multiple definitions:

{{{with upload "en" "defs.cue"}}}
-- defs.cue --
#Address: {
	street: string
	city:   string
	zip:    string
}

#Person: {
	name:    string
	address: #Address
}
{{{end}}}
{{{end}}}

{{{with step}}}
Generate JSON Schema for just the `#Person` definition:

{{{with script "en" "select def"}}}
cue def --out jsonschema -e '#Person' defs.cue
{{{end}}}

When one definition references another, the referenced definition appears in
the `$defs` section of the generated schema.
{{{end}}}

## Open and closed structs

CUE definitions are closed by default, meaning they reject fields not
mentioned in the definition. Adding `...` to a definition makes it open,
allowing additional fields. This maps directly to `additionalProperties` in
JSON Schema.

{{{with step}}}
Create a file with both closed and open definitions:

{{{with upload "en" "open.cue"}}}
-- open.cue --
#Closed: {
	name: string
}

#Open: {
	name: string
	...
}
{{{end}}}
{{{end}}}

{{{with step}}}
Generate JSON Schema for the closed definition:

{{{with script "en" "closed"}}}
cue def --out jsonschema -e '#Closed' open.cue
{{{end}}}

The closed definition produces `"additionalProperties": false`.
{{{end}}}

{{{with step}}}
Compare with the open definition:

{{{with script "en" "open"}}}
cue def --out jsonschema -e '#Open' open.cue
{{{end}}}

The open definition produces `"additionalProperties": true`, allowing the
schema to accept fields beyond those explicitly listed.
{{{end}}}

## Writing output to a file

{{{with step}}}
Use the `-o` flag to write the generated schema directly to a file:

{{{with script "en" "outfile"}}}
cue def --out jsonschema -e '#Closed' -o closed.schema.json open.cue
cat closed.schema.json
{{{end}}}
{{{end}}}

## Related content

- {{< linkto/related/concept "how-cue-works-with-json-schema" >}}
- {{< linkto/related/tutorial "converting-cue-to-json-schema" >}}
- {{< linkto/related/howto "generate-json-schema-from-cue" >}}
- {{< linkto/related/reference "command/cue-help-def" >}}
- {{< linkto/related/reference "command/cue-help-filetypes" >}}
