---
title: Validation
weight: 180
---

Constraints can be used to **validate** values of concrete instances.
They can be applied to data from any source,
whether held in CUE, YAML, JSON, or elsewhere.

Here, a constraint is applied to all the languages stored in `data.yml`,
and is validated using the
[**`cue vet`**]({{< relref "docs/reference/command/cue-help-vet" >}}) command.

{{{with code "en" "tour"}}}
! exec cue vet file.cue data.yaml
cmp stderr out
-- file.cue --
#Language: {
	// Name must start with a uppercase
	// letter, as defined by Unicode.
	Name: =~"^\\p{Lu}"
	Tag:  string
}
languages: [...#Language]
-- data.yaml --
languages:
  - Name: English
    Tag: en
  - Name: dutch
    Tag: nl
  - Name: Norwegian
    Tag: "no"
-- out --
languages.1.Name: invalid value "dutch" (out of bound =~"^\\p{Lu}"):
    ./file.cue:4:8
    ./data.yaml:4:11
{{{end}}}
