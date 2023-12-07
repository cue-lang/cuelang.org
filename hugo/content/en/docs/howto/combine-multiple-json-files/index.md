---
title: Combining multiple JSON files
tags:
- cue command
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/#commented-cue" >}}) demonstrates
how to use the `cue` command to combine multiple JSON files, even if their
contents wouldn't unify successfully.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue"  area="top-left" >}}
package example

inputs: _

output: [
	for _fileName, _fileContents in inputs {
		{
			filename: _fileName
			contents: _fileContents
		}
	},
]
{{< /code-tab >}}
{{< code-tab name="a.json" language="json"  area="top-right" >}}
{
    "a": 1,
    "b": 2,
    "c": 3
}
{{< /code-tab >}}
{{< code-tab name="b.json" language="json"  area="top-right" >}}
{
    "a": "a string",
    "b": true,
    "c": 42
}
{{< /code-tab >}}
{{< code-tab name="c.json" language="json"  area="top-right" >}}
[
    "a list element",
    "another element",
    "the last element"
]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="bottom" >}}
$ cue export --with-context -l 'inputs:' -l 'path.Base(filename)' -e output .:example a.json b.json c.json
[
    {
        "filename": "a.json",
        "contents": {
            "a": 1,
            "b": 2,
            "c": 3
        }
    },
    {
        "filename": "b.json",
        "contents": {
            "a": "a string",
            "b": true,
            "c": 42
        }
    },
    {
        "filename": "c.json",
        "contents": [
            "a list element",
            "another element",
            "the last element"
        ]
    }
]
{{< /code-tab >}}
{{< /code-tabs >}}
