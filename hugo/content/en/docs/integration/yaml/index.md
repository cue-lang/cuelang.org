---
title: "YAML"
description: "How CUE integrates with the YAML data-serialization standard"
weight: 20
toc_hide: false
---

## Intro

Unlike with JSON, CUE is not a superset of YAML.
One of the design goals of CUE was to be easily machine generatable and
modifiable.
The sensitivity to indentation and the lexical obscurity of the typing of
tokens make YAML too bug prone for this purpose.

Consider this piece of yaml:

```yml
phrases:
  quote1:
    lang: en
    text: Never regret anything that made you smile.
    attribution: Mark Twain
  proverb:
    lang: "no"
    text: Stemmen som sier at du ikke klarer det, lyver.
```

See the problem?
The language for the Norwegian proverb is set to `no`, which is interpreted
as `false` in YAML.

Luckily, CUE can help catch those pesky YAML quirks quickly and swiftly.


## Command line tool

### Validate YAML files

The `vet` command of the `cue` command line tool can validate
YAML files using a CUE schema.

Given these two files, the `cue vet` command can verify that the values in
`ranges.yaml` are correct by just mentioning the two files on the command line.

{{< code-tabs >}}
{{< code-tab name="check.cue" language="cue"  area="top-left" >}}
min?: *0 | number    // 0 if undefined
max?: number & >min  // must be strictly greater than min if defined
{{< /code-tab >}}
{{< code-tab name="ranges.yaml" language="yaml"  area="top-right" >}}
min: 5
max: 10
---
min: 10
max: 5
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="err" type="terminal" area="bottom" >}}
$ cue vet ranges.yaml check.cue
max: invalid value 5 (out of bound >10):
    ./check.cue:2:16
    ./ranges.yaml:5:6
{{< /code-tab >}}
{{< /code-tabs >}}

### Import YAML

The `import` command of the `cue` command line tool can convert YAML files
into CUE.
It can even embedded structured YAML and JSON and convert those recursively.


## YAML in CUE

The `encoding/yaml` builtin package provides various builtins to
parse, generate, or validate YAML from within CUE.

### Validate

If the YAML string from our introduction were embedded within a CUE file,
the fix would be the following.

<!-- TODO: Can #layout cope with /2/ files instead of 3?
This needs a top-and-bottom layout, with the error messages on the bottom, not
the side-by-side default, but we only have 2 files.
-->
```cue
import "encoding/yaml"

// Phrases defines a schema for a valid phrase.
#Phrases: {
	phrases: [string]: #Phrase

	#Phrase: {
		lang:         #LanguageTag
		text:         !=""
		attribution?: !="" // must be non-empty when specified
	}
	#LanguageTag: =~"^[a-zA-Z0-9-_]{2,}$"
}

// phrases is a YAML string with a field phrases that is a map of Phrase
// objects.
phrases: yaml.Validate(#Phrases)

phrases: """
	phrases:
	  # A quote from Mark Twain.
	  quote1:
	    lang: en
	    text: Never regret anything that made you smile.
	    attribution: Mark Twain

	  # A Norwegian proverb.
	  proverb:
	    lang: no
	    text: Stemmen som sier at du ikke klarer det, lyver.
	"""
```

By defining a schema (called definition in CUE) for the allowed values of a YAML
string, we were able to catch the error before it made it into production.

```txt
$ cue vet dim.cue
phrases: error in call to encoding/yaml.Validate: conflicting values false and
LanguageTag (mismatched types bool and string):
    ./dim.cue:18:10
```


### Create

The builtin `encoding/yaml.Marshal` generates YAML from within CUE.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
import "encoding/yaml"

configMap: data: "point.yaml":
	yaml.Marshal({
		x: 4.5
		y: 2.34
	})
{{< /code-tab >}}
{{< code-tab name="JSON" language="json" type="terminal" area="top-right" >}}
{
    "configMap": {
        "data": {
            "point.yaml": "x: 4.5\n\"y\": 2.34\n"
        }
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}

### Parse

The inverse is also possible

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
import "encoding/yaml"

data: """
	x: 4.5
	y: 2.34
	"""
point: yaml.Unmarshal(data)
{{< /code-tab >}}
{{< code-tab name="JSON" language="json" type="terminal" area="top-right" >}}
{
    "data": "x: 4.5\ny: 2.34",
    "point": {
        "x": 4.5,
        "y": 2.34
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}
