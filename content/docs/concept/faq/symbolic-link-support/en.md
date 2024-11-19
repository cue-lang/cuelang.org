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

## How does CUE support symlinks?

CUE supports filesystem symlinks as you would hope and expect, except in these
two specific situations:

- if you publish a module containing a symlink to a registry (using `cue mod
  publish`), the module will be published but the symlink will not be included
  in the module
- if you add a dependency on a module that needs to be fetched from a registry,
  then any symlinks present in the module will not be written to disk and
  included in the module's local representation.

These rules mean that all the following scenarios allow and respect symlinks,
so long as the modules containing the symlinks are authored locally and aren't
fetched from a registry:

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

If symlink's target is a directory, it is included in evaluations that involve
the symlink:

{{{with upload "en" "eval 2"}}}
#location left right
-- example.cue --
package example

import "cue.example/foo:bar"

A: bar
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

If a file that's embedded in CUE code using the
[experimental `@embed()` attribute]({{< relref "/docs/howto/embed-files-in-cue-evaluation" >}})
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

