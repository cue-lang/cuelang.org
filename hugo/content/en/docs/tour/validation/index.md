---
title: Validation
weight: 180
draft: false
---

Constraints can be used to validate values of concrete instances.
They can be applied to CUE data, or directly to YAML or JSON.

Here we see a constraint where all languages in `data.yaml` must start with
an uppercase letter, specified in`schema.cue`.
The constrainst is validated with `cue vet`.

{{< columns >}}

```{title="schema.cue"}
#Language: {
	tag:  string
	name: =~"^\\p{Lu}" // Must start with an uppercase letter.
}
languages: [...#Language]
```

```{title="data.yaml"}
languages:
  - tag: en
    name: English
  - tag: nl
    name: dutch
  - tag: no
    name: Norwegian
 ```

{{< columns-separator >}}

```{title="$ cue vet schema.cue data.yaml"}
languages.1.name: invalid value "dutch" (does not match =~"^\\p{Lu}"):
    ./schema.cue:3:8
    ./data.yaml:5:12
```

{{< /columns >}}
