---
title: Validation
weight: 180
---

Constraints can be used to validate values of concrete instances.
They can be applied to CUE data, or directly to YAML or JSON.

Here we see a constraint where all languages in `data.yaml` must start with
an uppercase letter, specified in`schema.cue`.
The constraint is validated with `cue vet`.

{{{with code "en" "example"}}}
! exec cue vet schema.cue data.yaml
cmp stderr out.err
-- schema.cue --
#Language: {
	tag:  string
	name: =~"^\\p{Lu}" // Must start with an uppercase letter.
}
languages: [...#Language]
-- data.yaml --
languages:
  - tag: en
    name: English
  - tag: nl
    name: dutch
  - tag: "no"
    name: Norwegian
-- out.err --
languages.1.name: invalid value "dutch" (out of bound =~"^\\p{Lu}"):
    ./schema.cue:3:8
    ./data.yaml:5:12
{{{end}}}
