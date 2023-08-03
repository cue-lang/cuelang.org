---
title: Validating simple YAML files with the CUE CLI
tags:
    - cue command
---

In this tutorial, you'll use the CUE CLI tool to check that simple YAML data files contain the information that you expect. Along the way, you'll:

- Install the CUE CLI tool (if you haven't already)
- Validate a single data file successfully
- Validate multiple data files, and discover a mistake in your data
- Fix the data and re-validate all your data files

## Prerequisites for this tutorial

- **A tool to edit text files**. Any text editor you have will work fine. The most popular are VSCode, Vim, and Notepad.
- **A command terminal**. CUE works well using any terminal on Linux and Mac, and on PowerShell or `cmd.exe` in Windows. TODO: is this true for Windows?

Let's begin!

### Install the CUE CLI tool

If you haven't already installed it, follow the steps for [downloading and installing CUE](FIXME)

### Validate a single file

{{step}}
Open a command prompt and cd to your home directory.

On Linux or Mac:

```console
cd
```

On Windows:

```console
cd %HOMEPATH%
```

{{step}}
Create a new directory to hold this tutorial's files.

For example:

```console
mkdir tutorial-fh3a
cd tutorial-fh3a
```

Create a data file named `charlie.yml` to hold Charlie the cat's details.

Place this information in it:

```yaml {title="charlie.yml"}
name:
  first: Charlie
  last:  Cartwright
species: cat
age: 15
adorable: true
```

{{step}}
Now create a file called `pets.cue` to hold the policies. CUE will check that your data files adhere to these policies.

Place this CUE in it:

```text {title="pets.cue",linenos=table}
species!:  "cat" | "dog"
adorable?: true
```

Line 1 is important because *in this tutorial* all pets are cats or dogs, so the "`species`" field can only contain one choice from a limited set of options. This is what CUE calls a **disjunction**, which is indicated by a pipe symbol ("`|`").

On line 1 you've also marked "`species`" as being **required**, with an exclamation mark ("`!`"). This means it always needs to be present in the data.

On line 2 you've marked the "`adorable`" field as being **optional**, by using a question mark ("`?`"). This means that the field *could* be omitted from the data, but if it's present then --naturally-- it has to be set to "`true`".

{{step}}
Next, ask the CUE CLI, `cue`, to check that the contents of the `charlie` data file adhere to the policies you placed in `pets.cue`:

```console
$ cue vet pets.cue charlie.yml
```

Notice how the command returns instantly, with no output. This is how the "`cue vet`" command tells you that everything is fine: by saying nothing. If you *do* see some output, it's a sign that you've made some small mistake while following the tutorial. Don't worry if this happens - just start at the beginning and try again!

### Validating more than one file

The "`cue vet`" command can check more than one data file at once.

{{step}}
Add a second data file containing the details of another pet.

Create a data file named `toby.yml` to hold Toby the dog's details.

Place this information in it, including the intentional mistake in the "`species`" field:

```yaml {title="toby.yml"}
name:
  first: Toby
species: goldfish
age: 12
adorable: true
```

{{step}}
Now ask CUE to check that the contents of both data files adhere to the policies you placed in `pets.cue`:

```console
$ cue vet pets.cue charlie.yml toby.yml
species: 2 errors in empty disjunction:
species: conflicting values "cat" and "goldfish":
    ./pets.cue:1:12
    ./toby.yml:3:11
species: conflicting values "dog" and "goldfish":
    ./pets.cue:1:20
    ./toby.yml:3:11
```

The `cue vet` command points out that one of your data files, the `toby` file, *doesn't* adhere to all your policies. It tells you which files are disagreeing with each other, and which lines in those files might be at fault.

You taught CUE that the "`species`" field is a **disjunction** (FIXME) of 2 values, with the CUE

```cue
species!: "dog" | "cat"
```

CUE tried to match `"goldfish"` against all the possible options you gave it, and concluded that there there would be a problem with either option. It told you this with the error message line:

```console
species: 2 errors in empty disjunction:
```

CUE's error message then shows the line and column that's causing the problem in your file, repeated for each failed option in the **disjunction**.

The first number shows the line, and the second number shows the column.

```console
species: conflicting values "cat" and "goldfish":
    ./pets.cue:1:12
    ./toby.yml:3:11
species: conflicting values "dog" and "goldfish":
    ./pets.cue:1:20
    ./toby.yml:3:11
```

{{step}}
Using the line number to guide your changes, correct your data file:

```yaml {title="toby.yml"}
name:
  first: Toby
species: dog
age: 12
adorable: true
```

Now ask CUE to check that the contents of both data files adhere to the policies you placed in `pets.cue`:

```console
$ cue vet pets.cue charlie.yml toby.yml
```

The lack of any error message confirms that you've successfully fixed your data files.

Well done! You can now use your `pets.cue` file to validate the contents of any number of pet data files in the future.

## What you could do next

### Follow the next tutorial in this series

- Summary and link

### Follow some other tutorials

- Pointers to tutorial(s)

### Read about CUE fundamentals used in this tutorial

Pointers to concepts highlighted **in bold** on this page (towards the anguage guide? If so, how do we get them /back/ into tutorials from the LG?):
- Disjunctions
- Required fields
- Optional fields
