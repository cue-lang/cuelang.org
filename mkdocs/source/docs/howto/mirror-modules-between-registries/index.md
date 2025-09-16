---
title: Mirroring modules between registries
toc_hide: true
authors: [jpluscplusm]
tags: [modules]
---
{{<sidenote text="Requires CUE v0.13.0 or later">}}

This guide demonstrates how to use the
[`cue mod mirror`]({{<relref"docs/reference/command/cue-help-mod-mirror">}})
command to copy
[CUE modules]({{<relref"docs/reference/modules">}})
between registries.

<!--more-->

The `cue mod mirror` command is available in CUE v0.13.0 and later. It can be
used to mirror modules between any pair of registries for which you have
appropriate access permissions.
The example shown here mirrors modules from the CUE
[Central Registry](https://registry.cue.works)
to a local, in-memory registry. The contents of this local registry are
ephemeral: they disappear when it shuts down -- so don't use this registry to
store your important modules!

[**:material-chevron-right-circle-outline: Step 1**](#step-1){id="step-1"}: Start the in-memory registry running in the background, listening on localhost port `55443`:

```` { .text title="TERMINAL" data-copy="cue mod registry 127.0.0.1:55443" }
$ cue mod registry 127.0.0.1:55443
````

Every module mirrored to this ephemeral registry will disappear when you stop it.

---


[**:material-chevron-right-circle-outline: Step 2**](#step-2){id="step-2"}: Copy the `k8s.io` curated module from the Central Registry to the local registry:

```` { .text title="TERMINAL" data-copy="cue mod mirror --to 127.0.0.1:55443 github.com/cue-tmp/jsonschema-pub/exp3/k8s.io" }
$ cue mod mirror --to 127.0.0.1:55443 github.com/cue-tmp/jsonschema-pub/exp3/k8s.io
mirroring github.com/cue-tmp/jsonschema-pub/exp3/k8s.io@v0.1.0
````

The [`cue mod mirror`]({{<relref"docs/reference/command/cue-help-mod-mirror">}})
command copies each module from and to the appropriate registry for its
[module path]({{<relref"docs/reference/modules#module-path">}}) --
which is usually the Central Registry, but can be configured differently (see
<code>{{<linkto/inline"reference/command/cue-help-registryconfig">}}</code>
for more information).
In this example we overrode the configured destination registry using the `--to` flag.
The `--from` flag can also be used to override the configured source registry.

By default, `cue mod mirror` copies the latest version of each module
specified, along with that version's dependencies and all their transitive
dependencies. This behaviour can be varied, as described by
<code>{{<linkto/inline"reference/command/cue-help-mod-mirror">}}</code>.

---


## Related content

- {{<linkto/related/reference"command/cue-help-mod-mirror">}}
- {{<linkto/related/reference"command/cue-help-registryconfig">}}
- {{<linkto/related/reference"modules">}}
- The CUE [Central Registry](https://registry.cue.works)
