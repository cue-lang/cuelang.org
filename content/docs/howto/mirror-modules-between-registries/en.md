---
title: Mirroring modules between registries
toc_hide: true
authors: [jpluscplusm]
tags: [modules]
---

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

# Access to "cue mod mirror" via tip of cmd/cue.
export PATH=/cues/$CUELANG_CUE_TIP:$PATH
{{{end}}}

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
{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
{{{end}}}

{{{with step}}}
Login to the Central Registry:
{{{with script "en" "cue login"}}}
#norun
cue login
{{{end}}}
Our example uses the
[Central Registry](https://registry.cue.works)
as the source for modules to mirror, and it requires authentication. If you are
mirroring modules from the Central Registry you need to login before continuing.
{{{end}}}

{{{with step}}}
Start the in-memory registry running in the background, listening on localhost port `55443`:
{{{with script "en" "start local registry"}}}
#norun
cue mod registry 127.0.0.1:55443 &
{{{end}}}
Every module mirrored to this ephemeral registry will disappear when you stop it.
{{{end}}}

{{{with step}}}
Copy the `k8s.io` and `npmpackage` modules from the Central Registry to the local registry:
{{{with script "en" "cue mod mirror"}}}
cue mod mirror --to 127.0.0.1:55443 github.com/cue-tmp/jsonschema-pub/exp3/k8s.io github.com/cue-tmp/jsonschema-pub/exp3/npmpackage
{{{end}}}
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
{{{end}}}

{{{with step}}}
Stop the local registry that's running on your computer:
{{{with script "en" "ps axu"}}}
pkill -f "cue mod registry"
{{{end}}}
The command you need to run may be different from this example.
{{{end}}}


## Related content

- {{<linkto/related/reference"command/cue-help-mod-mirror">}}
- {{<linkto/related/reference"command/cue-help-registryconfig">}}
- {{<linkto/related/reference"modules">}}
- The CUE [Central Registry](https://registry.cue.works)
