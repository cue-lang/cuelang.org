---
title: Symbolic link support in CUE
author: [jpluscplusm]
toc_hide: false
---

Both the `cue` command and the CUE Go API support
[symbolic links](https://en.wikipedia.org/wiki/Symbolic_link)
("symlinks") on operating systems where the feature is available.
However, symlinks are ignored when they are part of a CUE module published to
(or fetched from) a module registry.

This guide answers some questions about CUE's support for symlinks.

## Can I use symlinks to help organise my CUE code?

**Yes**.

When writing your own CUE code you can rely on CUE to respect any filesystem
symlinks you put in place.
This includes creating symlinks that point to:

- CUE code (e.g. `file.cue` points to `some.other.file`)
- package directories (e.g. `foo/` points to `bar/`)
- files that are included via the
  [`@embed()` attribute]({{< relref "/docs/howto/embed-files-in-cue-evaluation" >}})
  (e.g. `data.json` points to `../../../some.data`)

Symlinks can point to targets anywhere on your computer's filesystem and not
only files inside your CUE module.

## Can I include symlinks when publishing a CUE module?

**No**.

When the `cue mod publish` command publishes a module to a registry,
it silently ignores any symlinks contained in the module.
Any symlinks are left in place locally (on the computer that publishes the
module) but they will not be present in the published module.

## Can I depend on a CUE module that relies on symlinks?

**It depends**.

Your CUE code can have a dependency on any module that's published and
accessible, but when the `cue` command fetches and unpacks a module from a
registry it doesn't create any symlinks that it finds in the module.
CUE's behaviour when it finds symlinks in published modules is undefined,
but will never result in a working symlink being created.

This means that CUE packages in a published module that rely on the presence of
symlinks to work correctly will not behave as expected, after being fetched
from a registry.
Therefore: if your CUE code uses any such package, then your CUE may not work
as you expect.
