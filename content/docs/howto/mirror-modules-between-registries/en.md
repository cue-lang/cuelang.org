---
title: Mirroring modules between registries
toc_hide: true
authors: [jpluscplusm]
tags: [modules]
---
{{<sidenote text="Requires CUE v0.13.0 or later">}}

{{{with _script_ "en" "HIDDEN: setup"}}}
# Access to Central Registry.
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD

# Local registry.
# TODO: this is inherently racey. But not a problem in practice...
# for now. When it does become a problem we can solve this properly
# using a nc-based wait loop or similar.
nohup cue mod registry localhost:55443 > /tmp/cue_mod_registry 2>&1 &
{{{end}}}

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

{{{with step}}}
Start the in-memory registry running in the background, listening on localhost port `55443`:

{{{with script "en" "start local registry"}}}
#norun
cue mod registry 127.0.0.1:55443
{{{end}}}

Every module mirrored to this ephemeral registry will disappear when you stop it.
{{{end}}}

{{{with step}}}
Copy the `k8s.io` curated module from the Central Registry to the local registry:

{{{with script "en" "cue mod mirror"}}}
cue mod mirror --to 127.0.0.1:55443 cue.dev/x/k8s.io@v0.6.0
{{{end}}}

_We choose a specific version in this example, but you could omit that version
or use `@latest`._

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
{{{end}}}

## Related content

- {{<linkto/related/reference"command/cue-help-mod-mirror">}}
- {{<linkto/related/reference"command/cue-help-registryconfig">}}
- {{<linkto/related/reference"modules">}}
- The CUE [Central Registry](https://registry.cue.works)
