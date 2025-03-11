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

The `cue mod mirror` command is not yet available in the latest version of CUE.
This guide demonstrates the following
[development version]({{<relref"docs/introduction/installation/#development-version">}}):
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.13.0-0.dev.0.20250225142354-26a698fe9ae9
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
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCByZWdpc3RyeSAxMjcuMC4wLjE6NTU0NDMgJg==" }
$ cue mod registry 127.0.0.1:55443 &
```
Every module mirrored to this ephemeral registry will disappear when you stop it.
{{< /step >}}

{{< step stepNumber="3" >}}
Copy the `k8s.io` and `npmpackage` modules from the Central Registry to the local registry:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBtaXJyb3IgLS10byAxMjcuMC4wLjE6NTU0NDMgZ2l0aHViLmNvbS9jdWUtdG1wL2pzb25zY2hlbWEtcHViL2V4cDMvazhzLmlvIGdpdGh1Yi5jb20vY3VlLXRtcC9qc29uc2NoZW1hLXB1Yi9leHAzL25wbXBhY2thZ2U=" }
$ cue mod mirror --to 127.0.0.1:55443 github.com/cue-tmp/jsonschema-pub/exp3/k8s.io github.com/cue-tmp/jsonschema-pub/exp3/npmpackage
mirroring github.com/cue-tmp/jsonschema-pub/exp3/k8s.io@v0.1.0
mirroring github.com/cue-tmp/jsonschema-pub/exp3/npmjs/ava@v0.2.0
mirroring github.com/cue-tmp/jsonschema-pub/exp3/npmjs/eslint@v0.2.0
mirroring github.com/cue-tmp/jsonschema-pub/exp3/npmjs/jscpd@v0.1.0
mirroring github.com/cue-tmp/jsonschema-pub/exp3/npmjs/prettier@v0.1.0
mirroring github.com/cue-tmp/jsonschema-pub/exp3/npmjs/stylelint@v0.2.0
mirroring github.com/cue-tmp/jsonschema-pub/exp3/semanticrelease@v0.1.0
mirroring github.com/cue-tmp/jsonschema-pub/exp3/npmpackage@v0.3.0
```
By default, the
[`cue mod mirror`]({{<relref"docs/reference/command/cue-help-mod-mirror">}})
command copies each named module (and its dependencies) from and to the
appropriate registry for its
[module path]({{<relref"docs/reference/modules/#module-path">}}) --
which is usually the Central Registry, but can be configured differently (see
<code>{{<linkto/inline"reference/command/cue-help-registryconfig">}}</code>
for more information).
In this example we overrode the configured destination registry using the `--to` flag.
The `--from` flag can also be used to override the configured source registry.

Notice how we specified two modules to mirror, but the command's output
mentioned several more modules. This is because the default behaviour of `cue
mod mirror` is to copy the latest version of each module specified, along with
that version's dependencies and all their transitive dependencies. This
behaviour can be varied, as described by
<code>{{<linkto/inline"reference/command/cue-help-mod-mirror">}}</code>.
{{< /step >}}

{{< step stepNumber="4" >}}
Stop the local registry that's running on your computer:
```text { title="TERMINAL" type="terminal" codeToCopy="cGtpbGwgLWYgImN1ZSBtb2QgcmVnaXN0cnki" }
$ pkill -f "cue mod registry"
```
The command you need to run may be different from this example.
{{< /step >}}


## Related content

- {{<linkto/related/reference"command/cue-help-mod-mirror">}}
- {{<linkto/related/reference"command/cue-help-registryconfig">}}
- {{<linkto/related/reference"modules">}}
- The CUE [Central Registry](https://registry.cue.works)
