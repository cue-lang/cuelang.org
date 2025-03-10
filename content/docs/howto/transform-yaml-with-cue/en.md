---
title: Transforming YAML with CUE
tags:
- commented cue
- encodings
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to transform YAML by reshaping some input data into different
output.

{{{with code "en" "emit"}}}
exec cue export .:example -l input: data.yml -e output --out yaml
cmp stdout out
-- file.cue --
package example

// place the yaml input here with "-l"
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
#Species: ["cat", "dog", "goldfish"]

// transform the input into the output
output: location: *input.owner.address | "Unknown"
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
-- data.yml --
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
- name: Fred
  species: goldfish
  age: 8
- name: George
  species: cat
  age: 5 
-- out --
location: Ripon, North Yorkshire, England
petsBySpecies:
  cat:
    - Age: 15
      DoB: 2008
      Name: Charlie
      Owner: Dorothy Cartwright
    - Age: 5
      DoB: 2018
      Name: George
      Owner: Dorothy Cartwright
  dog:
    - Breed: dachshund
      Name: Lola
      Owner: Dorothy Cartwright
  goldfish:
    - Age: 8
      DoB: 2015
      Name: Fred
      Owner: Dorothy Cartwright
{{{end}}}

<!-- TODO

## Related content

-->
