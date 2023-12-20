---
title: Validating simple YAML files with the cue command
authors:
    - jpluscplusm
    - myitcv
tags:
    - cue command
    - validation
    - yaml
toc_hide: true
---

In this tutorial, you will use the `cue` command to check that simple YAML data
files are valid.

Along the way, you will:

- Install the `cue` command (if you haven't already).
- Define a schema in CUE.
- Validate a single data file using your schema.
- Discover some mistakes in your data file.
- Fix your data file and revalidate it.
- Validate multiple data files at once.

## Prerequisites

- **A tool to edit text files**. Any text editor you have will be fine, for
  example [VSCode](https://code.visualstudio.com/).
- **A command terminal**. `cue` works on all platforms, so any terminal on Linux
  or macOS, and on PowerShell, `cmd.exe` or
  [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) in Windows.

<!--

FIXME: explicitly call out Windows as supported? Or don't mention any OSes at all?
Call out only-tested-on-Linuxness?

-->

## Install the `cue` command

{{< step stepNumber="1" >}}
If you have not already, follow the steps for
[downloading and installing CUE]({{< relref "/docs/introduction/installation" >}}).
{{< /step >}}

## Validate a single data file

{{< step stepNumber="2" >}}
Open a command prompt and create a new directory to hold this tutorial's files.

For example:

```text { title="TERMINAL" codeToCopy="cHdkICMgd2Ugc3RhcnQgaW4gb3VyIGhvbWUgZGlyZWN0b3J5LCBidXQgeW91IGRvIG5vdCBuZWVkIHRvCm1rZGlyIHZhbGlkYXRpbmcteWFtbC13aXRoLWN1ZQpjZCB2YWxpZGF0aW5nLXlhbWwtd2l0aC1jdWUK" }
$ pwd # we start in our home directory, but you do not need to
/home/runner
$ mkdir validating-yaml-with-cue
$ cd validating-yaml-with-cue
```
{{< /step >}}

{{< step stepNumber="3" >}}
Create a data file named `charlie.yml` to hold Charlie the cat's details.

Place this information in it, including the deliberate mistake in the `species`
field:

```yml { title="charlie.yml" }
name:
  first: Charlie
  last:  Cartwright
species: goldfish
age: "15"
```
{{< /step >}}

{{< step stepNumber="4" >}}
Create a file called `pets.cue` to hold your schema, and place this CUE in it:

```cue { title="pets.cue" linenos="table" }
species!: "cat" | "dog"
age?:     number
```

`cue` will check that your data files are valid, that they satisfy this schema.

Line 1 is important because, for the purposes of this tutorial, all pets are
cats or dogs, so the `species` field can only contain one of a fixed set of
options.  This is what CUE calls a **disjunction**, and is indicated by a pipe
symbol ("`|`").

On line 1 the `species` field is marked with an exclamation mark ("`!`"). This
means that the field must be present in the data, which CUE calls a **required
field**.

On line 2 the `age` field is marked with a question mark ("`?`"). CUE calls
this an **optional field**, which means that the field may present in the data,
but it may not.

The `age` field is constrained such that, if it is present, it has to be of
**type** `number`.

The `number` type constraint permits values that are either integers or decimal
floating-point numbers. CUE has other primitive types that you can use to
constrain a field's value.
{{< /step >}}

{{< step stepNumber="5" >}}
Check that the `charlie.yml` data file satisfies the schema you defined in
`pets.cue`:

```text { title="TERMINAL" codeToCopy="Y3VlIHZldCBwZXRzLmN1ZSBjaGFybGllLnltbAo=" }
$ cue vet pets.cue charlie.yml
age: conflicting values "15" and number (mismatched types string and number):
    ./charlie.yml:5:6
    ./pets.cue:2:11
species: 2 errors in empty disjunction:
species: conflicting values "cat" and "goldfish":
    ./charlie.yml:4:10
    ./pets.cue:1:11
species: conflicting values "dog" and "goldfish":
    ./charlie.yml:4:10
    ./pets.cue:1:19
```

`cue vet` is telling you that there are problems with 2 fields in your data
file.

Firstly, there is a conflict between what is specified for the `age` field in
`charlie.yml` on line 5, and the schema's constraints in `pets.cue` on line 2.
`cue` tells you about these `mismatched types`, along with pointers to the
files and line numbers that disagree with each other.

Looking at the files, you can see that your schema says that the `age` field
has to be a `number` if it is present. In your data file the quotation marks
around the number `15` mean that the value is actually a `string`.

Secondly, `cue vet` says that there are `2 errors in empty disjunction`,
relating to the `species` field. This is followed by a pair of `conflicting
values ...` error messages pointing to the files and line numbers that are
conflicting.

This is `cue`'s way of showing you that it compared the field's value in the
data file (`goldfish`) against both options permitted by your schema (`dog` or
`cat`), and that it failed to find any options that matched, or **unified**,
successfully.

{{< /step >}}

{{< step stepNumber="6" >}}

Update `charlie.yml` to:

* Fix the type mismatch in the `age` field by removing both quotation marks
  around the value.
* Change the `species` field to the value `cat`, a valid species according to
  our schema.

Your corrected data file should read as follows:

```yml { title="charlie.yml" }
name:
  first: Charlie
  last:  Cartwright
species: cat
age: 15
```
{{< /step >}}

{{< step stepNumber="7" >}}
Re-check the data file against the CUE schema:

```text { title="TERMINAL" codeToCopy="Y3VlIHZldCBwZXRzLmN1ZSBjaGFybGllLnltbAo=" }
$ cue vet pets.cue charlie.yml
```

Notice how the command returns instantly, with no output.

This is how the `cue vet` command tells you that everything is fine: by saying
nothing, and silently returning an exit code of `0` to your shell.
{{< /step >}}

{{< info >}}
If you do see some output, it is a sign that you have made some small mistake
while following the tutorial or fixing the data file.
Do not worry if this happens - just go back a few steps and try again!
{{< /info >}}

## Validating multiple data files

The `cue vet` command can check more than one data file at once.

{{< step stepNumber="8" >}}
Add a second data file containing the details of another pet.

Create a data file named `toby.yml` to hold Toby the dog's details:

```yml { title="toby.yml" }
name:
  first: Toby
  last: Dog
species: dog
age: 12.5
```
{{< /step >}}

{{< step stepNumber="9" >}}
Ask `cue` to check that both data files satisfy your schema in `pets.cue`:

```text { title="TERMINAL" codeToCopy="Y3VlIHZldCBwZXRzLmN1ZSBjaGFybGllLnltbCB0b2J5LnltbAo=" }
$ cue vet pets.cue charlie.yml toby.yml
```

The command's success (and lack of any error message) confirms that both data
files are valid, because both their contents are permitted by the constraints
you placed in your schema.
{{< /step >}}

{{< info >}}
`cue vet` validates each data file independently. Each file must independently
satisfy the schema.
{{< /info >}}


## Conclusion

Well done! You can now use your `pets.cue` file to validate the contents of
any number of pet data files in the future.

More usefully, you can now write simple schema files to describe the important
details of your own YAML and JSON data files, and you can use the `cue vet`
command to check that your data files satisfy any schemas you create.

<!--

FIXME: tidy up these next steps and links

There's more to discover about how CUE can help you validate different kinds
of data values.
See the "Next steps" section for links to tutorials that explore this
in more detail.

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

-->
