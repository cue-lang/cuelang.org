---
title: Transforming JSON with CUE
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE](/docs/howto/about-these-guides/#commented-cue-guides)
demonstrates validating JSON input data with a CUE schema, and emitting
modified output data based on the input.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue"  area="top-left" >}}
package example

// place the json input here with "-l"
input: _

// validate the input against a schema
input: #Schema
#Schema: {
	owner?: {
		name!:    string
		address?: string
	}
	pets?: [...#Pet]
	#Pet: {
		name!:    string
		species!: string & or(#Species)
		breed?:   string
		age?:     int & <50 // years
	}
}
#Species: [ "cat", "dog", "goldfish"]

// construct the modified output
output: petsBySpecies: {
	for s in #Species {(s): [
		if input.pets != _|_
		for pet in input.pets
		if pet.species == s {{
			Name: pet.name
			if pet.age != _|_ {
				Age: pet.age
				DoB: 2023 - pet.age
			}
			if pet.breed != _|_ {
				Breed: pet.breed
			}
			Owner: input.owner.name
		}},
	]}
}
{{< /code-tab >}}
{{< code-tab name="data.json" language="json"  area="top-right" >}}
{
    "owner": {
        "name": "Dorothy Cartwright",
        "address": "Ripon, North Yorkshire, England"
    },
    "pets": [
        {
            "name": "Charlie",
            "species": "cat",
            "age": 15
        },
        {
            "name": "Lola",
            "species": "dog",
            "breed": "dachshund"
        },
        {
            "name": "Fred",
            "species": "goldfish",
            "age": 8
        },
        {
            "name": "George",
            "species": "cat",
            "age": 5
        }
    ]
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="bottom" >}}
$ cue export .:example -l input: data.json -e output --out json
{
    "petsBySpecies": {
        "cat": [
            {
                "Name": "Charlie",
                "Age": 15,
                "Owner": "Dorothy Cartwright",
                "DoB": 2008
            },
            {
                "Name": "George",
                "Age": 5,
                "Owner": "Dorothy Cartwright",
                "DoB": 2018
            }
        ],
        "dog": [
            {
                "Name": "Lola",
                "Breed": "dachshund",
                "Owner": "Dorothy Cartwright"
            }
        ],
        "goldfish": [
            {
                "Name": "Fred",
                "Age": 8,
                "Owner": "Dorothy Cartwright",
                "DoB": 2015
            }
        ]
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content
