---
title: Validating CUE
weight: 10
tags: [cue command]
authors: [jpluscplusm]
toc_hide: false
---

The `cue vet` command accepts an arbitrary number of input parameters and
checks that they're all consistent -- it *validates* the inputs.

If any of the inputs is read as non-CUE data (such as JSON, YAML, or TOML) then
the command operates in "data" mode, which is described on the next page of
this guide. By default, it operates in "CUE" mode, as described on this page.

## CUE inputs

If `cue vet` is called without any input arguments then its default input is
the single CUE package in the current directory:

{{{with code "en" "0 args pass"}}}
exec cue vet
cmp stderr out
-- file.cue --
package example

A: 99 & int
-- out --
{{{end}}}

The command succeeds silently if the input validates successfully.
Otherwise, the command fails and displays an error message for each validation failure:

{{{with code "en" "0 args fail"}}}
#location top bottom
! exec cue vet
cmp stderr out
-- file.cue --
package example

A: 99 & >100
B: 99 & string
-- out --
B: conflicting values 99 and string (mismatched types int and string):
    ./file.cue:4:4
    ./file.cue:4:9
A: invalid value 99 (out of bound >100):
    ./file.cue:3:9
    ./file.cue:3:4
{{{end}}}

Another way to refer to the single package in the current directory is with the
shorthand of "`.`". If there's more than one package in the current directory
but you haven't explicitly told `cue vet` what it should validate then the
command fails:

{{{with code "en" "0 args fail >1 packages"}}}
#location top-left top-right bottom
! exec cue vet .
cmp stderr out
-- a.cue --
package A

X: 1
-- b.cue --
package B

X: 1
-- out --
found packages "A" (a.cue) and "B" (b.cue) in "."
{{{end}}}

Read on for information about how to specify which CUE packages and files `cue
vet` should validate.

### CUE package inputs

The `cue vet` command can validate any number of CUE packages, which are
identified by their *import path*.
Both *relative* and *absolute* import paths can be specified -- see
`{{<linkto/inline "reference/command/cue-help-inputs">}}` for more information
about their differences.
In this guide we'll use relative import paths in our examples:
paths that start with "`.`" or "`..`".

To validate a specific package in the current directory, even when there's more
than one package present, use the `:<package-name>` syntax to specify the
package:

{{{with code "en" "1 arg pass"}}}
#location top-left top-right bottom
exec cue vet .:B # package A isn't checked, so this succeeds
cmp stderr out
-- a.cue --
package A

X: false & true // This is invalid.
-- b.cue --
package B

X: 42
-- out --
{{{end}}}

To validate more than one package, specify their import paths as input parameters:

{{{with code "en" "2 args fail"}}}
#location top-left top-right bottom
! exec cue vet .:B .:A
cmp stderr out
-- a.cue --
package A

X: false & true // This is invalid.
-- b.cue --
package B

X: 42
-- out --
X: conflicting values true and false:
    ./a.cue:3:4
    ./a.cue:3:12
{{{end}}}

Multiple package inputs aren't unified, so they are validated *independently*.
Notice that field `X` inside `b.cue`, above, plays no part in the validation
failure error message for field `X` inside package `A`.
This is because it's isolated inside package `B` -- which is valid.

If you specify more than one package input for `cue vet` then you can't *also*
include any other input types. If the list of inputs includes two or more
packages along with a non-package input then an error occurs -- even if the
non-package input is a CUE file that belongs to the *same* package as one of
the package inputs:

{{{with code "en" "3 args fail pkg + pkg + file"}}}
#location top-left top-right bottom
! exec cue vet .:B .:A b.cue
cmp stderr out
-- a.cue --
package A

X: false & true
-- b.cue --
package B

X: 42
-- out --
too many packages defined (2) in combination with files
{{{end}}}

### CUE file inputs

By telling `cue vet` about one or more CUE files you can check that they all
unify successfully:

{{{with code "en" "fail file + file"}}}
#location top-left top-right bottom
! exec cue vet a1.cue a2.cue
cmp stderr out
-- a1.cue --
package A

X: int
O: int & >100
-- a2.cue --
package A

X: 42
O: 42
-- out --
O: invalid value 42 (out of bound >100):
    ./a1.cue:4:10
    ./a2.cue:4:4
{{{end}}}

When you provide more than one CUE file as inputs to `cue vet`, each CUE file
you mention must either:

- belong to the same package as all the other CUE files that have a `package` clause, or
- not have a `package` clause.

Either way, all the CUE files you mention must be able to unify successfully:

{{{with code "en" "fail package-file x2 + file"}}}
#location top-left top-left top-right bottom
! exec cue vet a1.cue a2.cue x.cue
cmp stderr out
-- a1.cue --
package A

X: int
O: int
-- a2.cue --
package A

X: >100
O: <100
-- x.cue --
X: 42
O: 42
-- out --
X: invalid value 42 (out of bound >100):
    ./a2.cue:3:4
    ./x.cue:1:4
{{{end}}}

You can also check that an arbitrary number of CUE files unify successfully
with a single CUE package.
Make sure to specify the package as the first input:

{{{with code "en" "fail package + package-file + file"}}}
#location top-left top-right top-right bottom
! exec cue vet .:A b.cue x.cue
cmp stderr out
-- a.cue --
package A

X: int
O: float
-- b.cue --
package B

