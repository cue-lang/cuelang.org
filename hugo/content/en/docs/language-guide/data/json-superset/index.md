---
title: JSON Superset
weight: 10
draft: false
---

CUE adds functionality to JSON that makes it easier to write for humans to write
data and configurations in general:

- there are `// single line comments`,
- quotes can be omitted for field names without special characters,
- you do not need commas after map fields,
- you can place commas after the last element of a composite type, and
- the outermost curly braces are optional. {{{TODO "note on embedding"}}}

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
// A doc comment
map: {
	member1: 3 // a line comment
	member2: 4
}
{{< /code-tab >}}
{{< code-tab name="JSON" language="json" type="terminal" area="top-right" >}}
{
    "map": {
        "member1": 3,
        "member2": 4
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}

{{{reference "json-vs-cue"}}}

<!-- TODO: Also useful for defining data: embedding, builtins, … -->

## Comments

CUE supports `//`-style comments: any line  Comments are first-class citizens in
CUE.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
// A doc comment
map: {
	member1: 3 // a line comment
	member2: 4
}
{{< /code-tab >}}
{{< code-tab name="JSON" language="json" type="terminal" area="top-right" >}}
{
    "map": {
        "member1": 3,
        "member2": 4
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}

A comment that is directly on a line directly preceding an element, that comment
is called a doc comment. CUE will treat such comments as special and will
associate that comment with this element during computation.

## null, true, and false

The JSON standard does not assign any special meaning to `null` and, as can be
expected, there is no real consistent interpretation of `null` in the wild. To
remain compatible with all these use cases, CUE does not assign any special
meaning to the keyword `null`.

CUE has the same boolean values as JSON, represented by the keywords `true` and
`false`.
