---
title: Updating CUE imports after reorganising packages
toc_hide: true
authors: [jpluscplusm]
tags: [modules]
---

This guide demonstrates how to use the
[`cue refactor imports`]({{<relref"docs/reference/command/cue-help-refactor-imports">}})
command to update CUE files when a hierarchy of imported packages changes location.

The `cue refactor imports` command is not yet available in the latest CUE release.
This page demonstrates the following version of CUE, which can be
[installed from source]({{<relref"docs/introduction/installation/#install-from-source">}}):
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.13.0-0.dev.0.20250225142354-26a698fe9ae9
...
```

{{< step stepNumber="1" >}}
Throughout the example demonstrated on this page we'll be working with CUE
that lives inside this module:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IGN1ZS5leGFtcGxlL3JlZmFjdG9yLWltcG9ydHM=" }
$ cue mod init cue.example/refactor-imports
```
You may already have your own CUE, inside its own module. Don't forget to
update the example commands shown below, so that they reflect your module's path.
{{< /step >}}

{{< step stepNumber="2" >}}
When a CUE file uses the contents of some other package, it needs to refer to
that other package by its import path, in an `import` declaration at the top of
the file:
{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="top-left" >}}
package example

import "cue.example/refactor-imports/alpha/foo"

meta: foo.metadata
{{< /code-tab >}}{{< /code-tabs >}}
In this example, the package being imported lives in the same module as the
package doing the importing, but that isn't a requirement for the `cue refactor
imports` command to work as shown on this page. The command works no matter the
location of the imported package: in the same module, or in some other module
that's fetched from a registry.

Here's the contents of our example imported package, and another package that it imports:
{{< code-tabs >}}
{{< code-tab name="alpha/foo/metadata.cue" language="cue" area="left" >}}
package foo

import b "cue.example/refactor-imports/alpha/bar"

metadata: {
	id:      "foo"
	release: "4.2.0"
	bar:     b.metadata
}
{{< /code-tab >}}{{< code-tab name="alpha/bar/metadata.cue" language="cue" area="right" >}}
package bar

metadata: {
	id:      "bar"
	release: "1.2.3"
}
{{< /code-tab >}}{{< /code-tabs >}}
{{< /step >}}

{{< step stepNumber="3" >}}
Let's start by checking that a `cue export` of the top level `example` package currently succeeds:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1s" }
$ cue export --out yaml
meta:
  id: foo
  release: 4.2.0
  bar:
    id: bar
    release: 1.2.3
```
{{< /step >}}

{{< step stepNumber="4" >}}
Now (for some reason) we decide that the whole of the `alpha` hierarchy needs
to be reorganised -- by moving it to `beta`:
```text { title="TERMINAL" type="terminal" codeToCopy="bXYgLXYgYWxwaGEgYmV0YQ==" }
$ mv -v alpha beta
renamed 'alpha' -> 'beta'
```
{{< /step >}}

{{< step stepNumber="5" >}}
After the package hierarchy is moved, the `cue export` command starts to fails:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1s" }
$ cue export --out yaml
cue.example/refactor-imports@v0: import failed: cannot find package "cue.example/refactor-imports/alpha/foo": cannot find module providing package cue.example/refactor-imports/alpha/foo:
    ./example.cue:3:8
```
{{< /step >}}

{{< step stepNumber="6" >}}
We could edit and update all our CUE manually, but at any significant scale that would get *really* boring.

The `cue refactor imports` command performs this update for us, quickly and easily:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHJlZmFjdG9yIGltcG9ydHMgY3VlLmV4YW1wbGUvcmVmYWN0b3ItaW1wb3J0cy9hbHBoYSBjdWUuZXhhbXBsZS9yZWZhY3Rvci1pbXBvcnRzL2JldGE=" }
$ cue refactor imports cue.example/refactor-imports/alpha cue.example/refactor-imports/beta
```
The command examines all CUE across the whole of the module, and rewrites any
`import` statements that *begin* with its first parameter. Their new, replacement prefix is
given by the command's second parameter.
{{< /step >}}

{{< step stepNumber="7" >}}
Here's the updated contents of our `example` package and its dependency:
{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="left" >}}
package example

import "cue.example/refactor-imports/beta/foo"

meta: foo.metadata
{{< /code-tab >}}{{< code-tab name="beta/foo/metadata.cue" language="cue" area="right" >}}
package foo

import b "cue.example/refactor-imports/beta/bar"

metadata: {
	id:      "foo"
	release: "4.2.0"
	bar:     b.metadata
}
{{< /code-tab >}}{{< /code-tabs >}}
Notice how `cue refactor imports` updated both `import` declarations that
referenced the old `alpha` prefix.
{{< /step >}}

{{< step stepNumber="8" >}}
The `cue export` command succeeds again:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1s" }
$ cue export --out yaml
meta:
  id: foo
  release: 4.2.0
  bar:
    id: bar
    release: 1.2.3
```
{{< /step >}}

In this guide we used the `cue refactor imports` command to process the
relocation of an entire package hierarchy. The command can also work in a more
targeted mode -- with the `--exact` flag. See
`{{<linkto/inline"reference/command/cue-help-refactor-imports">}}`
for more information about `--exact`, and other ways the command can rewrite
CUE for you.

## Related content

- {{<linkto/related/reference"command/cue-help-refactor-imports">}}
