---
title: Carving out submodules from modules
authors:
- myitcv
tags:
- modules
toc_hide: true
---

{{{with _script_ "en" "use prelrelease"}}}
git config --global user.email '{{{.githubUser}}}@cue.works'
git config --global user.name {{{.githubUser}}}

mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_COLLABORATOR_RW}","token_type":"Bearer"}}}
EOD
{{{end}}}
<!-- vim_ syntax highlighting hack -->

{{{with step}}}

Create and publish the first version of the root-level module:

{{{with script "en" "create directory structure"}}}
mkdir {{{.module1}}} {{{.main}}}
{{{end}}}

{{{end}}}

{{{with step}}}

Create and publish the first version of the root-level module:

{{{with script "en" "create-module-1"}}}
cd {{{.module1}}}
cue mod init --source=self {{{.MODULE1}}}
{{{end}}}

{{{with upload "en" "mod 1 initial content"}}}
-- {{{.module1}}}/cue/schema/schema.cue --
package schema

#X: string
{{{end}}}

{{{with script "en" "publish initial module-1 version"}}}
cue mod publish v0.0.1
{{{end}}}

{{{end}}}


{{{with step}}}

Use the root-level module:

{{{with script "en" "create main"}}}
cd ../{{{.main}}}
cue mod init cue.example/{{{.main}}}
{{{end}}}

{{{with upload "en" "main initial content"}}}
-- {{{.main}}}/{{{.main}}}.cue --
package {{{.main}}}

import "{{{.MODULE1}}}/cue/schema"

X: schema.#X & "hello world"
{{{end}}}

{{{with script "en" "main initial cue mod tidy"}}}
cue mod tidy
cue export
{{{end}}}

{{{end}}}


{{{with step}}}

Create and publish submodule:

{{{with script "en" "create submodule"}}}
cd ../{{{.module1}}}

# Move to cue subdirectory
cd cue
cue mod init --source=self {{{.MODULE1}}}/cue
cue mod publish v0.0.1
{{{end}}}

{{{end}}}


{{{with step}}}

Check whether our use "still works"

{{{with script "en" "check main 1"}}}
cd ../../{{{.main}}}

# remove cue.mod directory and re-init as clean way to remove
# all declared depdendencies
rm -r cue.mod
cue mod init cue.example/{{{.main}}}

# This should now fail because we have the latest versions of
# the original root-level module and the submodule providing
# the same package
! cue mod tidy
{{{end}}}

{{{end}}}


{{{with step}}}

Fix by publishing an "empty" root-level module version:

{{{with script "en" "publish empty root-level module main 1"}}}
cd ../{{{.module1}}}
cue mod publish v0.0.2
{{{end}}}

{{{end}}}


{{{with step}}}

Check use now works again

{{{with script "en" "check main 2"}}}
cd ../{{{.main}}}

# remove cue.mod directory and re-init as clean way to remove
# all declared depdendencies
rm -r cue.mod
cue mod init cue.example/{{{.main}}}

# This should now work again
cue mod tidy
cue export
{{{end}}}

{{{end}}}
