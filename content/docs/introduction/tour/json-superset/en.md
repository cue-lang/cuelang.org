---
title: JSON Superset
weight: 30
draft: false
---


CUE is a superset of JSON.
It adds the following conveniences:

- C-style comments,
- quotes may be omitted from field names without special characters,
- commas at the end of fields are optional,
- comma after last element in list is allowed,
- outer curly braces are optional.

JSON objects are called structs in CUE.
An object member is called a field.

{{< columns >}}

``` {title="json.cue"}
one: 1
two: 2

// A field using quotes.
"two-and-a-half": 2.5

list: [
	1,
	2,
	3,
]
```
{{< columns-separator >}}

```{title="$cue export json.cue"}
{
    "list": [
        1,
        2,
        3
    ],
    "one": 1,
    "two": 2,
    "two-and-a-half": 2.5
}
```

{{< /columns >}}
