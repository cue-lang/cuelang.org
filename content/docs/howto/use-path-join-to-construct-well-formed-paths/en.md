---
title: Using "path.Join" to construct well-formed paths
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the built-in function
[`path.Join`](https://pkg.go.dev/cuelang.org/go/pkg/path#Join)
to construct well-formed paths from their individual string components.

{{{with code "en" "cc"}}}
exec cue export
cmp stdout out
-- file.cue --
package example

import "path"

join: path.Join(["foo", "bar", "baz"], path.Unix)

unix:    path.Join(_components, path.Unix)
windows: path.Join(_components, path.Windows)

_components: [
	"foo",
	"bar",
	"baz",
	"..",
	"quux",
]
-- out --
{
    "join": "foo/bar/baz",
    "unix": "foo/bar/quux",
    "windows": "foo\\bar\\quux"
}
{{{end}}}

## Related content

- The [`path`](https://pkg.go.dev/cuelang.org/go/pkg/path) built-in package
