---
title: Validating simple YAML files with the `cue` CLI
tags:
    - cue command
---

In this tutorial, you'll use the `cue` CLI tool to check that simple YAML data
files contain the information that you expect. Along the way, you'll:

- Install the `cue` CLI tool (if you haven't already)
- Define a schema in CUE
- Validate a single data file using your schema
- Discover some mistakes in your data file
- Fix your data file and revalidate it
- Validate multiple data files at once

## Prerequisites

- **A tool to edit text files**. Any text editor you have will be fine. Some
  popular text editors are VSCode, Vim, Nano, and Emacs; but if you need to use
  Notepad that will work fine.
- **A command terminal**. `cue` works well using any terminal on Linux and Mac,
  and on PowerShell or `cmd.exe` in Windows.  TODO: is this true for Windows?

FIXME: explicitly call out Windows as supported? Or don't mention any OSes at all?
Call out only-tested-on-Linuxness?

Let's begin!

### Install the `cue` CLI tool

If you haven't already installed it, follow the steps for
[downloading and installing CUE]({{< ref "docs/introduction/installation" >}}).

### Validate a single file

{{{with step}}}
Open a command prompt and create a new directory to hold this tutorial's files.

For example:

{{{with script "en" "prelude"}}}
pwd                  # we start in our home directory, but you don't need to
mkdir validating-yaml-with-cue
cd    validating-yaml-with-cue
{{{end}}}
{{{end}}}

{{{with step}}}
Create a data file named `charlie.yml` to hold Charlie the cat's details.

Place this information in it, including the deliberate mistake in the `species`
field:

{{{with upload "en" "yamlBroken"}}}
#codetab(charlie.yml) linenos="table"
-- charlie.yml --
name:
  first: Charlie
  last:  Cartwright
species: goldfish
age: "15"
{{{end}}}
{{{end}}}

{{{with step}}}
Now create a file called `pets.cue` to hold your schema, and place this CUE in it:

{{{with upload "en" "pets.cue"}}}
#codetab(pets.cue) linenos="table"
-- pets.cue --
species!:  "cat" | "dog"
age?:      number
{{{end}}}

`cue` will check that your data files adhere to this schema.

Line 1 is important because *in this tutorial* all pets are cats or dogs, so
the `species` field can only contain one of a fixed set of options. This is
what CUE calls a **disjunction**, and is indicated by a pipe symbol ("`|`").

On line 1 you've also marked `species` with an exclamation mark ("`!`"). This
means that *the field must be present in the data*, which CUE calls a
**required field**.

On line 2 you've marked the `age` field with a question mark ("`?`"). CUE calls
this an **optional field**, which means that *the field may be omitted from the
data*.

You've constrained the `age` field's value so that, *if it's present*, it has
to be of **type** `number`. This is a CUE **type constraint**.

This particular type constraint, `number`, permits values that are either
integers or decimal floating-point numbers. CUE has other primitive types that
you can use to constrain a field's value.
{{{end}}}

{{{with step}}}
Ask `cue` to check that the `charlie.yml` data file adheres to the schema you
defined in `pets.cue`:

{{{with script "en" "vet-failure-1"}}}
! cue vet pets.cue charlie.yml
{{{end}}}

`cue vet` is telling you that there are problems with 2 fields in your data
file.
{{{end}}}

{{{with step}}}
Firstly, there's a conflict between what's specified for the `age` field in
`charlie.yml` on line 5, and the schema's constraints in `pets.cue` on line 2.
`cue` tells you about these `mismatched types`, along with pointers to the
files and line numbers that disagree with each other.

Looking at the files, you can see that your *schema* says that the `age` field
has to be a `number` if it's present. In your *data file* the quotation marks
around the number 15 mean that the value is *actually* a `string`.

Fix this mismatch in your data file by removing both quotation marks around the
`age` field's value.
{{{end}}}

{{{with step}}}
Secondly, `cue vet` says that there are `2 errors in empty disjunction`,
relating to the `species` field. This is followed by a pair of `conflicting
values ...` error messages pointing to the files and line numbers that are
conflicting.

This is `cue`'s way of showing you that it compared the field's value in the
data file (`goldfish`) against both options permitted by your schema (`dog` or
`cat`), and that it failed to find any options that matched, or **unified**,
successfully.

Fix this in your data file by changing the `species` field's value to `cat`.
{{{end}}}

{{{with step}}}
Now that you've corrected your data file, it should read as follows:

{{{with upload "en" "yamlFixed"}}}
#codetab(charlie.yml) linenos="table"
-- charlie.yml --
name:
  first: Charlie
  last:  Cartwright
species: cat
age: 15
{{{end}}}
{{{end}}}

{{{with step}}}
Ask `cue` to re-check the data file against the CUE schema:

{{{with script "en" "vet-success-1"}}}
cue vet pets.cue charlie.yml
{{{end}}}

Notice how the command returns instantly, with no output.

This is how the `cue vet` command tells you that everything is fine: by saying
nothing, and silently returning an exit code of 0 to your shell.

{{< info >}}
If you *do* see some output, it's a sign that you've made some small mistake
while following the tutorial or fixing the data file.
Don't worry if this happens - just go back to step FIXME:stepref:single-start
and try again!
{{< /info >}}
{{{end}}}

### Validating more than one file

The `cue vet` command can check more than one data file at once.

{{{with step}}}
Add a second data file containing the details of another pet.

Create a data file named `toby.yml` to hold Toby the dog's details.

Place this information in it:

{{{with upload "en" "yaml2"}}}
#codetab(toby.yml) linenos="table"
-- toby.yml --
name:
  first: Toby
  last: Dog
species: dog
age: 12.5
{{{end}}}
{{{end}}}

{{{with step}}}
Ask `cue` to check that both data files adhere to your schema in `pets.cue`:

{{{with script "en" "vet-success-2"}}}
cue vet pets.cue charlie.yml toby.yml
{{{end}}}

The command's success (and lack of any error message) confirms that both data
files are valid, because both their contents are permitted by the constraints
you placed in your schema.

{{< info >}}
`cue vet` validates each data file independently.\
Each file must adhere to the schema *in isolation*.
{{< /info >}}
{{{end}}}

**Well done!** You can now use your `pets.cue` file to validate the contents of
any number of pet data files in the future.

More usefully, you can now write simple schema files to describe the important
details of your own YAML and JSON data files, and you can use the `cue vet`
command to check that your data files adhere to any schemas you create.

<u>There's more to discover about how CUE can help you validate different kinds
of data values.\
See the "Next steps" section for links to tutorials that explore this
in more detail.</u>

## Next steps

- To disover how to write more complex and nuanced schemas, follow the next
  tutorial in this series: FIXME ref/title/etc
- FIXME: Pointers to other tutorial(s)
- You used these CUE language features in this tutorial. Read about them in the CUE language guide:
  - [**Merging**]({{< ref
    "docs/language-guide/data/organizing-configuration#merging" >}}) is how CUE
    deals with repeated statements of the same data, spread across different locations.
    FIXME: not unification? Is this a good LG page to point towards, here?
  - [**Disjunctions**]({{< ref "docs/language-guide/schemas-and-validation/disjunctions" >}})
    allowed you to list different options that a field's values are allowed to contain.
  - Required and Optional fields are both examples of CUE's
    [**Field Constraints**]({{< ref "docs/language-guide/schemas-and-validation/field-constraints" >}}).
  - CUE has several primitive
    [**Types**]({{< ref "docs/language-guide/data" >}}) that you can use as
    [**Type Constraints**]({{< ref "docs/language-guide/schemas-and-validation/types" >}}).

