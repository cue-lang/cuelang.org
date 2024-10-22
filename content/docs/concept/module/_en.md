---
title: Modules
tags: [modules]
toc_hide: false
aliases:
- /docs/concept/modules/
---

Modules are how CUE manages native dependencies.
A module comprises a tree of CUE [packages]({{< relref "../package" >}}), along
with metadata that describes the module's identity, version, and its dependencies.
This metadata is generally managed by the
[`cue mod`]({{<relref "docs/reference/command/cue-help-mod">}}) command.

Using a module is required if any package in the tree needs to be referenced by
some other package in any module -- including being referenced by a package
inside the same module. When a package references (or *imports*) a package
from a different module, the module containing the first package is said to
have a *dependency* on the module containing the second package.

Optionally, modules can be *published* to a
[registry]({{< relref "../registry" >}}).
A published module can be used as a dependency by other modules, and can be
fetched from the registry when required.

{{<cards>}}
{{<card title="Importing your own local packages"
        label="module/local-import"
        href="."
>}}
How using a module allows you to reference one package from another, inside the same package tree.
{{</card>}}

{{<card title="Do I need to publish my module?"
        label="module/publishing"
        href="."
>}}
Only certain workflows require modules to be published. Find out about them here ...
{{</card>}}

{{<card title="Adding a module dependency"
        label="module/cue-mod-tidy"
        href="."
>}}
Teach CUE that your module needs to use another module ...
{{</card>}}
{{</cards>}}

# Move these cards to a "Suggested content" page/etc.

Learn about CUE modules using the suggested links below,
or follow the {{<tag modules>}} tag to explore the full range of modules-related
pages on the site.

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
