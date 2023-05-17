---
title: JSON Superset
weight: 10
draft: false
---

CUE adds functionality to JSON that makes it easier for humans to write data and
configurations in general:

- there are `// single line comments`,
- quotes can be omitted for field names without special characters,
- you do not need commas after map fields,
- you can place commas after the last element of a composite type, and
- the outermost curly braces are optional. {{{TODO "note on embedding"}}}

```coq
{{{with sidebyside "en" "json-superset"}}}
-- in.cue --
// A doc comment
map: {
	member1: 3 // a line comment
	member2: 4
}
-- out.json --
{
    "map": {
        "member1": 3,
        "member2": 4
    }
}
{{{end}}}
```

{{{reference "json-vs-cue"}}}

<!-- TODO: Also useful for defining data: embedding, builtins, … -->

## Comments

CUE supports `//`-style comments. Comments are first-class citizens in CUE.

```coq
{{{with sidebyside "en" "json-comments"}}}
-- in.cue --
// A doc comment
map: {
	member1: 3 // a line comment
	member2: 4
}
-- out.json --
{
    "map": {
        "member1": 3,
        "member2": 4
    }
}
{{{end}}}
```

A comment that is on a line directly preceding an element is called a doc
comment. CUE will associate that comment with this element and will persist
after computation.

## null, true, and false

The JSON standard does not assign any special meaning to `null` and, as can be
expected, there is no real consistent interpretation of `null` in the wild. To
remain compatible with all these use cases, CUE does not assign any special
meaning to the keyword `null`.

CUE has the same boolean values as JSON, represented by the keywords `true` and
`false`.
