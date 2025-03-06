---
title: Updating CUE imports after reorganising packages
toc_hide: true
authors: [jpluscplusm]
tags: [modules]
---

{{{with _script_ "en" "HIDDEN: access cue-refactor-imports command"}}}
export PATH=/cues/$CUELANG_CUE_TIP:$PATH
{{{end}}}

This guide demonstrates how to use the
[`cue refactor imports`]({{<relref"docs/reference/command/cue-help-refactor-imports">}})
command to update CUE files when a hierarchy of imported packages changes location.

The `cue refactor imports` command is not yet available in the latest CUE release.
This page demonstrates the following version of CUE, which can be
[installed from source]({{<relref"docs/introduction/installation/#install-from-source">}}):
{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
{{{end}}}

{{{with step}}}
Throughout the example demonstrated on this page we'll be working with CUE
that lives inside this module:
{{{with script "en" "cue mod init"}}}
cue mod init cue.example/refactor-imports
{{{end}}}
You may already have your own CUE, inside its own module. Don't forget to
update the example commands shown below, so that they reflect your module's path.
{{{end}}}

{{{with step}}}
When a CUE file uses the contents of some other package, it needs to refer to
that other package by its import path, in an `import` declaration at the top of
the file:
{{{with upload "en" "importing package"}}}
-- example.cue --
package example

import "cue.example/refactor-imports/alpha/foo"

meta: foo.metadata
{{{end}}}
In this example, the package being imported lives in the same module as the
package doing the importing, but that isn't a requirement for the `cue refactor
imports` command to work as shown on this page. The command works no matter the
location of the imported package: in the same module, or in some other module
that's fetched from a registry.

Here's the contents of our example imported package, and another package that it imports:
{{{with upload "en" "imported packages"}}}
#location left right
-- alpha/foo/metadata.cue --
package foo

import b "cue.example/refactor-imports/alpha/bar"

metadata: {
	id:      "foo"
	release: "4.2.0"
	bar:     b.metadata
}
-- alpha/bar/metadata.cue --
package bar

metadata: {
	id:      "bar"
	release: "1.2.3"
}
{{{end}}}
{{{end}}}

{{{with step}}}
Let's start by checking that a `cue export` of the top level `example` package currently succeeds:
{{{with script "en" "pre export"}}}
cue export --out yaml
{{{end}}}
{{{end}}}

{{{with step}}}
Now (for some reason) we decide that the whole of the `alpha` hierarchy needs
to be reorganised -- by moving it to `beta`:
{{{with script "en" "rename"}}}
mv -v alpha beta
{{{end}}}
{{{end}}}

{{{with step}}}
After the package hierarchy is moved, the `cue export` command starts to fails:
{{{with script "en" "post export fail"}}}
! cue export --out yaml
{{{end}}}
{{{end}}}

{{{with step}}}
We could edit and update all our CUE manually, but at any significant scale that would get *really* boring.

The `cue refactor imports` command performs this update for us, quickly and easily:
{{{with script "en" "cue refactor imports"}}}
cue refactor imports cue.example/refactor-imports/alpha cue.example/refactor-imports/beta
{{{end}}}
The command examines all CUE across the whole of the module, and rewrites any
`import` statements that *begin* with its first parameter. Their new, replacement prefix is
given by the command's second parameter.
{{{end}}}

{{{with step}}}
{{{with _script_ "en" "HIDDEN: move before diff"}}}
mv example.cue{,.got}
mv beta/foo/metadata.cue{,.got}
{{{end}}}
Here's the updated contents of our `example` package and its dependency:
{{{with upload "en" "updated packages"}}}
#location left right
-- example.cue --
package example

import "cue.example/refactor-imports/beta/foo"

meta: foo.metadata
-- beta/foo/metadata.cue --
package foo

import b "cue.example/refactor-imports/beta/bar"

metadata: {
	id:      "foo"
	release: "4.2.0"
	bar:     b.metadata
}
{{{end}}}
Notice how `cue refactor imports` updated both `import` declarations that
referenced the old `alpha` prefix.

{{{with _script_ "en" "HIDDEN: diff"}}}
diff example.cue{,.got}
diff beta/foo/metadata.cue{,.got}
{{{end}}}
{{{end}}}

{{{with step}}}
The `cue export` command succeeds again:
{{{with script "en" "post export pass"}}}
cue export --out yaml
{{{end}}}
{{{end}}}

In this guide we used the `cue refactor imports` command to process the
relocation of an entire package hierarchy. The command can also work in a more
targeted mode -- with the `--exact` flag. See
`{{<linkto/inline"reference/command/cue-help-refactor-imports">}}`
for more information about `--exact`, and other ways the command can rewrite
CUE for you.

## Related content

- {{<linkto/related/reference"command/cue-help-refactor-imports">}}
