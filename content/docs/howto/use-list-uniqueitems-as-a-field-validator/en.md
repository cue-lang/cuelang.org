---
title: Using "list.UniqueItems" as a field validator
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the built-in function
[`list.UniqueItems`](https://pkg.go.dev/cuelang.org/go/pkg/list#UniqueItems)
to ensure that a list's items are unique.

{{{with code "en" "cc"}}}
#location top bottom

! exec cue vet
cmp stderr out
-- file.cue --
package example

import "list"

aList: list.UniqueItems
aList: [1, 2.0, 3, "four", 5, 5.0, false,
	{a: 1, b: "2", c: false}, // validation error
	{a: 1, b: "2", c: true},
	{a: 1, b: 2, c: false},
	{a: 1, b: "2", c: false}, // validation error
]
-- out --
aList: invalid value [1,2.0,3,"four",5,5.0,false,{a:1,b:"2",c:false},{a:1,b:"2",c:true},{a:1,b:2,c:false},{a:1,b:"2",c:false}] (does not satisfy list.UniqueItems):
    ./file.cue:5:8
    ./file.cue:6:8
{{{end}}}

{{< info >}}
[Issue #49](https://github.com/cue-lang/docs-and-content/issues/49) tracks the
documentation of precisely what CUE means by values being "equivalent",
"equal", or "comparable". When this documentation is complete it will be linked
to from this guide.
{{< /info >}}

## Related content

- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
