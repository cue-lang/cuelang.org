---
title: Symbolic link support in CUE
author: [jpluscplusm]
toc_hide: false
---

Both the `cue` command and the CUE Go API support
[symbolic links](https://en.wikipedia.org/wiki/Symbolic_link)
("symlinks") on operating systems where the feature is available. However there
are some specific situations where symlinks aren't respected. This guide
answers some common questions about CUE's support for symlinks.

## Does CUE support symlinks?

Yes, CUE allows and respects filesystem symlinks **except that they are
rejected and ignored whenever they become the contents of a CUE module stored
in a module registry.**

## When does CUE *not* support symlinks?

CUE doesn't support filesystem symlinks in these two specific situations:

- if you publish a module containing a symlink to a registry (using `cue mod
  publish`), the module will be published but the symlink will not be included
  in the module
- if you add a dependency on a module that needs to be fetched from a registry,
  then any symlinks present in the module will not be written to disk and
  included in the module's local representation.

## How does CUE support symlinks?

These rules mentioned above mean that all the following scenarios allow and
respect symlinks, so long as the modules containing the symlinks are authored
locally and aren't fetched from a registry.

### Files can be symlinks

If a `.cue` file is a symlink, the target of the link is included in
evaluations that involve the symlink:

{{< code-tabs >}}
{{< code-tab name="A.cue" language="cue" area="left" >}}
package example

A: 1
{{< /code-tab >}}{{< code-tab name="B.cue" language="cue" area="right" >}}
package example

B: A + 1
{{< /code-tab >}}{{< /code-tabs >}}

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtLW91dCBjdWUgLjpleGFtcGxlCm12IEEuY3VlIGFub3RoZXIuZmlsZS5uYW1lCmxuIC1zIGFub3RoZXIuZmlsZS5uYW1lIEEuY3VlCmN1ZSBleHBvcnQgLS1vdXQgY3VlIC46ZXhhbXBsZQ==" }
# CUE's behaviour when no symlinks are involved:
$ cue export --out cue .:example
A: 1
B: 2

# We move one CUE file aside, and symlink it back into the same place:
$ mv A.cue another.file.name
$ ln -s another.file.name A.cue

# CUE's behaviour when a symlink is involved:
$ cue export --out cue .:example
A: 1
B: 2
```
### Directories can be symlinks

If a symlink's target is a directory, it is included in evaluations that
involve the symlink:

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="left" >}}
package example

import "cue.example/foo:bar"

A: bar.B + 1
{{< /code-tab >}}{{< code-tab name="bar/bar.cue" language="cue" area="right" >}}
package bar

B: 1
{{< /code-tab >}}{{< /code-tabs >}}

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IGN1ZS5leGFtcGxlCmxuIC1zIGJhciBmb28KY3VlIGV4cG9ydCAtLW91dCBjdWUgLjpleGFtcGxl" }
# We initialise a module (required to use imports):
$ cue mod init cue.example

# We place a symlink at the path "foo", linking to the directory "bar":
$ ln -s bar foo

# CUE's behaviour now that a symlink'd directory is involved:
$ cue export --out cue .:example
A: 2
```
### Embedded files can be symlinks

If a file that's embedded in CUE code using the experimental
[`@embed()` attribute]({{< relref "/docs/howto/embed-files-in-cue-evaluation" >}})
is a symlink, then the contents of the link target gets embedded:
  
{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="left" >}}
@extern(embed)

package example

A: _ @embed(file=example.json)
{{< /code-tab >}}{{< code-tab name="example.json" language="json" area="right" >}}
{
    "B": 1
}
{{< /code-tab >}}{{< /code-tabs >}}

```text { title="TERMINAL" type="terminal" codeToCopy="ZXhwb3J0IENVRV9FWFBFUklNRU5UPWVtYmVkCmN1ZSBtb2QgaW5pdApjdWUgZXhwb3J0IC0tb3V0IGN1ZSAuOmV4YW1wbGUKbXYgZXhhbXBsZS5qc29uIGFub3RoZXIuZmlsZS5uYW1lCmxuIC1zIGFub3RoZXIuZmlsZS5uYW1lIGV4YW1wbGUuanNvbgpjdWUgZXhwb3J0IC0tb3V0IGN1ZSAuOmV4YW1wbGU=" }
# We enable the file embed experiment:
$ export CUE_EXPERIMENT=embed

# We initialize a module (required to use file embedding):
$ cue mod init

# CUE's behaviour when no symlinks are involved:
$ cue export --out cue .:example
A: B: 1

# We move one JSON file aside, and symlink it back into the same place:
$ mv example.json another.file.name
$ ln -s another.file.name example.json

# CUE's behaviour when a symlink is involved:
$ cue export --out cue .:example
A: B: 1
```
As with all behaviours mentioned on this page, the above example only works
when the module containing the file that uses `@embed()` is authored locally,
and has not been fetched from a module registry.

### Symlinks can help debug workflow commands

The `cue` command only processes the contents of files containing CUE
[workflow commands]({{< relref "docs/howto/use-your-first-cue-workflow-command" >}})
when it is invoked as
[`cue cmd`]({{< relref "docs/reference/command/cue-help-cmd" >}}).
However it can sometimes be useful to see how other `cue` commands (such as
`cue eval`) evaluate these files' contents - for instance, when debugging
workflow commands. By temporarily setting up a symlink, other `cue` commands
can be given visbility into the contents of a workflow command `_tool.cue`
file:

{{< code-tabs >}}
{{< code-tab name="some_tool.cue" language="cue" area="top-left" >}}
package example

import "tool/exec"

name: *"everyone" | string @tag(who)
city: "Kinshasa"

// The "hello" command welcomes people to a place.
command: hello: {
	// The command contains a single task.
	print: exec.Run & {
		cmd: "echo Hey \(name), welcome to \(city)!"
	}
}
{{< /code-tab >}}{{< /code-tabs >}}

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV2YWwKbG4gLXMgc29tZV90b29sLmN1ZSBkZWJ1Zy5jdWUKY3VlIGV2YWw=" }
# The cue command's behaviour when asked to export the contents of a package containing
# only workflow command files:
$ cue eval
build constraints exclude all CUE files in .:
    some_tool.cue: _tool.cue files excluded in non-cmd mode

# We symlink to a workflow command file using a non-workflow-command file name:
$ ln -s some_tool.cue debug.cue

# The cue command's behaviour now that the package contains a non-workflow-command file:
$ cue eval
name: "everyone"
city: "Kinshasa"
command: {
    hello: {
        print: {
            $id: "tool/exec.Run"
            cmd: "echo Hey everyone, welcome to Kinshasa!"
            env: {} | []
            stdout:      null
            stderr:      null
            stdin:       null
            success:     bool
            mustSucceed: true
        }
    }
}
```
