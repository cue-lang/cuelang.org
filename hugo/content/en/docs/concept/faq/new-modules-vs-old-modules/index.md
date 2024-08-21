---
title: New modules vs old modules
toc_hide: true
tags: [modules]
---

The [v0.9.0](https://github.com/cue-lang/cue/releases/tag/v0.9.0) release of CUE
made "new" modules the default. But what are "new" modules? Come to think of it,
what are "old" modules? What is the difference between them?

This guide provides an extended FAQ that focuses on these questions and more,
including questions about the transition from "old" to "new" modules.

## What do you mean "old" and "new" modules?

The concept of a module has existed from the very early days of CUE. That early
module support was very primitive: dependencies needed to be copied in place by
hand. There was no native tooling for publishing or fetching modules from a
remote store. Native module support within the CUE toolchain and APIs was
missing. Everything was very minimal and manual. We refer to this original
behaviour as the "old" modules implementation.

To address the shortcomings of the "old" modules implementation, we went through
a number of design and proposal iterations. These culminated in the [modules
proposal v3](https://github.com/cue-lang/cue/discussions/2939), which was
accompanied by an experimental implementation in pre-releases of the v0.8.x
series, starting in
[v0.8.0-alpha.1](https://github.com/cue-lang/cue/releases/tag/v0.8.0-alpha.1).
"Old" modules remained the default behaviour at this time, with the experimental
implementation turned on by setting `CUE_EXPERIMENT=modules`.

The modules proposal v3 was
[accepted](https://github.com/cue-lang/cue/discussions/2939#discussioncomment-9468945)
on May 17 2024, following extensive testing and feedback from users. At this
point, we started referring to the experimental implementation that supported
the v3 proposal as "new" modules, reflecting the change away from it being an
experiment. "Old" modules remained the default behaviour at this time, with
"new" modules being enabled in the same way as before.

[v0.9.0](https://github.com/cue-lang/cue/releases/tag/v0.9.0) was released on
June 6 2024 and it was in this release that "new" modules became the default.
This removed the need to set `CUE_EXPERIMENT=modules`. For those needing "old"
modules in v0.9.0 or later versions could set `CUE_EXPERIMENT=modules=0` to
revert to the old behaviour. At some point in the future, "old" modules support
will be removed entirely.


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

## Can I use `cue.mod/usr` with "new" modules?

It is an error to have a dependency declared in your `module.cue` in the `deps`
field, that also exists in any of the `cue.mod/{pkg,gen,usr}` directories:

```
mod.example@v0: import failed: cannot find package "github.com/cue-labs/examples/frostyconfig@v0": ambiguous import: found package github.com/cue-labs/examples/frostyconfig@v0 in multiple modules:
        github.com/cue-labs/examples/frostyconfig@v0 v0.0.1 (.)
        local (cue.mod/usr/github.com/cue-labs/examples/frostyconfig):
```

Essentially, the CUE loader is unable to determine which "wins". As such, "old"
and "new" modules are mutually exclusive.

We continue to support `cue.mod/{pkg,gen,usr}` for now. as we continue of our
efforts to improve the CUE module ecosystem. In particular, we are looking to
better understand how to support generated CUE modules (in the "old" modules
world these live in `cue.mod/gen`) and user augmentations for
dependencies/generated CUE modules (int he "old" modules world these live in
`cue.mod/usr`). Work on the [Central Registry](https://registry.cue.works/) is a
key part of both of these goals.

<!-- TODO: @if(!foo) in an external module results in `!false == true`, so the file is included.
Show this in an example.
-->
