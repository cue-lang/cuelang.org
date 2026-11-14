---
title: Replacing a dependency with a local directory
toc_hide: true
tags: [modules]
authors: [rogpeppe]
---

{{<sidenote text="Requires CUE v0.17.0 or later">}}

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

{{< step stepNumber="1" >}}
Start with a module that depends on, and imports, another module --
`example.com/greeting@v0`:

{{< code-tabs >}}
{{< code-tab name="cue.mod/module.cue" language="cue" area="top-left" >}}
module: "app.example/hello@v0"
language: version: "v0.17.0"
deps: {
	"example.com/greeting@v0": {
		v: "v0.1.0"
	}
}
{{< /code-tab >}}{{< code-tab name="hello.cue" language="cue" area="top-left" >}}
package hello

import "example.com/greeting@v0:greeting"

message: greeting.message
{{< /code-tab >}}{{< /code-tabs >}}

Ordinarily `cue` would fetch `example.com/greeting@v0` from a registry. In this
guide we will instead point it at a local checkout that we are editing.
{{< /step >}}

{{< step stepNumber="2" >}}
Create that local checkout. It is an ordinary module directory, complete with
its own `cue.mod/module.cue` file, holding the in-progress version of the
dependency:

{{< code-tabs >}}
{{< code-tab name="greeting/cue.mod/module.cue" language="cue" area="top-left" >}}
module: "example.com/greeting@v0"
language: version: "v0.17.0"
{{< /code-tab >}}{{< code-tab name="greeting/greeting.cue" language="cue" area="top-left" >}}
package greeting

message: "Hello from my local checkout"
{{< /code-tab >}}{{< /code-tabs >}}
{{< /step >}}

{{< step stepNumber="3" >}}
Add a module replace that substitutes the local `./greeting` directory for
the `example.com/greeting@v0` dependency, using
[`cue mod edit`]({{<relref "docs/reference/command/cue-help-mod-edit">}}):

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBlZGl0IC0tcmVwbGFjZSBleGFtcGxlLmNvbS9ncmVldGluZ0B2MD0uL2dyZWV0aW5n" }
$ cue mod edit --replace example.com/greeting@v0=./greeting
````

This creates a `cue.mod/local-module.cue` file holding the module replace:

````text { title="TERMINAL" type="terminal" codeToCopy="Y2F0IGN1ZS5tb2QvbG9jYWwtbW9kdWxlLmN1ZQ==" }
$ cat cue.mod/local-module.cue
deps: "example.com/greeting@v0": replaceWith: "./greeting"
````

Your `cue.mod/module.cue` file is left untouched, so the module's published
requirements are unaffected:

````text { title="TERMINAL" type="terminal" codeToCopy="Y2F0IGN1ZS5tb2QvbW9kdWxlLmN1ZQ==" }
$ cat cue.mod/module.cue
module: "app.example/hello@v0"
language: version: "v0.17.0"
deps: "example.com/greeting@v0": v: "v0.1.0"
````
{{< /step >}}

{{< step stepNumber="4" >}}
Evaluating the module now uses the contents of the local `./greeting` directory
in place of the dependency:

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAu" }
$ cue export .
{
    "message": "Hello from my local checkout"
}
````

You can edit the files under `./greeting` and immediately see the effect on your
module, with no need to publish a new version of the dependency.
{{< /step >}}

{{< step stepNumber="5" >}}
When you are finished, remove the module replace again with `--drop-replace`:

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBlZGl0IC0tZHJvcC1yZXBsYWNlIGV4YW1wbGUuY29tL2dyZWV0aW5nQHYw" }
$ cue mod edit --drop-replace example.com/greeting@v0
````

Because it held the only module replace, the `cue.mod/local-module.cue` file
is removed entirely, leaving just `cue.mod/module.cue`:

````text { title="TERMINAL" type="terminal" codeToCopy="bHMgY3VlLm1vZA==" }
$ ls cue.mod
module.cue
````
{{< /step >}}

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
