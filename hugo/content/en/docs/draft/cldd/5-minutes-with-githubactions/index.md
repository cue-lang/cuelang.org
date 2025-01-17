---
title: 5 minutes with ... githubactions
draft: true
no_index: true
---

## Login to the Central Registry

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2lu" }
$ cue login
```

## Initialise your local CUE module

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0" }
$ cue mod init
```

## Create a CUE manifest

{{< code-tabs >}}
{{< code-tab name="workflow.cue" language="cue" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}

## Tidy your local CUE module

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```

## Validate and export your workflow as YAML

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAuOmdoYQpjdWUgZXhwb3J0IC46Z2hhIC0tb3V0ZmlsZSB3b3JrZmxvdy55bWw=" }
$ cue vet .:gha
$ cue export .:gha --outfile workflow.yml
```

## Review your YAML workflow

```text { title="TERMINAL" type="terminal" codeToCopy="Y2F0IHdvcmtmbG93LnltbA==" }
$ cat workflow.yml
name: learn-github-actions
"on":
  - push
jobs:
  check-bats-version:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: "20"
      - run: npm install -g bats
      - run: bats -v
run-name: ${{ github.actor }} is learning GitHub Actions
```
