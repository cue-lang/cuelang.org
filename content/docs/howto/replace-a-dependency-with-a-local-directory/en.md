---
title: Replacing a dependency with a local directory
toc_hide: true
tags: [modules]
authors: [rogpeppe]
---

{{<sidenote text="Requires CUE v0.17.0 or later">}}

{{{with _script_ "en" "HIDDEN: pin CUE version"}}}
export PATH=/cues/$CUELANG_CUE_TIP:$PATH
{{{end}}}

This guide demonstrates how to use
[module replace]({{<relref "docs/reference/modules#local-module-file">}})
to point one of your module's dependencies at a local directory, so that you
can develop the dependency and the module that consumes it side by side without
publishing the dependency first.

<!--more-->

Module replaces are written to a
[`cue.mod/local-module.cue`]({{<relref "docs/reference/modules#local-module-file">}})
file. This file holds development-time configuration only: it is never part of
a published module, so a replacement you add here cannot leak into the version
of your module that others consume.

{{{with step}}}
Start with a module that depends on, and imports, another module --
`example.com/greeting@v0`:

{{{with upload "en" "create hello module"}}}
-- cue.mod/module.cue --
module: "app.example/hello@v0"
language: version: "v0.17.0"
deps: {
	"example.com/greeting@v0": {
		v: "v0.1.0"
	}
}
-- hello.cue --
package hello

import "example.com/greeting@v0:greeting"

message: greeting.message
{{{end}}}

Ordinarily `cue` would fetch `example.com/greeting@v0` from a registry. In this
guide we will instead point it at a local checkout that we are editing.
{{{end}}}

{{{with step}}}
Create that local checkout. It is an ordinary module directory, complete with
its own `cue.mod/module.cue` file, holding the in-progress version of the
dependency:

{{{with upload "en" "create local greeting checkout"}}}
-- greeting/cue.mod/module.cue --
module: "example.com/greeting@v0"
language: version: "v0.17.0"
-- greeting/greeting.cue --
package greeting

message: "Hello from my local checkout"
{{{end}}}
{{{end}}}

{{{with step}}}
Add a module replace that substitutes the local `./greeting` directory for
the `example.com/greeting@v0` dependency, using
[`cue mod edit`]({{<relref "docs/reference/command/cue-help-mod-edit">}}):

{{{with script "en" "add replace"}}}
cue mod edit --replace example.com/greeting@v0=./greeting
{{{end}}}

This creates a `cue.mod/local-module.cue` file holding the module replace:

{{{with script "en" "show local-module.cue"}}}
cat cue.mod/local-module.cue
{{{end}}}

Your `cue.mod/module.cue` file is left untouched, so the module's published
requirements are unaffected:

{{{with script "en" "show module.cue"}}}
cat cue.mod/module.cue
{{{end}}}
{{{end}}}

{{{with step}}}
Evaluating the module now uses the contents of the local `./greeting` directory
in place of the dependency:

{{{with script "en" "export with replace"}}}
cue export .
{{{end}}}

You can edit the files under `./greeting` and immediately see the effect on your
module, with no need to publish a new version of the dependency.
{{{end}}}

{{{with step}}}
When you are finished, remove the module replace again with `--drop-replace`:

{{{with script "en" "drop replace"}}}
cue mod edit --drop-replace example.com/greeting@v0
{{{end}}}

Because it held the only module replace, the `cue.mod/local-module.cue` file
is removed entirely, leaving just `cue.mod/module.cue`:

{{{with script "en" "show cue.mod contents"}}}
ls cue.mod
{{{end}}}
{{{end}}}

The replacement does not have to be a local directory. A replacement value that
is a module path with a version -- for example
`example.com/greeting-fork@v0.1.0` -- substitutes that module version for the
dependency instead, which is useful for testing against a fork. See the
[`cue.mod/local-module.cue` files]({{<relref "docs/reference/modules#local-module-file">}})
reference for full details.

## Related content

- {{<linkto/related/reference"modules">}}
- {{<linkto/related/reference"command/cue-help-mod-edit">}}
- {{<linkto/related/reference"command/cue-help-mod-tidy">}}
