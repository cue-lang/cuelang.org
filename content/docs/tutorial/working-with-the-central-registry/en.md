---
title: Working with modules and the Central Registry
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
$CUE_TEST_LOGINS
EOD
{{{end}}}

{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
{{{end}}}

{{{with script "en" "enable modules"}}}
export CUE_EXPERIMENT=modules
{{{end}}}

{{{with script "en" "cue mod init"}}}
cue mod init glacial-tech.example/frostyapp@v0
{{{end}}}

{{{with upload "en" "initial config.cue"}}}
-- config.cue --
package frostyapp

import "github.com/myitcvscratch/publiccuemodules/2024-03-20/glacial-tech.example/frostyconfig@v0"

config: frostyconfig.#Config & {
	appName: "alpha"
	port:    80
	features: logging: true
}
{{{end}}}

{{{with script "en" "initial cue mod tidy"}}}
cue mod tidy
{{{end}}}

{{{with script "en" "first check of module.cue"}}}
cat cue.mod/module.cue
{{{end}}}

{{{with script "en" "first export"}}}
cue export --out yaml
{{{end}}}

