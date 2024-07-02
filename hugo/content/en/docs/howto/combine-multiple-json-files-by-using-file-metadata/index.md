---
title: Combining multiple JSON files by using file metadata
tags:
- cue command
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/#commented-cue" >}}) demonstrates
how to use the `cue` command to combine multiple JSON files by making reference
to the files' metadata.

The **`TERMINAL`** section shows the use of:
- the `--with-context` parameter, which makes information about each input file
  available as metadata
- the `filename` metadata field combined with the `-l` parameter, which places
  each file's contents at an individual and deterministic location in the
  evaluation space

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="top-right" >}}
package example

// inputs is the location under which we place
// each data file's contents, so that their
// contents can be accessed by the CUE in this
// file. The cue CLI -l parameter places them
// here, under a secondary key determined by each
// file's name.
inputs: [string]: _

output: {
	for _name, _content in inputs {
		(_name): {
			filename: _name
			content:  _content
		}
	}
}
{{< /code-tab >}}
{{< code-tab name="a.json" language="json" area="top-left" >}}
{
    "a": 1,
    "b": 2,
    "c": 3
}
{{< /code-tab >}}
{{< code-tab name="b.json" language="json" area="top-left" >}}
{
    "a": "a string",
    "b": true,
    "c": 42
}
{{< /code-tab >}}
{{< code-tab name="c.json" language="json" area="top-left" >}}
[
    "a list element",
    "another element",
    "the last element"
]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLXdpdGgtY29udGV4dCAtbCAnaW5wdXRzOicgLWwgJ3BhdGguQmFzZShmaWxlbmFtZSknIC1lIG91dHB1dCBhLmpzb24gYi5qc29uIGMuanNvbiBleGFtcGxlLmN1ZQ==" >}}
$ cue export --with-context -l 'inputs:' -l 'path.Base(filename)' -e output a.json b.json c.json example.cue
{
    "a.json": {
        "filename": "a.json",
        "content": {
            "a": 1,
            "b": 2,
            "c": 3
        }
    },
    "b.json": {
        "filename": "b.json",
        "content": {
            "a": "a string",
            "b": true,
            "c": 42
        }
    },
    "c.json": {
        "filename": "c.json",
        "content": [
            "a list element",
            "another element",
            "the last element"
        ]
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- {{< linkto/related/howto "combine-multiple-yaml-files-by-using-file-metadata" >}}
- {{< linkto/related/reference "command/cue-help-flags" >}}
  documents the `--with-context` and `-l` flags
