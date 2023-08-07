---
title: How to import Kubernetes YAML configuration files into CUE
weight:
tags:
    - cue command
---

This guide shows you the process of importing a Kubernetes configuration spread
across several YAML files and directories into CUE, followed by the separate
process of exporting the configuration back into YAML for systems that can't
parse CUE. FIXME: prove round-trip-ability? FIXME: *do* we have the export process in here? If not, then ... what?

## Prerequisites

- You have [CUE installed](https://cuelang.org/docs/install/) locally. This
  allows you to run `cue` commands
- You have an existing set of YAML Kubernetes configuration files
  - This Guide assumes a layout similar to that of the
    [CUE Kubernetes tutorial](https://github.com/cue-lang/cue/tree/f681271a38ec9e13d3a4c7ed2641267f0aabaa75/doc/tutorial/kubernetes#the-given-data-set)
- *(optional)* You have a [git client installed](https://git-scm.com/downloads)
  to record and compare the state of your configuration files over time

## Steps

{{step}}
If your Kubernetes configuration files already exist within a git repository,
start with a clean state, on a known-good commit with no modified files.

If your config files are not yet version controlled, initialise a git
repository at the root of your configuration, and create a commit recording
their initial state:

```console
$ cd /path/to/root/of/configuration
$ git init .
Initialized empty Git repository in /path/to/root/of/configuration/.git/
$ git add .
[...]
$ git commit -m "Initial configuration state, before CUE"
```

{{step}}
If your configuration is not already part of a CUE modulue, initialise an
anonymous CUE module:

```console
$ cue mod init
```

{{step}}
Recursively import each YAML file into CUE. Store each configuration object at
a path derived from the object's `kind` and `metadata.name` fields

```console
$ cue import ./... -p kube -l 'strings.ToCamel(kind)' -l metadata.name -f
```

{{step}}
*(optional)* If your configuration uses the common Kubernetes pattern of
storing individual service configurations as YAML that's serialised as a single
string, then repeat the previous import with the `-R` flag added. This
instructs `cue` to attempt to parse string values as structured data, and to
record their contents in CUE as structured data where possible:

```console
$ cue import ./... -p kube -l 'strings.ToCamel(kind)' -l metadata.name -f -R
```

{{step}}
- FIXME: commit CUE?
- FIXME: delete YAML?
- FIXME: regenerate YAML?
- FIXME: how to /use/ CUE, if not via YAML regeneration?

#### Further reading/See Also

- FIXME: pointer to next howto guide?
- [cmd/cue command line documentation](https://cue.googlesource.com/cue/+/refs/tags/v0.2.0/doc/cmd/cue.md)
