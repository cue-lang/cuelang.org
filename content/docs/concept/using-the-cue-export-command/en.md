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
package one

A: 1
B: 2.2
C: 3*A + B
-- out --
{
    "A": 1,
    "B": 2.2,
    "C": 5.2
}
{{{end}}}

You can override these defaults:
- the configuration to be evaluated can be specified using positional parameters
- the expression to be emitted can be specified with the `--expression`/`-e` flag
- the encoding can be specified with the `--out` flag
- a file that should receive the data can be specified with the `--outfile`/`-o` flag:

{{{with code "en" "export override defaults"}}}
#location left left right
exec cue export --expression data --out yaml .:three
cmp stdout out
-- p2.cue --
package two

data: {
	A: 1
	B: 2.2
	C: 3*A + B
}
-- p3.cue --
package three

data: {
	A: "some string"
	B: 42
	C: true
}
-- out --
A: some string
B: 42
C: true
{{{end}}}


The command fails with an error message:

- if evaluation of the configuration is unsuccessful
  - such as when concrete data values are unified with constraints that forbid
    those same values, or if the configuration to be evaluated can't be loaded
- if the value of the expression to be emitted isn't concrete
  - which is when the value *wouldn't* be able to be represented in a data-only
    format such as JSON. Examples of non-concrete values include types such as
    `string` and constraints such as `>=100`:

{{{with code "en" "export 2"}}}
#location left right
! exec cue export
cmp stderr out
-- data.cue --
package two

A: 1
B: float
C: >=A
-- out --
B: incomplete value float:
    ./data.cue:4:4
C: incomplete value >=1:
    ./data.cue:5:4
{{{end}}}

## More detail ...

FIXME
