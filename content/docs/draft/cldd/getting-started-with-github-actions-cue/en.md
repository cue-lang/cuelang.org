---
title: 5 minutes with ... githubactions
draft: true
no_index: true
---

{{{with _script_ "en" "HIDDEN setup auth"}}}
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD
{{{end}}}

## Login to the Central Registry

{{{with script "en" "cue login"}}}
#norun
cue login
{{{end}}}

## Initialise your local CUE module

{{{with script "en" "cue mod init"}}}
cue mod init
{{{end}}}

## Create a CUE manifest

{{{with upload "en" "1"}}}
# Taken from https://docs.github.com/en/actions/use-cases-and-examples/creating-an-example-workflow#creating-an-example-workflow
-- workflow.cue --
package gha

import "github.com/cue-tmp/jsonschema-pub/exp1/githubactions"

githubactions.#Workflow & {

	name:       "learn-github-actions"
	"run-name": "${{ github.actor }} is learning GitHub Actions"
	on: ["push"]
	jobs: "check-bats-version": {
		"runs-on": "ubuntu-latest"
		steps: [
			{uses: "actions/checkout@v4"},
			{uses: "actions/setup-node@v4", with: "node-version": "20"},
			{run: "npm install -g bats"},
			{run: "bats -v"},
		]
	}
}
{{{end}}}

## Tidy your local CUE module

{{{with script "en" "tidy"}}}
cue mod tidy
{{{end}}}

## Validate and export your workflow as YAML

{{{with script "en" "export"}}}
cue vet .:gha
cue export .:gha --outfile workflow.yml
{{{end}}}

## Review your YAML workflow

{{{with script "en" "display"}}}
cat workflow.yml
{{{end}}}
