---
title: Using the cue export command
toc_hide: true
tags: [cue command]
authors: [jpluscplusm]
---

The `cue export` command evaluates a configuration and emits a value if the
value is concrete -- in other words, as data. The command can emit data in a
variety of encodings, including JSON, YAML, and CUE.

## The Basics

By default, the `cue export` command:

- evaluates the configuration in the single package found in the current directory
- emits the value of the top-level of the configuration evaluated
- encodes the value as JSON and prints it to the command's standard output stream:

{{{with code "en" "export defaults"}}}
#location left right
exec cue export
cmp stdout out
-- data.cue --
package a

Aa: 1
Ba: 2.2
Ca: 3*Aa + Ba
-- out --
{
    "Aa": 1,
    "Ba": 2.2,
    "Ca": 5.2
}
{{{end}}}

You can override these defaults:
- the configuration to be evaluated can be specified using positional parameters
- the expression to be emitted can be specified with the `--expression`/`-e` flag
- the encoding can be specified with the `--out` flag
- a file that should receive the data can be specified with the `--outfile`/`-o` flag:

{{{with code "en" "export override defaults"}}}
#location left left right
exec cue export --expression data --out yaml .:c
cmp stdout out
-- package-b.cue --
package b

data: {
	Ab: 1
	Bb: 2.2
	Cb: 3*Ab + Bb
}
-- package-c.cue --
package c

data: {
	Ac: "some string"
	Bc: 42
	Cc: true
}
-- out --
Ac: some string
Bc: 42
Cc: true
{{{end}}}


The command fails with an error message:

- if evaluation of the configuration is unsuccessful
  - such as when concrete data values are unified with constraints that forbid
    those same values, or if the configuration to be evaluated can't be loaded
- if the value of the expression to be emitted isn't concrete
  - which is when the value *wouldn't* be able to be represented in a data-only
    format such as JSON. Examples of non-concrete values include types such as
    `string` and constraints such as `>=100`:

{{{with code "en" "export fail"}}}
#location left right
! exec cue export
cmp stderr out
-- failure.cue --
package d

Ad: 1
Bd: float
Cd: >=100
-- out --
Bd: incomplete value float:
    ./failure.cue:4:5
Cd: incomplete value >=100:
    ./failure.cue:5:5
{{{end}}}

## Emitting data to a file

file encodings.
--force.

## Emitting different encodings

CUE -p.
Overriding filename suffix implications.

## Positional arguments

Leave a TODO for "how cue finds CUE" or similar; don't write it all here.
Placing non-CUE somewhere other than the root.
Leave a TODO for linking to a future --with-context guide.

## Injecting values

Demo briefly; link to to other guides.

## Misc

--escape.
--list.
--merge.

## Related content
