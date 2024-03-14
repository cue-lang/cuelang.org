---
title: Using "path.Base", "path.Dir", and "path.Ext" to examine path and filename components
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the built-in functions
[`path.Base`](https://pkg.go.dev/cuelang.org/go/pkg/path#Base),
[`path.Dir`](https://pkg.go.dev/cuelang.org/go/pkg/path#Dir), and
[`path.Ext`](https://pkg.go.dev/cuelang.org/go/pkg/path#Ext)
to access components of a file's name and its path.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

import "path"

[X=string]: {
	_OS: *path.Unix | path.Windows | path.Plan9
	Dir:  path.Dir(X, _OS)
	Base: path.Base(X, _OS)
	Ext:  path.Ext(X, _OS)
}

// Examples of absolute paths.
"/foo/bar/baz.js": _
#"C:\foo\bar\baz.js"#: _OS: path.Windows

// Examples of directory traversal.
"foo/bar/../quux/a.js": _
#"C:\foo\bar\..\quux\a.js"#: _OS: path.Windows

// Examples of empty path components.
"/foo///bar////baz.js": _
#"C:\foo\\bar\\\baz.js"#: _OS: path.Windows
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWw=" >}}
$ cue eval
"/foo/bar/baz.js": {
    Dir:  "/foo/bar"
    Base: "baz.js"
    Ext:  ".js"
}
"C:\\foo\\bar\\baz.js": {
    Dir:  "C:\\foo\\bar"
    Base: "baz.js"
    Ext:  ".js"
}
"foo/bar/../quux/a.js": {
    Dir:  "foo/quux"
    Base: "a.js"
    Ext:  ".js"
}
"C:\\foo\\bar\\..\\quux\\a.js": {
    Dir:  "C:\\foo\\quux"
    Base: "a.js"
    Ext:  ".js"
}
"/foo///bar////baz.js": {
    Dir:  "/foo/bar"
    Base: "baz.js"
    Ext:  ".js"
}
"C:\\foo\\\\bar\\\\\\baz.js": {
    Dir:  "C:\\foo\\bar"
    Base: "baz.js"
    Ext:  ".js"
}
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- The [`path`](https://pkg.go.dev/cuelang.org/go/pkg/path) built-in package
  documentation details the rules that each of the functions
  [`path.Base`](https://pkg.go.dev/cuelang.org/go/pkg/path#Base),
  [`path.Dir`](https://pkg.go.dev/cuelang.org/go/pkg/path#Dir), and
  [`path.Ext`](https://pkg.go.dev/cuelang.org/go/pkg/path#Ext) follow
  as they process their input
- Using CUE's ["raw" strings]({{< relref "docs/tour/types/stringraw" >}}) is
  convenient when writing literal Windows paths. They avoid having to escape
  every backslash (`\\`), as is demonstrated in the Windows-related examples
  above.
