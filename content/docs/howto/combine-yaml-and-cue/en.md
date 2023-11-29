---
title: Combine YAML and CUE
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE](/docs/howto/about-these-guides/#commented-cue-guides)
demonstrates combining YAML input data with CUE schema and policy constraints,
and using the input data to emit modified output data.

## Validate input data

Here we validate some input data. We identify what information in the YAML
input is unacceptable, according to the schema and policy requirements
expressed in the CUE.

{{{with code "en" "validate"}}}
! exec cue vet .:example -l input: invalidInput.yml
cmp stderr out.err
-- file.cue --
package example

// we place the yaml at this location with the
// "-l" parameter. and bring the field into scope
// for access by this file's CUE simply by
// mentioning it. we unify it with top ("_") in
// order to avoid initially constraining its value.
input: _

input: #Schema & _Policy
#Schema: {
	owner?: {
		name!:    string
		address?: string
	}
	pets?: [...#Pet]
	#Pet: {
		name!:    string
		species!: string
		breed?:   string
		age?:     int // years
	}
}
_Policy: {
	pets?: [..._Pet]
	_Pet: {
		_Species: ["cat", "dog", "goldfish"]
		species?: or(_Species)
		age?:     <50
	}
}

output: petsBySpecies: {
	for s in _Policy._Pet._Species {(s): [
		for pet in input.pets
		if pet.species == s {{
			Name:  pet.name
			Owner: input.owner.name
			if pet.age != _|_ {
				Age: pet.age
				DoB: 2023 - pet.age
			}
			if pet.breed != _|_ {
				Breed: pet.breed
			}
		}},
	]}
}
-- invalidInput.yml --
owner:
  Name: Dorothy Cartwright
  Address: Ripon, North Yorkshire, England
pets:
- name: Charlie
  species: cat
  age: 15
- name: Lola
  species: dog
  breed: dachshund
  age: 93
- name: Fred
  species: parrot
- name: George
-- out.err --
input.owner.Address: field not allowed:
    ./file.cue:10:8
    ./file.cue:12:10
    ./invalidInput.yml:3:4
input.owner.Name: field not allowed:
    ./file.cue:10:8
    ./file.cue:12:10
    ./invalidInput.yml:2:4
input.pets.2.species: 3 errors in empty disjunction:
input.pets.2.species: conflicting values "cat" and "parrot":
    ./file.cue:10:18
    ./file.cue:25:10
    ./file.cue:25:13
    ./file.cue:27:14
    ./invalidInput.yml:13:13
input.pets.2.species: conflicting values "dog" and "parrot":
    ./file.cue:10:18
    ./file.cue:25:10
    ./file.cue:25:13
    ./file.cue:27:21
    ./invalidInput.yml:13:13
input.pets.2.species: conflicting values "goldfish" and "parrot":
    ./file.cue:10:18
    ./file.cue:25:10
    ./file.cue:25:13
    ./file.cue:27:28
    ./invalidInput.yml:13:13
input.pets.1.age: invalid value 93 (out of bound <50):
    ./file.cue:29:13
    ./invalidInput.yml:11:9
{{{end}}}

## Emit modified output data

Here we correct the input data so that it validates successfully, and emit
output data derived from the input.\
The CUE is identical to the previous section.

{{{with code "en" "emit"}}}
exec cue export .:example -l input: validInput.yml -e output --out json
cmp stdout out
-- file.cue --
package example

// we place the yaml at this location with the
// "-l" parameter. and bring the field into scope
// for access by this file's CUE simply by
// mentioning it. we unify it with top ("_") in
// order to avoid initially constraining its value.
input: _

input: #Schema & _Policy
#Schema: {
	owner?: {
		name!:    string
		address?: string
	}
	pets?: [...#Pet]
	#Pet: {
		name!:    string
		species!: string
		breed?:   string
		age?:     int // years
	}
}
_Policy: {
	pets?: [..._Pet]
	_Pet: {
		_Species: ["cat", "dog", "goldfish"]
		species?: or(_Species)
		age?:     <50
	}
}

output: petsBySpecies: {
	for s in _Policy._Pet._Species {(s): [
		for pet in input.pets
		if pet.species == s {{
			Name:  pet.name
			Owner: input.owner.name
			if pet.age != _|_ {
				Age: pet.age
				DoB: 2023 - pet.age
			}
			if pet.breed != _|_ {
				Breed: pet.breed
			}
		}},
	]}
}
-- validInput.yml --
owner:
  name: Dorothy Cartwright
  address: Ripon, North Yorkshire, England
pets:
- name: Charlie
  species: cat
  age: 15
- name: Lola
  species: dog
  breed: dachshund
  age: 13
- name: Fred
  species: goldfish
- name: George
  species: cat
  age: 10
-- out --
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
                "Age": 10,
                "Owner": "Dorothy Cartwright",
                "DoB": 2013
            }
        ],
        "dog": [
            {
                "Name": "Lola",
                "Age": 13,
                "Breed": "dachshund",
                "Owner": "Dorothy Cartwright",
                "DoB": 2010
            }
        ],
        "goldfish": [
            {
                "Name": "Fred",
                "Owner": "Dorothy Cartwright"
            }
        ]
    }
}
{{{end}}}

## Related content
