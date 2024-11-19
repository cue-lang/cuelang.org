---
title: Symbolic link support in CUE
author: [jpluscplusm]
toc_hide: false
---

Both the `cue` command and the CUE Go API support
[symbolic links](https://en.wikipedia.org/wiki/Symbolic_link)
("symlinks") on operating systems where the feature is available.
However, symlinks are rejected and ignored whenever they become the contents of
a CUE module stored in a module registry.

This guide answers some questions about CUE's support for symlinks.

## Can I use symlinks to help organise my CUE code?

**Yes**.
When writing your own CUE code you can rely on CUE to respect any filesystem
symlinks you put in place.
This includes establishing symlinks that create:

- CUE files (e.g. `file.cue` links to `some.other.file`)
- package directories (e.g. `foo/` links to `bar/`)
- data files that are included via the
  [`@embed()` attribute]({{< relref "/docs/howto/embed-files-in-cue-evaluation" >}})
  (e.g. `data.json` links to `../../../some.data`)

## Can I include symlinks when publishing a CUE module?

**No**.
When the `cue mod publish` command publishes a module to a registry,
it silently ignores any symlinks contained in the module.
Any symlinks are left in place locally (on the computer that publishes the
module) but they will not be present in the published module.

## Can I depend on a CUE module that relies on symlinks?

**No**.
When the `cue` command fetches and unpacks a module from a registry, it
doesn't create any symlinks that it finds in the module.
If any CUE contained in a module relies on the presence of symlinks to work
correctly then it will not work as expected after being unpacked.
CUE's exact behaviour when processing symlinks in published modules is system-
and release-dependent, but a working symlink will not be created in any case.

This is done separately from `cue mod publish` ignoring symlinks when
*publishing* modules because CUE uses industry-standard
[OCI registries]({{< relref "docs/reference/modules" >}}#modules-overview)
to store modules, and CUE cannot be certain that the `cue` command was used to
publish the module artifact being fetched.
Therefore, even if a published module somehow contains symlinks, those links
will not be usable by any consumer of the module.
