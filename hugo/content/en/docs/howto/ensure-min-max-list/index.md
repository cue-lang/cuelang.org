---
title: Require min or max items in a list
weight:
draft: false
tags:
    - Language
---

## Min
There are two common patterns to ensure a list has a minimum number of items.
When the number of required items is small and known in advance, use
the core language syntax:

```
field: [_, _, ...]
```
When the number of required items is larger or not known in advance, use the [list.MinItems](https://pkg.go.dev/cuelang.org/go/pkg/list#MinItems):

```
import "list"

field1: list.MinItems(10)
```

## Max

To require your list to have a maximum number of items, use [list.MaxItems](https://pkg.go.dev/cuelang.org/go/pkg/list#MaxItems):

```
import "list"

field: list.MaxItems(10)
field: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
```
