---
title: Modules
tags: [modules]
toc_hide: false
weight: 30
---

Modules are how CUE manages dependencies.
You can share a module by *publishing* it, and your CUE can depend on published
modules. Each module holds a set of packages that get distributed together, and
gets published alongside metadata -- including the *module path* and *version*
which jointly identify the module's contents.

Publishing a module doesn't automatically make it available publicly.
The *registry* that you choose to publish to will decide who has access, and
each registry has its own access policy.
For example, the [CUE Central Registry](https://registry.cue.works) can serve
public modules to anyone who requests them, and also restricts access to
private modules for the users authorized by the module's author or
organization.

Initializing a module defines its identifier, and allows its CUE to consume
other modules.
A module only needs to be published if another module declares a dependency on
it -- initializing a module doesn't automatically publish it.
If your CUE only consumes other modules (and isn't consumed by any) then you
don't need to publish it.

{{<todo "TODO from here">}}

A module contains a tree of CUE *packages* alongside metadata that describes
the module's *path* (its name, or identity), its *version*, and its
*dependencies*.  The metadata is generally managed by
[`cue mod`]({{<relref "docs/reference/command/cue-help-mod">}})
commands such as
[`cue mod init`]({{<relref "docs/reference/command/cue-help-mod-init">}})
(which initializes a module), and
[`cue mod tidy`]({{<relref "docs/reference/command/cue-help-mod-tidy">}})
(which resolves all dependencies in the current module and updates the metadata
to reflect them).

A module must be initialized and referred to if any package in the tree needs
to be referenced by any other package -- whether that other package is inside
the same module, or in some other module.
When a package references (or *imports*) a package from a different module, the
module containing the importing package is said to have a *dependency* on the
module containing the imported package.

Optionally, modules can be *published* to a *registry*.
A published module can be used as a dependency by other modules, and will be
fetched from the registry by CUE whenever required.
A module only needs to be published when other modules have a dependency on it.
A module containing a tree of packages that refer to each other (and aren't
referenced by packages in other modules) does not need to be published -- but
can be published if so desired.

Learn about CUE modules using these suggested links,
or browse through all the {{<tag modules>}} pages
[listed below](#all-pages-tagged-modules):

{{<cards>}}
{{<card title="Reference manual"
        label="reference/manual"
        href="/docs/reference/modules/"
>}}
The CUE modules reference manual and glossary
{{</card>}}

{{<card title="Concept Guide"
        label="concept/faq"
        href="/docs/concept/faq/new-modules-vs-old-modules/"
>}}
CUE's "new" versus "old" modules -- your questions: answered
{{</card>}}

{{<card title="The cue command"
        label="reference/command/cue"
        href="/docs/reference/command/cue-help-modules"
>}}
The built-in help text for\
`cue help modules`
{{</card>}}

{{<card title="Getting started"
        label="tutorial"
        href="/docs/tutorial/working-with-the-central-registry/"
>}}
Working with the CUE Central Registry
{{</card>}}
{{<card title="Collaborate"
        label="tutorial"
        href="/docs/tutorial/publishing-modules-to-the-central-registry/"
>}}
Publishing modules to the Central Registry
{{</card>}}

{{<card title="Private infrastructure"
        label="tutorial"
        href="/docs/tutorial/working-with-a-custom-module-registry/"
>}}
Working with a custom module registry
{{</card>}}
{{</cards>}}

## All pages tagged "modules"

{{<search tags="modules">}}
