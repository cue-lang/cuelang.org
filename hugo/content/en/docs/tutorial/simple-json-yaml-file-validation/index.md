---
title: Validating simple JSON and YAML files with the CUE CLI
tags:
    - cue command
---

## What you're about to do

In this tutorial, you'll use the CUE CLI tool to check that simple JSON and YAML files contain the information that you expect.

## What you need to have done already

This tutorial assumes you have already [installed the CUE CLI](FIXME),
and that you are able to use an editor to create and modify text files on your computer.

## Let's begin!

In this tutorial you'll create some JSON or YAML data files describing some pets, and use CUE to make sure that the files contain what you expect.

Create a new directory for this tutorial (its name doesn't matter).

Point your editor and command-line interface (your terminal, or shell) at this empty directory.

### Validating a single file

Choose if you're going to work with files formatted as JSON, or formatted as YAML. If you don't have a preference, choose "YAML".

Select the tab for the file format you've chosen. FIXME: can we error if the JSON and YAML contents drift? Could we single source the behind-the-scenes data in CUE, and generate the json/yaml content in the preprocessor?

{{< tabs groupId="format" >}}

{{< tab name="YAML" >}}
Create a YAML data file named `charlie.yml` to hold Charlie the cat's information. Place this data in it:

```yaml {title="charlie.yml"}
name:
  first: Charlie
  last:  Cartwright
species: cat
age: 15
adorable: true
```

{{< /tab >}}

{{< tab name="JSON" >}}
Create a JSON data file named `charlie.json` to hold Charlie the cat's information. Place this data in it:

```json {title="charlie.json"}
{
  "name": {
    "first": "Charlie",
    "last": "Cartwright"
  },
  "species": "cat",
  "age": 15,
  "adorable": true
}
```
{{< /tab >}}
{{< /tabs >}}

Now create a file called `pets.cue` to hold the policies. CUE will check that your data files adhere to these policies. Place this CUE in it:

```text {title="pets.cue",linenos=table}
species!: "cat" | "dog"
adorable?: true
```

Line 1 is important because *in this tutorial* all pets are cats or dogs, so the "`species`" field can only contain one choice from a limited set of options. This is what CUE calls a **disjunction**, which is indicated by a pipe symbol ("`|`").

On line 1 you've also marked "`species`" as being **required**, with an exclamation mark ("`!`"). This means it always needs to be present in the data.

On line 2 you've marked the "`adorable`" field as being **optional**, by using a question mark ("`?`"). This means that the field *could* be omitted from the data, but if it's present then -- *of course* -- it has to be set to "`true`". Can you imagine teaching a computer that a pet *isn't* adorable? That would be *unacceptable*!

Now ask the CUE CLI, `cue`, to check that the contents of the `charlie` data file adhere to the policies you placed in `pets.cue`:

{{< tabs groupId="format" >}}

{{< tab name="YAML" >}}
```console
$ cue vet pets.cue charlie.yml
```
{{< /tab >}}
{{< tab name="JSON" >}}
```console
$ cue vet pets.cue charlie.json
```
{{< /tab >}}
{{< /tabs >}}

Notice how the command returns instantly, with no output. This is how the "`cue vet`" command tells you that everything is fine: by saying nothing. If you *do* see some output, it's a sign that you've made some small mistake while following the tutorial this far. Don't worry - just start at the beginning and try again!

### Validating more than one file

The "`cue vet`" command can check more than one data file at once.

Add a second data file containing the details of another pet.

{{< tabs groupId="format" >}}

{{< tab name="YAML" >}}
Create a YAML data file named `toby.yml` to hold Toby the dog's information.  
Place this data in it, including the intentional mistake in the "`species`" field:

```yaml {title="toby.yml"}
name:
  first: Toby
species: goldfish
age: 12
adorable: true
```
{{< /tab >}}

{{< tab name="JSON" >}}
Create a JSON data file named `toby.json` to hold Toby the dog's information.  
Place this data in it, including the intentional mistake in the "`species`" field:

```json {title="toby.json"}
{
  "name": {
    "first": "Toby"
  },
  "species": "goldfish",
  "age": 12,
  "adorable": true
}
```
{{< /tab >}}
{{< /tabs >}}

Now ask CUE to check that the contents of both data files adhere to the policies you placed in `pets.cue`:

{{< tabs groupId="format" >}}
{{< tab name="YAML" >}}
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
{{< /tab >}}

{{< tab name="JSON" >}}
```console
$ cue vet pets.cue charlie.json toby.json
species: 2 errors in empty disjunction:
species: conflicting values "cat" and "goldfish":
    ./pets.cue:1:12
    ./toby.json:5:14
species: conflicting values "dog" and "goldfish":
    ./pets.cue:1:20
    ./toby.json:5:14
```
{{< /tab >}}
{{< /tabs >}}

The `cue vet` command points out that one of your data files, the `toby` file, *doesn't* adhere to all your policies. It tells you which files are disagreeing with each other, and which lines in those files might be at fault.

You taught CUE that the "`species`" field is a **disjunction** (FIXME) of 2 values: `species: "dog" | "cat"`. CUE tries matching `"goldfish"` against all the options you gave it, and tells you there would be a problem with both: "`species: 2 errors in empty disjunction:`"

CUE's error message shows the line and column that's causing the problem in your file. The first number shows the line, and the second number shows the column. 

Using the line number, correct your data file:

{{< tabs groupId="format" >}}

{{< tab name="YAML" >}}
```yaml {title="toby.yml"}
name:
  first: Toby
species: dog
age: 12
adorable: true
```
{{< /tab >}}

{{< tab name="JSON" >}}
```json {title="toby.json"}
{
  "name": {
    "first": "Toby"
  },
  "species": "dog",
  "age": 12,
  "adorable": true
}
```
{{< /tab >}}
{{< /tabs >}}

Now ask CUE to check that the contents of both data files adhere to the policies you placed in `pets.cue`:

{{< tabs groupId="format" >}}
{{< tab name="YAML" >}}
```console
$ cue vet pets.cue charlie.yml toby.yml
```
{{< /tab >}}

{{< tab name="JSON" >}}
```console
$ cue vet pets.cue charlie.json toby.json
```
{{< /tab >}}
{{< /tabs >}}

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
