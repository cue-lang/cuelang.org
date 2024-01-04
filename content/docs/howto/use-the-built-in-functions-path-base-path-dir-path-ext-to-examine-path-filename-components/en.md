---
title: Using the built-in functions "path.Base", "path.Dir", and "path.Ext" to examine path and filename components
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the built-in functions
[`path.Base`](https://pkg.go.dev/cuelang.org/go/pkg/path#Base),
[`path.Dir`](https://pkg.go.dev/cuelang.org/go/pkg/path#Dir), and
[`path.Ext`](https://pkg.go.dev/cuelang.org/go/pkg/path#Ext)
to access components of a file's name and its path.

{{{with code "en" "cc"}}}
# eval is used so the output's leaf values are horizontally aligned, allowing
# the user to more easily compare "Path" and "Dir" values visually
exec cue eval
cmp stdout out
-- file.cue --
package example

import "path"

unixAbsolutePath: {
	Path: "/foo/bar/baz.js"
	Dir:  path.Dir("/foo/baz/baz.js", path.Unix)
	Base: path.Base("/foo/baz/baz.js", path.Unix)
	Ext:  path.Ext("/foo/baz/baz.js", path.Unix)
}

unixDirectoryTraversal: {
	Path: "foo/bar/../quux/a.js"
	Dir:  path.Dir(Path, path.Unix)
	Base: path.Base(Path, path.Unix)
	Ext:  path.Ext(Path, path.Unix)
}

unixDirtyPath: {
	Path: "/foo///bar////baz.js"
	Dir:  path.Dir(Path, path.Unix)
	Base: path.Base(Path, path.Unix)
	Ext:  path.Ext(Path, path.Unix)
}

windowsAbsolutePath: {
	Path: #"C:\foo\bar\baz.js"#
	Dir:  path.Dir(Path, path.Windows)
	Base: path.Base(Path, path.Windows)
	Ext:  path.Ext(Path, path.Windows)
}

windowsDirectoryTraversal: {
	Path: #"C:\foo\bar\..\quux\a.js"#
	Dir:  path.Dir(Path, path.Windows)
	Base: path.Base(Path, path.Windows)
	Ext:  path.Ext(Path, path.Windows)
}

windowsDirtyPath: {
	Path: #"C:\foo\\bar\\\baz.js"#
	Dir:  path.Dir(Path, path.Windows)
	Base: path.Base(Path, path.Windows)
	Ext:  path.Ext(Path, path.Windows)
}
-- out --
unixAbsolutePath: {
    Path: "/foo/bar/baz.js"
    Dir:  "/foo/baz"
    Base: "baz.js"
    Ext:  ".js"
}
unixDirectoryTraversal: {
    Path: "foo/bar/../quux/a.js"
    Dir:  "foo/quux"
    Base: "a.js"
    Ext:  ".js"
}
unixDirtyPath: {
    Path: "/foo///bar////baz.js"
    Dir:  "/foo/bar"
    Base: "baz.js"
    Ext:  ".js"
}
windowsAbsolutePath: {
    Path: "C:\\foo\\bar\\baz.js"
    Dir:  "C:\\foo\\bar"
    Base: "baz.js"
    Ext:  ".js"
}
windowsDirectoryTraversal: {
    Path: "C:\\foo\\bar\\..\\quux\\a.js"
    Dir:  "C:\\foo\\quux"
    Base: "a.js"
    Ext:  ".js"
}
windowsDirtyPath: {
    Path: "C:\\foo\\\\bar\\\\\\baz.js"
    Dir:  "C:\\foo\\bar"
    Base: "baz.js"
    Ext:  ".js"
}
{{{end}}}

## Related content

- The [`path`](https://pkg.go.dev/cuelang.org/go/pkg/path) built-in package
  documentation details the rules that each of the functions
  [`path.Base`](https://pkg.go.dev/cuelang.org/go@v0.7.0/pkg/path#Base),
  [`path.Dir`](https://pkg.go.dev/cuelang.org/go@v0.7.0/pkg/path#Dir), and
  [`path.Ext`](https://pkg.go.dev/cuelang.org/go@v0.7.0/pkg/path#Ext) follow
  as they process their input
- Using CUE's ["raw" strings]({{< relref "docs/tour/types/stringraw" >}}) is
  convenient when writing literal Windows paths. They avoid having to escape
  every backslash (`\\`), as is demonstrated in the Windows-related examples
  above.