X: 4.2
-- x.cue --
O: 42
-- out --
O: conflicting values 42 and float (mismatched types int and float):
    ./a.cue:4:4
    ./x.cue:1:4
X: conflicting values 4.2 and int (mismatched types float and int):
    ./a.cue:3:4
    ./b.cue:3:4
{{{end}}}

As [before](FIXME), all the individually-mentioned CUE files are unified with
each other, so they must either have the same `package` clause or no `package`
clause at all. Their `package` clause does *not* have to match the name of the
package against which they're being checked.

The standard input stream of the `cue vet` command can be included as an input
and unified with the other inputs via its special symbol "`-`", as outlined in
`{{< linkto/inline "reference/command/cue-help-inputs" >}}`.
It's treated as if it were any other CUE file mentioned as an input -- so it
also needs to have a `package` clause that matches the other CUE files, or no
`package` clause at all.

## Non-CUE schema inputs

CUE can transparently combine native CUE with constraints in non-CUE schema
encodings such as JSON Schema, Protocol Buffers, and OpenAPI.
This means that the constraints from non-CUE schemas can be included in the set
of constraints and data being validated by `cue vet`, simply by mentioning a
non-CUE file that encodes a schema.

This validation builds on the behaviours and rules laid out above. CUE packages
(if any) must be mentioned as the first input parameter; all individually
mentioned CUE files must either belong to the same package as each other, or no
package at all.

{{{with code "en" "non-cue schema: failure 1"}}}
! exec cue vet .:A schema.json
cmp stderr out
-- schema.json --
{
    "$schema": "https://json-schema.org/draft/2020-12/schema",
    "type": "object",
    "properties": {
        "x": {
            "type": "number",
            "minimum": 100
        }
    }
}
-- a.cue --
package A

x: 42
-- out --
x: invalid value 42 (out of bound >=100):
    ./schema.json:7:13
    ./a.cue:3:4
{{{end}}}

The `--path`/`-l` flag allows you to add non-CUE constraints to specific, named
CUE constraints that already exist. Here, we add a JSON Schema constraint to
the `#Person` definition specified in the package `A`, and use it to validate
some data instances in the individually-named CUE file `b.cue`:

{{{with code "en" "non-cue schema: failure 2"}}}
#location top-left top-left top-right bottom
! exec cue vet .:A schema.json b.cue -l '#Person:'
cmp stderr out
-- schema.json --
{
    "$schema": "https://json-schema.org/draft/2020-12/schema",
    "type": "object",
    "properties": {
        "age": {
            "type": "number",
            "maximum": 150
        }
    }
}
-- a.cue --
package A

#Person: {
	name!: string
	age!:  number
}
-- b.cue --
package B

#Person: _
people: [...#Person] & [
	{name: "Charlie", age: 80},
	{name: "Lola", age: 200},
]
-- out --
people.1.age: invalid value 200 (out of bound <=150):
    ./schema.json:7:13
    ./b.cue:6:22
{{{end}}}

## Validation output

The `cue vet` command is silent when all its inputs validate successfully.

When validation of any input fails, `cue vet` displays error messages
identifying the cause of the validation failures.

The command checks its inputs for consistency and
[completeness]({{< relref "docs/concept/working-with-incomplete-cue" >}}).
By default, it only displays specific errors highlighting inconsistent values
in inputs, such as `X: false & true`.
It displays a general, non-specific error if any
[regular fields]({{< relref "docs/tour/types/structs" >}}) are *incomplete* --
that is, if there are any non-concrete values present that would *not* be able
to be encoded in a data-only format such as JSON:

{{{with code "en" "concrete fail without -c"}}}
#location top bottom
! exec cue vet
cmp stderr out
-- file.cue --
package example

A: int & >100
-- out --
some instances are incomplete; use the -c flag to show errors or suppress this message
{{{end}}}

To display specific errors about incomplete regular fields (but *not* incomplete hidden
fields or definitions) use the `--concrete`/`-c` flag:

{{{with code "en" "concrete fail with -c"}}}
! exec cue vet -c
cmp stderr out
-- file.cue --
package example

A:  int & >100
_B: int & >100
#C: int & >100
-- out --
A: incomplete value >100 & int
{{{end}}}

This flag takes a boolean value, which is implicitly `true` when the flag is
present but the value is omitted. These forms of the flag are all equivalent:
`--concrete=true`/`-c=true`/`--concrete`/`-c`.

To make `cue vet` check *only* for data consistency specify the flag's value as
`--concrete=false`/`-c=false`. This prevents `cue vet` from failing when it
encounters regular fields with incomplete values that are otherwise valid:

{{{with code "en" "concrete pass with -c=false"}}}
# location top bottom
exec cue vet -c=false # this command succeeds
cmp stderr out
-- file.cue --
package example

A: int & >100
-- out --
{{{end}}}

`cue vet -c=false` will still fail when it encounters regular fields with
incomplete *and* inconsistent values:

{{{with code "en" "incomplete & inconsistent fail with -c=false"}}}
#location top bottom
! exec cue vet -c=false
cmp stderr out
-- file.cue --
package example

A: int & string
-- out --
A: conflicting values int and string (mismatched types int and string):
    ./file.cue:3:4
    ./file.cue:3:10
{{{end}}}

## Related content

{{<todo "FIXME">}}
