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

If you haven't already installed it, follow the steps for [downloading and installing CUE](FIXME)

### Validate a single file

{{step ref="single-start"}}
Open a command prompt and create a new directory to hold this tutorial's files.

For example:

```console
cd
mkdir validating-yaml-with-cue
cd validating-yaml-with-cue
```

{{step}}
Create a data file named `charlie.yml` to hold Charlie the cat's details.

Place this information in it, including the deliberate mistake in the `species`
field:

```yaml {title="charlie.yml",linenos=table}
name:
  first: Charlie
  last:  Cartwright
species: goldfish
age: 15
adorable: false
```

{{step}}
Now create a file called `pets.cue` to hold your schema.
`cue` will check that your data files adhere to this schema.

Place this CUE in it:

```text {title="pets.cue",linenos=table}
species!:  "cat" | "dog"
adorable?: true
```

Line 1 is important because *in this tutorial* all pets are cats or dogs,
so the "`species`" field can only contain one choice from a limited set of
options.
This is what CUE calls a **disjunction**, which is indicated by a pipe symbol
("`|`").

On line 1 you've also marked "`species`" as being **required**, with an
exclamation mark ("`!`").
This means that the field *must* be present in the data.

On line 2 you've marked the "`adorable`" field as being **optional**, by using
a question mark ("`?`").
This means that the field *can* be omitted from the data, but if it's present
then --naturally-- it has to be set to "`true`".

{{step}}
Ask `cue` to check that the `charlie.yml` data file adheres to the schema you
defined in `pets.cue`:

```console
$ cue vet pets.cue charlie.yml
adorable: conflicting values true and false:
    ./charlie.yml:6:12
    ./pets.cue:2:12
species: 2 errors in empty disjunction:
species: conflicting values "cat" and "goldfish":
    ./charlie.yml:4:11
    ./pets.cue:1:12
species: conflicting values "dog" and "goldfish":
    ./charlie.yml:4:11
    ./pets.cue:1:20
```

`cue vet` is telling you that there are problems with 2 fields in your data
file.

{{step}}
Firstly, there's a conflict between the values of `adorable` in `charlie.yml`
on line 6, and `pets.cue` on line 2. Remember that your schema says that the
`adorable` field is optional, but if it's present then it can only contain the
value `true`. Fix this by changing the value to `true` in your data file.

{{step}}
Secondly, `cue vet` says that there are "2 errors in empty disjunction"
relating to the `species` field, followed by a 2 pairs of "conflicting values
..." error messages and file line references. This is `cue`'s way of showing
you that it compared your `goldfish` string against both options permitted by
your schema (`dog` or `cat`), and that it failed to find a match that's
allowed. Fix this by changing the value to `cat` in your data file.

Now that you've corrected your data file, it should read as follows:

```yaml {title="charlie.yml",linenos=table}
name:
  first: Charlie
  last:  Cartwright
species: cat
age: 15
adorable: true
```

{{step}}
Ask `cue` to re-check the data file against the CUE schema:

```console
$ cue vet pets.cue charlie.yml
```

Notice how the command returns instantly, with no output.
This is how the `cue vet` command tells you that everything is fine: by
saying nothing.
If you *do* see some output, it's a sign that you've made some small mistake
while following the tutorial or fixing the data file.
Don't worry if this happens - just go back to step {{step:ref:single-start}}
and try again!

### Validating more than one file

The `cue vet` command can check more than one data file at once.

{{step}}
Add a second data file containing the details of another pet.

Create a data file named `toby.yml` to hold Toby the dog's details.

Place this information in it:

```yaml {title="toby.yml",linenos=table}
name:
  first: Toby
  last: Dog
species: dog
age: 12
adorable: true
```

{{step}}
Ask `cue` to check that both data files adhere to your schema in `pets.cue`:

```console
$ cue vet pets.cue charlie.yml toby.yml
```

As before, the lack of any error message confirms that both data files are
permitted by the constraints created by your schema. `cue vet` validates each
data file's contents independently.

**Well done!** You can now use your `pets.cue` file to validate the contents of
any number of pet data files in the future. More usefully, you can now write
simple schema files to describe the important details of your own YAML and JSON
data files, and you can use the `cue vet` command to check that your data files
adhere to any schemas you create.

## Next steps

- To disover how to write more complex and nuanced schemas, follow the next
  tutorial in this series: FIXME ref/title/etc
- FIXME: Pointers to other tutorial(s)
- You used these CUE language features in this tutorial - read about them in the CUE language guide:
  - [Disjunctions]({{< ref "docs/language-guide/schemas-and-validation/disjunctions" >}})
    allowed you to list different options that a field's values could contain
  - Required and Optional fields are both
    [Field Constraints]({{< ref "docs/language-guide/schemas-and-validation/field-constraints" >}})

