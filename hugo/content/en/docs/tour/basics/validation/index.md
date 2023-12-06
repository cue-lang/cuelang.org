---
title: Validation
weight: 180
---

Constraints can be used to validate values of concrete instances.
They can be applied to CUE data, or directly to YAML or JSON.

Here we see a constraint where all languages in `data.yaml` must start with
an uppercase letter, specified in`schema.cue`.
The constraint is validated with `cue vet`.

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue"  area="top-left" >}}
#Language: {
	tag:  string
	name: =~"^\\p{Lu}" // Must start with an uppercase letter.
}
languages: [...#Language]
{{< /code-tab >}}
{{< code-tab name="data.yaml" language="yaml"  area="top-right" >}}
languages:
  - tag: en
    name: English
  - tag: nl
    name: dutch
  - tag: "no"
    name: Norwegian
{{< /code-tab >}}
{{< code-tab name="result.txt" language="txt"  area="bottom" >}}
languages.1.name: invalid value "dutch" (out of bound =~"^\\p{Lu}"):
    ./schema.cue:3:8
    ./data.yaml:5:11
{{< /code-tab >}}
{{< /code-tabs >}}
