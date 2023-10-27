---
title: "JSON integration"
description: "How CUE integrates with the JSON data-interchange format"
---

## Intro

CUE is a superset of JSON: any valid JSON file is a valid CUE file.
There is not much more integration you can get than that.
The main motivation to make it a superset was to promote familiarity.

{{< info >}}
### JSON's influence on CUE
There are many design decisions in CUE that are a result of CUE being
a strict super set of JSON.
For instance, interpolations in CUE use the `"\(str)"` notation, rather than
the somewhat more common `"${str}"`.
The latter is, however, a valid JSON string and cannot be used interchangeably
with normal strings, as one cannot tell from the string itself
if it is to be used as a template or a verbatim string.
CUE's notation is _not_ valid JSON, meaning it is safe for CUE to give it
special treatment outside of the JSON spec.
This way 100% compatibility is guaranteed.
{{< /info >}}


## Generate JSON

The `cue export` command outputs CUE in a data format.
By default this is JSON:

<!-- TODO: turn this into a side-by-side code block -->
```txt
$ cat >> coordinates.cue << EOF
x: 43.45
y: -34.12
EOF

$ cue export coordinates.cue
{
    "x": 43.45,
    "y": -34.12
}
```


## JSON in CUE

It may also be needed to deal with JSON inside a CUE file.
For instance, a Kubernetes ConfigMap may specify an embedded JSON file.
CUE provides a builtin JSON package to parse, generate, or validate
JSON from within CUE.


### Create

The builtin `encoding/json.Marshal` generates JSON from within CUE.

{{< code-tabs >}}
{{< code-tab name="CUE" language="text"  area="top-left" >}}
import "encoding/json"

configMap: data: "point.json":
	json.Marshal({
		x: 4.5
		y: 2.34
	})
{{< /code-tab >}}
{{< code-tab name="JSON" language="json" type="terminal" area="top-right" >}}
{
    "configMap": {
        "data": {
            "point.json": "{\"x\":4.5,\"y\":2.34}"
        }
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}

### Parse

The reverse is also possible.

{{< code-tabs >}}
{{< code-tab name="CUE" language="text"  area="top-left" >}}
import "encoding/json"

data:  #"{"x":4.5,"y":2.34}"#
point: json.Unmarshal(data)
{{< /code-tab >}}
{{< code-tab name="JSON" language="json" type="terminal" area="top-right" >}}
{
    "data": "{\"x\":4.5,\"y\":2.34}",
    "point": {
        "x": 4.5,
        "y": 2.34
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}

### Validate

{{< code-tabs >}}
{{< code-tab name="CUE" language="text"  area="top-left" >}}
import "encoding/json"

#Dimensions: {
	width:  number
	depth:  number
	height: number
}

// Validate JSON configurations embedded strings.
configs: [string]: json.Validate(#Dimensions)

configs: bed:      #"{ "width": 2, "height": 0.1, "depth": 2 }"#
configs: table:    #"{ "width": "34", "height": 23, "depth": 0.2 }"#
configs: painting: #"{ "width": 34, "height": 12, "depht": 0.2 }"#
{{< /code-tab >}}
{{< code-tab name="ERR" language="err" type="terminal" area="top-right" >}}
configs.painting: invalid value "{ \"width\": 34, \"height\": 12, \"depht\": 0.2 }" (does not satisfy encoding/json.Validate({width:number,depth:number,height:number})): error in call to encoding/json.Validate: field not allowed:
    ./in.cue:10:20
    ./in.cue:3:14
    ./in.cue:14:20
    json.Validate:1:1
    json.Validate:1:30
configs.table: invalid value "{ \"width\": \"34\", \"height\": 23, \"depth\": 0.2 }" (does not satisfy encoding/json.Validate({width:number,depth:number,height:number})): error in call to encoding/json.Validate: conflicting values number and "34" (mismatched types number and string):
    ./in.cue:10:20
    ./in.cue:4:10
    ./in.cue:13:20
    json.Validate:1:1
    json.Validate:1:12
{{< /code-tab >}}
{{< /code-tabs >}}
