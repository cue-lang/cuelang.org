---
title: Ensure lists have no duplicate items
weight:
draft: false
toc_hide: true
tags:
    - Language
---

In CUE, you often will work with lists of all sorts of values. To ensure a list
has no duplicate items, use
[list.UniqueItems](https://pkg.go.dev/cuelang.org/go/pkg/list#UniqueItems).

## Strings

```{title="CUE"}
import "list"

items: ["a", "b", "c", "a"]
items: list.UniqueItems
```

## Integers

```{title="CUE"}

import "list"

items: [1, 2, 3, 1]
items: list.UniqueItems
```

{{< warning >}}
Note that this approach does not work correctly on non-integer values.
See [issue 2192](https://github.com/cue-lang/cue/issues/2192)
for details.
{{< /warning >}}

## Structs

A common issue is we have a list of structs, each with some key that must be
unique across all items in the list.

To ensure a list of structs has no duplicate keys, one common approach is to
guarantee that the list has no duplicate items by constructing the list from a
map.

```txt {title="CUE", hl_lines=["5"]}
_items: {
	joe: age: 30
	alice: age: 35
}
_items: [name=string]: "name": name

items: [
	for item in _items {
		item
	}
]
```

If the list must be constrained directly, you can write an auxiliary field that
creates a mapping from the keys

```txt {title="CUE", hl_lines=["15"]}
items: [
	{
		name: "joe"
		age: 30
	},
	{
		name: "alice"
		age: 35
	},
	{
		name: "joe"
		age: 31
	}
]
_itemsCheck: {
	for i, item in items {
		(item.name): i
	}
}
```

If the key is specified twice, there will be a conflict in `_itemsCheck`.

### Ensuring multiple keys to have no duplicates

If there are multiple keys that together must be unique, a similar approach can
be used, using
[`json.Marshal`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json)  to form a
composite string key from the keys. Here, for example, the combination of `name`
and `dateOfBirth` must be unique:

```txt {title=CUE, hl_lines=["27"]}
import "encoding/json"

items: [
	{
		name: "joe"
		dateOfBirth: "1983-10-21"
		country: "US"
	},
	{
		name: "alice"
		dateOfBirth: "1987-10-15"
		country: "DE"
	},
	{
		name: "joe"
		dateOfBirth: "2010-02-05"
		country: "UK"
	},
	{
		name: "alice"
		dateOfBirth: "1987-10-15"
		country: "BE"
	},
]
_itemsCheck: {
	for i, item in items {
		(json.Marshal([item.name, item.dateOfBirth])): i
	}
}
```
