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

{{{with upload "en" "eval 1"}}}
#location left right
-- A.cue --
package example

A: 1
-- B.cue --
package example

B: A + 1
{{{end}}}

{{{with script "en" "eval 1"}}}
# CUE's behaviour when no symlinks are involved:
cue export --out cue .:example
# We move one CUE file aside, and symlink it back into the same place:
mv A.cue another.file.name
ln -s another.file.name A.cue
# CUE's behaviour when a symlink is involved:
cue export --out cue .:example
{{{end}}}
{{{with _script_ "en" "eval 1 tidyup"}}}
rm A.cue B.cue another.file.name
{{{end}}}

### Directories can be symlinks

If a symlink's target is a directory, it is included in evaluations that
involve the symlink:

{{{with upload "en" "eval 2"}}}
#location left right
-- example.cue --
package example

import "cue.example/foo:bar"

A: bar.B + 1
-- bar/bar.cue --
package bar

B: 1
{{{end}}}

{{{with script "en" "eval 2"}}}
# We initialise a module (required to use imports):
cue mod init cue.example
# We place a symlink at the path "foo", linking to the directory "bar":
ln -s bar foo
# CUE's behaviour now that a symlink'd directory is involved:
cue export --out cue .:example
{{{end}}}
{{{with _script_ "en" "eval 2 tidyup"}}}
rm -rf cue.mod foo bar example.cue
{{{end}}}

### Embedded files can be symlinks

If a file that's embedded in CUE code using the experimental
[`@embed()` attribute]({{< relref "/docs/howto/embed-files-in-cue-evaluation" >}})
is a symlink, then the contents of the link target gets embedded:
  
{{{with upload "en" "eval 3"}}}
#location left right
-- example.cue --
@extern(embed)

package example

A: _ @embed(file=example.json)
-- example.json --
{
    "B": 1
}
{{{end}}}

{{{with script "en" "eval 3"}}}
# We enable the file embed experiment:
export CUE_EXPERIMENT=embed
# We initialize a module (required to use file embedding):
cue mod init
# CUE's behaviour when no symlinks are involved:
cue export --out cue .:example
# We move one JSON file aside, and symlink it back into the same place:
mv example.json another.file.name
ln -s another.file.name example.json
# CUE's behaviour when a symlink is involved:
cue export --out cue .:example
{{{end}}}
{{{with _script_ "en" "eval 3 tidyup"}}}
rm -rf cue.mod example.* another.file.name
unset CUE_EXPERIMENT
{{{end}}}

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

{{{with upload "en" "eval 4"}}}
-- some_tool.cue --
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
{{{end}}}

{{{with script "en" "eval 4"}}}
# The cue command's behaviour when asked to export the contents of a package containing
# only workflow command files:
! cue eval
# We symlink to a workflow command file using a non-workflow-command file name:
ln -s some_tool.cue debug.cue
# The cue command's behaviour now that the package contains a non-workflow-command file:
cue eval
{{{end}}}
{{{with _script_ "en" "eval 4 tidyup"}}}
rm -rf some_tool.cue debug.cue
{{{end}}}
