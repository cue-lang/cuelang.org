---
title: Modules
tags: [modules]
authors: [jpluscplusm]
toc_hide: false
weight: 30
---

Modules are how CUE manages dependencies.
You can share a module by *publishing* it,
and your CUE can depend on published modules.
Each module holds a set of packages that are distributed together,
and it's published alongside metadata
-- including the *module path* and *version*
which jointly identify the module's contents.

Publishing a module doesn't automatically make it available publicly.
The *registry* you choose to publish to will decide who has access,
and each registry has its own access policy.
For example, the [CUE Central Registry](https://registry.cue.works) can
serve public modules to anyone who requests them, and also
restricts access to private modules for the users authorized by
the module's author or organization.
A module only needs to be published if another module declares a dependency on it.

<!--more-->

Placing your CUE inside a module allows it to consume
(or *import*)
packages from other modules,
but doesn't cause or require it to be published.
If your module only consumes other modules
(and isn't consumed by any)
then it doesn't matter if you choose to publish it or not.
Some features are only available to CUE that's inside a module
(such as
[file embedding]({{<relref"docs/howto/place-data-files-different-locations-file-embedding">}})
and
[package instances]({{<relref"docs/concept/modules-packages-instances/#instances">}})),
so it's recommended to enable them by
*initializing* a module to hold your local CUE.
It's always safe to do this,
even if your CUE doesn't need to be published.

You'll generally interact with modules using commands grouped under
[`cue mod`]({{<relref"docs/reference/command/cue-help-mod">}}).
Here are the guides and commands most commonly used by module consumers and publishers:

{{<columns>}}

### Consumers

- {{<linkto/inline"tutorial/working-with-the-central-registry">}}
- [`cue mod init`]({{<relref"docs/reference/command/cue-help-mod-init">}}):
  initialize a module
- [`cue mod tidy`]({{<relref"docs/reference/command/cue-help-mod-tidy">}}):
  tidy a module's dependencies
- [`cue mod get`]({{<relref"docs/reference/command/cue-help-mod-get">}}):
  update specific dependencies

{{<columns-separator>}}

### Publishers

- {{<linkto/inline"tutorial/publishing-modules-to-the-central-registry">}}
- {{<linkto/inline"tutorial/working-with-a-custom-module-registry">}}
- [`cue mod init`]({{<relref"docs/reference/command/cue-help-mod-init">}}):
  initialize a module
- [`cue mod tidy`]({{<relref"docs/reference/command/cue-help-mod-tidy">}}):
  tidy a module's dependencies
- [`cue mod publish`]({{<relref"docs/reference/command/cue-help-mod-publish">}}):
  publish a module to a registry

{{</columns>}}

---

## Recommended guides

Learn more about modules using these guides,
or browse and search through all the {{<tag modules>}} pages
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
