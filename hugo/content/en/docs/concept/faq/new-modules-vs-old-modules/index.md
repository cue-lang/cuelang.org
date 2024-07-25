---
title: Modules in CUE v0.9
toc_hide: true
tags: [modules]
---

This guide provides an extended FAQ for the release notes at
https://github.com/cue-lang/cue/releases/tag/v0.9.0 and subsequent bugfix
releases. In particular, this FAQ focuses on questions about the transition to
the "new" modules implementation that is enabled by default, as of v0.9.0.

## Modules? Where do I get started?

{{< linkto/inline "tutorial/working-with-the-central-registry" >}} and
{{< linkto/inline "tutorial/working-with-a-custom-module-registry" >}}
present an easy-to-digest introduction to modules.
The {{<tag modules>}} tag lists other modules-related content.
The {{< linkto/inline "reference/modules" >}} reference is the definitive
document that details how modules work.

## What is the Central Registry?

The Central Registry at [registry.cue.works](https://registry.cue.works/) is
currently in alpha testing, and will be a well-known place for schemas for
well-known services and projects. We will share more details about the Central
Registry in the future. For now, we are looking to get early feedback - please
come and discuss it in the `#modules` [Slack channel](/slack).

## What do you mean "new" and "old" modules implementations?

{{<issue 2939>}}Issue #2939{{</issue>}} presented a proposal for how CUE can
fully support package and dependency management. Over the course of v0.8.x
releases and pre-releases leading up to v0.9.0, we have been experimenting with
an implementation of this proposal: we refer to this as the "new" modules
implementation. In v0.9.0, this "new" implementation is the default. In
previous CUE versions (v0.8.x and earlier), the "old" implementation is the
default.

## Why do I need to run `cue mod fix`?

v0.9.0 requires that `language.version` is declared in the `cue.mod/module.cue` file.
Running
[`cue mod fix`]({{< relref "docs/reference/command/cue-help-mod-fix" >}})
does this automatically for you. It also moves unrecognized top-level fields to
a `custom.legacy` field. If you already have a `language.version` field, then
`cue mod fix` is a no-op in this regard.

## Why is `language.version` now required?

With v0.9.0, CUE requires that a language version be declared in a `cue.mod/module.cue` file:

{{< code-tabs >}}
{{< code-tab name="cue.mod/module.cue" language="cue" area="top-left" >}}
module: "mod.example/hello@v0"
language: version: "v0.9.0"
{{< /code-tab >}}{{< /code-tabs >}}

When running `cue mod init` to create a new module, this line is added
automatically. Where a `language.version` field is missing, CUE will error and
suggest that you use `cue mod fix` to add it.

This transition started with
[v0.8.0](https://github.com/cue-lang/cue/releases/tag/v0.8.0) when the field
was introduced and started being added by `cue mod init`.
By now requiring a language version, CUE is more closely following an approach
like Go when it comes to [forwards compatibility](https://go.dev/blog/toolchain).
This means that modules depending on any upcoming language changes or changes
in semantics can declare a minimum version of CUE required to evaluate that
code. Similarly, evaluating an older CUE module can be done with the knowledge
that it was written against an older version of the CUE language spec and
semantics.

See
[the Modules reference document]({{< relref "docs/reference/modules" >}}#cue-mod-file)
for an explanation of the various fields in a `cue.mod/module.cue` file.

## What about old modules that don't have a `language.version` field?

In some cases, the above suggestion to use `cue mod fix` to migrate the
`module.cue` file might not be possible. This might happen, for example, if you
are using the CUE Go API and need to interpret older CUE code. There is now an
`AcceptLegacyModules` field in the `cue/load.Config` struct that can direct the
loader to fix the main module's `module.cue` file automatically without the
need to change it on disk. It is also still possible to disable the modules
experiment and revert to older modules resolution logic throughout by setting
the environment variable `CUE_EXPERIMENT=modules=0`, although this option will
be removed in time.

## Why do I need to specify a source to publish a module?

`cue mod publish` needs to determine what files to include in a published
module. Rather than rely on implicit heuristics such as whether a VCS exists or
is installed,to determine whether the file list should be determined from the
files on disk, or from the contents of a Git commit,  we require the module
author to be explicit.

## How do I configure which OCI registry is used for publishing/fetching modules?

As explained by
[`cue help environment`]({{< relref "docs/reference/command/cue-help-environment" >}}),
the `CUE_REGISTRY` environment variable determines the configuration to use
when downloading and publishing modules. See
[`cue help registryconfig`]({{< relref "docs/reference/command/cue-help-registryconfig" >}})
for details.

## Where can I find out more about modules commands?

See [`cue help mod`]({{< relref "docs/reference/command/cue-help-mod" >}}).

## What about tag injection?

Tag injection remains similar in the new module implementation, with the
notable exception of `@if` attributes. Specifically:
- tags are injected only into packages explicitly mentioned on the command line
  or as explicit packages to
  [cue/load.Instances](https://pkg.go.dev/cuelang.org/go/cue/load#Instances).
  (This behavior has not changed from versions of CUE before v0.9)
- `@if` attributes only process tags when they are in files inside the main
  module. In any external module, all tags are considered to be `false`. This
  is a change from earlier versions, when there was no distinction between the
  main module and external modules.

<!-- TODO: @if(!foo) in an external module results in `!false == true`, so the file is included.
Show this in an example.
-->
