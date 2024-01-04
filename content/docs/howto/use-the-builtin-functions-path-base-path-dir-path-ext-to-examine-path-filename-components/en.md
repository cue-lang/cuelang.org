---
title: Using the builtin functions "path.Base", "path.Dir", and "path.Ext" to examine path and filename components
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the builtin functions `path.Base`, `path.Dir`, and
`path.Ext` to access components of a file's name and its path.

{{{with code "en" "cc"}}}
# eval is used so the output's leaf values are horizontally aligned, allowing
# the user to more easily compare "Path" and "Dir" values visually
exec cue eval -e output
cmp stdout out
-- file.cue --
package example

import "path"

output: unix: fileAbsolutePath: {
	Path: "/foo/bar/baz.js"

	// path.Dir, path.Base and path.Ext need
	// to be told their input path's OS type,
	// via their 2nd parameter

	// path.Dir emits every component of the
	// path's directory
	Dir: path.Dir(Path, path.Unix)

	// path.Base emits the path's final
	// component, regardless of if it
	// represents a file or a directory
	Base: path.Base(Path, path.Unix)

	// path.Ext emits the path's filename
	// extension, but *only* if the path
	// represents a file
	Ext: path.Ext(Path, path.Unix)
}

examples: unix: {
	fileAbsolutePath: "/foo/bar/baz.js"
	fileRelativePath: "bar/baz.js.backup"
	fileNoExtension:  "/foo/bar/baz"
	dirAbsolutePath:  "/foo/bar/baz/"
	dirWithExtension: "/foo/bar/baz.dir/"
	dirWithTraversal: "/foo/bar/../quux/a.js"
	fileDirtyPath:    "/foo///bar////baz.js"
}
examples: windows: {
	fileAbsolutePath: #"C:\foo\bar\baz.js"#
	fileRelativePath: #"bar\baz.js.backup"#
	fileNoExtension:  #"C:\foo\bar\baz"#
	dirAbsolutePath:  #"C:\foo\bar\baz\"#
	dirWithExtension: #"C:\foo\bar\baz.dir\"#
	dirWithTraversal: #"C:\foo\bar\..\quux\a.js"#
	fileDirtyPath:    #"C:\foo\\bar\\\baz.js"#
}

output: unix: {for _id, _path in examples.unix {(_id): {
	Path: _path
	Dir:  path.Dir(_path, path.Unix)
	Base: path.Base(_path, path.Unix)
	Ext:  path.Ext(_path, path.Unix)
}}}
output: windows: {for _id, _path in examples.windows {(_id): {
	Path: _path
	Dir:  path.Dir(_path, path.Windows)
	Base: path.Base(_path, path.Windows)
	Ext:  path.Ext(_path, path.Windows)
}}}
-- out --
unix: {
    fileAbsolutePath: {
        Path: "/foo/bar/baz.js"
        Dir:  "/foo/bar"
        Base: "baz.js"
        Ext:  ".js"
    }
    fileRelativePath: {
        Path: "bar/baz.js.backup"
        Dir:  "bar"
        Base: "baz.js.backup"
        Ext:  ".backup"
    }
    fileNoExtension: {
        Path: "/foo/bar/baz"
        Dir:  "/foo/bar"
        Base: "baz"
        Ext:  ""
    }
    dirAbsolutePath: {
        Path: "/foo/bar/baz/"
        Dir:  "/foo/bar/baz"
        Base: "baz"
        Ext:  ""
    }
    dirWithExtension: {
        Path: "/foo/bar/baz.dir/"
        Dir:  "/foo/bar/baz.dir"
        Base: "baz.dir"
        Ext:  ""
    }
    dirWithTraversal: {
        Path: "/foo/bar/../quux/a.js"
        Dir:  "/foo/quux"
        Base: "a.js"
        Ext:  ".js"
    }
    fileDirtyPath: {
        Path: "/foo///bar////baz.js"
        Dir:  "/foo/bar"
        Base: "baz.js"
        Ext:  ".js"
    }
}
windows: {
    fileAbsolutePath: {
        Path: "C:\\foo\\bar\\baz.js"
        Dir:  "C:\\foo\\bar"
        Base: "baz.js"
        Ext:  ".js"
    }
    fileRelativePath: {
        Path: "bar\\baz.js.backup"
        Dir:  "bar"
        Base: "baz.js.backup"
        Ext:  ".backup"
    }
    fileNoExtension: {
        Path: "C:\\foo\\bar\\baz"
        Dir:  "C:\\foo\\bar"
        Base: "baz"
        Ext:  ""
    }
    dirAbsolutePath: {
        Path: "C:\\foo\\bar\\baz\\"
        Dir:  "C:\\foo\\bar\\baz"
        Base: "baz"
        Ext:  ""
    }
    dirWithExtension: {
        Path: "C:\\foo\\bar\\baz.dir\\"
        Dir:  "C:\\foo\\bar\\baz.dir"
        Base: "baz.dir"
        Ext:  ""
    }
    dirWithTraversal: {
        Path: "C:\\foo\\bar\\..\\quux\\a.js"
        Dir:  "C:\\foo\\quux"
        Base: "a.js"
        Ext:  ".js"
    }
    fileDirtyPath: {
        Path: "C:\\foo\\\\bar\\\\\\baz.js"
        Dir:  "C:\\foo\\bar"
        Base: "baz.js"
        Ext:  ".js"
    }
}
{{{end}}}

## Related content

- The [`path`](https://pkg.go.dev/cuelang.org/go/pkg/path) builtin package
  documentation details the rules that each of the functions
  [`path.Base`](https://pkg.go.dev/cuelang.org/go@v0.7.0/pkg/path#Base),
  [`path.Dir`](https://pkg.go.dev/cuelang.org/go@v0.7.0/pkg/path#Dir), and
  [`path.Ext`](https://pkg.go.dev/cuelang.org/go@v0.7.0/pkg/path#Ext) follow
  as they process their input
- Using CUE's ["raw" strings]({{< relref "docs/tour/types/stringraw" >}}) is
  convenient when writing literal Windows paths. They avoid having to escape
  every backslash (`\\`) - as is demonstrated above in the `examples.windows`
  struct inside `file.cue`
