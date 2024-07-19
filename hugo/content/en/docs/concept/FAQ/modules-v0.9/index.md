---
title: "Modules in CUE v0.9"
toc_hide: true
tags: [modules]
---

This wiki provides an extended FAQ for the release notes at https://github.com/cue-lang/cue/releases/tag/v0.9.0 and subsequent bugfix releases. In particular, this FAQ focuses on questions about the transition to the "new" modules implementation that is now enabled by default.

### Modules? Where do I get started?

["Working with modules and the Central Registry"](https://cuelang.org/docs/tutorial/working-with-the-central-registry/) and ["Working with a custom module registry"](https://cuelang.org/docs/tutorial/working-with-a-custom-module-registry/) present an easy-to-digest introduction to modules. [The `modules` tag](https://cuelang.org/search/?q=tag:modules) shows other modules-related content. The [Modules Reference](https://cuelang.org/docs/reference/modules/) is the definitive reference document with all details on how modules work.

### What is the Central Registry?

The Central Registry at [registry.cue.works](https://registry.cue.works/) is currently in alpha testing. The Central Registry will be a well known place for schemas for well known services and projects. We will share more details about the Central Registry in the future. For now, we are looking to get early feedback.

### What do you mean "new" and "old" modules implementations?

https://cuelang.org/issue/2939 presented a proposal for how CUE can fully support package and dependency management. Over the course of v0.8.x releases and pre-releases leading up to v0.9.0, we have been experimenting with an implementation of this proposal: we refer to this as the "new" modules implementation. In v0.9.0, this "new" implementation is the default. In previous CUE versions (v0.8.x and earlier), the "old" implementation is the default.

### Why do I need to run `cue mod fix`?

v0.9.0 requires that `language.version` is declared in the `cue.mod/module.cue` file. Running [`cue mod fix`](https://cuelang.org/docs/reference/cli/cue-mod-fix/) does this automatically for you. It also moves unrecognized top-level fields to a `custom.legacy` field. If you already have a `language.version` field, then `cue mod fix` is a no-op in this regard.

### Why is `language.version` now required?

With v0.9.0, CUE requires that a language version be declared in a `cue.mod/module.cue` file:

```
module: "mod.example/hello@v0"
language: version: "v0.9.0"
```

When running `cue mod init` to create a new module, this line is added automatically. Where a `language.version` field is missing, CUE will error and suggest that you use `cue mod fix` to add it.

This transition started with [v0.8.0](https://github.com/cue-lang/cue/releases/tag/v0.8.0) when the field was introduced and started being added by `cue mod init`. By now requiring a language version, CUE is more closely following an approach like Go when it comes to [forwards compatibility](https://go.dev/blog/toolchain). This means that modules depending on any upcoming language changes or changes in semantics can declare a minimum version of CUE required to evaluate that code. Similarly, evaluating an older CUE module can be done with the knowledge that it was written against an older version of the CUE language spec and semantics.

See https://cuelang.org/docs/reference/modules/#cue-mod-file for an explanation of the various fields in a `cue.mod/module.cue` file.

### What about my old modules that don't have a `language.version` field?

In some cases, the above suggestion to use `cue mod fix` to migrate the `module.cue` file might not be possible. This might happen, for example, if you are using the CUE Go API and need to interpret older CUE code. There is now an `AcceptLegacyModules` field in the `cue/load.Config` struct that can direct the loader to fix the main module's `module.cue` file automatically without the need to change it on disk. It is also still possible to disable the modules experiment and revert to older modules resolution logic throughout by setting the environment variable `CUE_EXPERIMENT=modules=0`, although this option will be removed in time.

### Why do I need to specify a source to publish a module?

`cue mod publish` needs to determine what files to include in a published module. Rather than rely on implicit heuristics such as whether a VCS exists or is installed,to determine whether the file list should be determined from the files on disk, or from the contents of a Git commit,  we require the module author to be explicit.

### Where do I configure which OCI registry to use for publishing/fetching modules?

As explained by [`cue help environment`](https://cuelang.org/docs/reference/cli/cue-environment/), `CUE_REGISTRY` determines the configuration to use when downloading and publishing modules. See [`cue help registryconfig`](https://cuelang.org/docs/reference/cli/cue-registryconfig/) for details.

### Where can I find out more about modules commands?

See [`cue help mod`](https://cuelang.org/docs/reference/cli/cue-mod/).

### What about tag injection?

Tag injection remains similar in the new module implementation, with the notable exception of `@if` attributes.

Namely:
- tags are injected only into packages explicitly mentioned on the command line (or as explicit packages to [cue/load.Instances](https://pkg.go.dev/cuelang.org/go/cue/load#Instances)). This behavior has not changed
- `@if` attributes only process tags when they are in files inside the main module. In any external module, all tags are considered to be false. This is a change from before, when there was no distinction between the main and external modules.
