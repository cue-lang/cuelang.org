---
title: DRYing up GitHub Actions workflows
---

{{{with _script_ "en" "HIDDEN setup"}}}
# Registry auth
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD

# TODO(jm): revert to latest when it has evalv3 as default.
export PATH=/cues/$CUELANG_CUE_PRERELEASE:$PATH
{{{end}}}

If you've already started
[using CUE to define GitHub Actions workflows]({{<relref"getting-started-with-github-actions-cue">}})
then you might have several workflows that share common characteristics.
Some of CUE's most useful features are designed to reduce repetition and allow
easy <dfn title="&quot;Don't Repeat Yourself&quot;">DRYing up</dfn>
of configuration and data sources.
This guide shows you how to use those features to simplify the sources of
multiple GitHub Actions workflows -- allowing their most important, unique
elements to stand out.

To follow along with this guide the latest pre-release of the `cue` command is
required -- please [upgrade to this version](/docs/installing-cue/) if it's not
already installed:
{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
{{{end}}}

The techniques and language features demonstrated in this guide can be applied
to any CUE, but the changes made here are specific to the configurations shown
on this page -- you'll need to adapt them to suit your CUE.

## Start with several workflows defined in CUE
## Login to the Central Registry
## Initialise your local CUE module
## Tidy your local CUE module
## Check that your CUE exports cleanly
## Simplify the CUE
## Draw the rest of the owl
## Use cue trim?
## Check that your CUE still exports cleanly
## Review the changes
## Next steps
