---
title: How to validate JSON using CUE
weight:
toc_hide: true
tags:
    - cue command
---

## Introduction

Validating JSON _values_ to be of specific data types is a common need for many
situations. Ensuring that the values in your JSON file are valid is essential
to avoid configuration-related errors. This How-to Guide checks and ensures
each value in a JSON file is the _data type_ it's supposed to be, using the CUE
command line.

## Prerequisites

-   You have [CUE installed](https://cuelang.org/docs/install/) locally. This
    allows you to run `cue` commands
-   You know how to use [CUE Definitions/ Helper Fields]({{< ref "/docs/language-guide/data" >}})

## Requirements

-   Using the command line or terminal
-   File editing

## Steps

{{< step stepNumber="1" >}}
Create a JSON file called `x.json` with the following:

```{title="x.json"}
{
  "people": {
    "Gopher": {
      "name": "Gopher",
      "age": 12,
      "address": "Mountain View"
    },
    "Ken": {
      "name": "Ken",
      "age": 21,
      "address": "The Blue Sky"
    }
  }
}
```

{{< /step >}}

{{< step stepNumber="2" >}}
Create a CUE file named `x.cue`

The following CUE creates a CUE definition that describes the data type
constraints for every person.

```{title="x.cue"}
#Person: {
	name:    string
	age:     int
	address: string
}

people: [X=string]: #Person & {
	name: X
}
```

{{< /step >}}

{{< step stepNumber="3" >}}
Run the following `cue` command in your terminal:

```console
$ cue vet x.cue x.json
```

_NOTE: `cue vet` is silent when run successfully. Output will only show on error._
{{< /step >}}

{{< step stepNumber="4" >}}
Add another person to your JSON data by replacing your `x.json` file with the
following:

```{title="x.json"}
{
  "people": {
    "Gopher": {
      "name": "Gopher",
      "age": 12,
      "address": "Mountain View"
    },
    "Ken": {
      "name": "Ken",
      "age": 21,
      "address": "The Blue Sky"
    },
    "Rob": {
      "name": "Rob",
      "age": 42.2,
      "address": "CUEtopia"
    }
  }
}
```

{{< /step >}}

{{< step stepNumber="5" >}}
Validate again with `cue vet`:

```console
$ cue vet x.cue x.json
people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
    ./x.cue:3:11
    ./x.cue:7:21
    ./x.json:13:11
```

The command output shows validation errors where the JSON violates
the (type) constraints that you have declared.
{{< /step >}}

{{< step stepNumber="6" >}}
Fix up the JSON:

```{title="x.json"}
{
  "people": {
    "Gopher": {
      "name": "Gopher",
      "age": 12,
      "address": "Mountain View"
    },
    "Ken": {
      "name": "Ken",
      "age": 21,
      "address": "The Blue Sky"
    },
    "Rob": {
      "name": "Rob",
      "age": 42,
      "address": "CUEtopia"
    }
  }
}
```

{{< /step >}}

{{< step stepNumber="7" >}}
Validate with `cue vet` again

```console
$ cue vet x.cue x.json
```

The `cue vet` command will show no output on success.
{{< /step >}}

Well done! Any future data errors on names, ages, and addresses in your JSON
will be detected. This is especially helpful with JSON files with 100s (and
even 1000s) of lines.

#### Further reading/See Also

-   [cmd/cue command line documentation](https://cue.googlesource.com/cue/+/refs/tags/v0.2.0/doc/cmd/cue.md)
