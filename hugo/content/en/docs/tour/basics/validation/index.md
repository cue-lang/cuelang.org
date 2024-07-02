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

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
#Language: {
	// Name must start with a uppercase
	// letter, as defined by Unicode.
	Name: =~"^\\p{Lu}"
	Tag:  string
}
languages: [...#Language]
{{< /code-tab >}}
{{< code-tab name="data.yaml" language="yaml" area="top-right" >}}
languages:
  - Name: English
    Tag: en
  - Name: dutch
    Tag: nl
  - Name: Norwegian
    Tag: "no"
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCBmaWxlLmN1ZSBkYXRhLnlhbWw=" >}}
$ cue vet file.cue data.yaml
languages.1.Name: invalid value "dutch" (out of bound =~"^\\p{Lu}"):
    ./file.cue:4:8
    ./data.yaml:4:11
{{< /code-tab >}}
{{< /code-tabs >}}
