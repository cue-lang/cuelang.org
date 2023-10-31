---
title: "Packages"
weight: 1
---

A CUE file is a standalone file by default.
A `package` clause allows a single configuration to be split across multiple
files.

The configuration for a package is defined by the concatenation of all its
files, after stripping the package clauses and not considering imports.

Duplicate definitions are treated analogously to duplicate definitions within
the same file.
The order in which files are loaded is undefined, but any order will result
in the same outcome, given that order does not matter.

{{{with code "en" "package"}}}
exec cue eval a.cue b.cue
cmp stdout result.txt
-- a.cue --
package config

foo: 100
bar: int
-- b.cue --
package config

bar: 200
-- result.txt --
foo: 100
bar: 200
{{{end}}}
