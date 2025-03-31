---
title: Mirroring modules between registries
toc_hide: true
authors: [jpluscplusm]
tags: [modules]
---

This guide demonstrates how to use the
[`cue mod mirror`]({{<relref"docs/reference/command/cue-help-mod-mirror">}})
command to copy
[CUE modules]({{<relref"docs/reference/modules">}})
between registries.

`cue mod mirror` can be used to mirror modules between any pair of registries for
which you have appropriate access permissions. The example shown here mirrors
modules from the CUE
[Central Registry](https://registry.cue.works)
to a local, in-memory registry. The contents of this local registry are
ephemeral: they disappear when it shuts down -- so don't use this registry to
store your important modules!

The `cue mod mirror` command is not yet available in the latest CUE release.
This guide demonstrates the following
[pre-release version]({{<relref"docs/introduction/installation/#download-an-official-cue-binary">}}):
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.13.0-alpha.3
...
```

{{< step stepNumber="1" >}}
Login to the Central Registry:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2lu" }
$ cue login
```
Our example uses the
[Central Registry](https://registry.cue.works)
as the source for modules to mirror, and it requires authentication. If you are
mirroring modules from the Central Registry you need to login before continuing.
{{< /step >}}

{{< step stepNumber="2" >}}
Start the in-memory registry running in the background, listening on localhost port `55443`:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCByZWdpc3RyeSAxMjcuMC4wLjE6NTU0NDM=" }
$ cue mod registry 127.0.0.1:55443
```
Every module mirrored to this ephemeral registry will disappear when you stop it.
{{< /step >}}

{{< step stepNumber="3" >}}
Copy the `k8s.io` curated module from the Central Registry to the local registry:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBtaXJyb3IgLS10byAxMjcuMC4wLjE6NTU0NDMgZ2l0aHViLmNvbS9jdWUtdG1wL2pzb25zY2hlbWEtcHViL2V4cDMvazhzLmlv" }
$ cue mod mirror --to 127.0.0.1:55443 github.com/cue-tmp/jsonschema-pub/exp3/k8s.io
mirroring github.com/cue-tmp/jsonschema-pub/exp3/k8s.io@v0.1.0
```
The [`cue mod mirror`]({{<relref"docs/reference/command/cue-help-mod-mirror">}})
command copies each module from and to the appropriate registry for its
[module path]({{<relref"docs/reference/modules/#module-path">}}) --
which is usually the Central Registry, but can be configured differently (see
<code>{{<linkto/inline"reference/command/cue-help-registryconfig">}}</code>
for more information).
In this example we overrode the configured destination registry using the `--to` flag.
The `--from` flag can also be used to override the configured source registry.

By default, `cue mod mirror` copies the latest version of each module
specified, along with that version's dependencies and all their transitive
dependencies. This behaviour can be varied, as described by
<code>{{<linkto/inline"reference/command/cue-help-mod-mirror">}}</code>.
{{< /step >}}

## Related content

- {{<linkto/related/reference"command/cue-help-mod-mirror">}}
- {{<linkto/related/reference"command/cue-help-registryconfig">}}
- {{<linkto/related/reference"modules">}}
- The CUE [Central Registry](https://registry.cue.works)
