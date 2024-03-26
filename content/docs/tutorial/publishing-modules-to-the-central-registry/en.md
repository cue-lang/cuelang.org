---
title: Publishing modules to the Central Registry
authors:
- myitcv
tags:
- modules
- tooling
- cue command
toc_hide: true
---

{{{with _script "en" "use prelrelease"}}}
export PATH="/cues/prerelease:$PATH"
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_COLLABORATOR_RW}","token_type":"Bearer"}}}
EOD
{{{end}}}

## Introduction

In this tutorial you will learn how to create and work with CUE modules,
`{{{.MODULE1}}}`

{{{with script "en" "step 1"}}}
echo {{{.MODULE1}}}
{{{end}}}
