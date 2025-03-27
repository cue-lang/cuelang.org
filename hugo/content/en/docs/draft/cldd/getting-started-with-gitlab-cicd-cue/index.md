---
title: Getting started with GitLab CI/CD + CUE
---

The CUE
[Central Registry](https://registry.cue.works/)
provides a well-known location for well-known schemas, including those for
[YAML pipeline files](https://docs.gitlab.com/ci/yaml/)
used by [GitLab CI/CD](https://about.gitlab.com/solutions/continuous-integration/).

This guide shows you how to get started defining your GitLab CI/CD pipelines in CUE using
[curated modules]({{<relref"curated-modules-faq">}}).

## Login to the Central Registry

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2lu" }
$ cue login
```
The
[Central Registry](https://registry.cue.works)
requires authentication, so you need to login before you can use its schemas.

## Initialise your local CUE module

CUE that uses schemas and modules from the
[Central Registry](https://registry.cue.works)
needs to exist within its own CUE module.
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IGN1ZS5leGFtcGxl" }
$ cue mod init cue.example
```
You can choose any module name you like - it's easy to
[change it later](https://cuelang.org/docs/reference/command/cue-help-mod-rename/).
It makes sense for your CUE module to exist at the root of a git repository
that's hosted on GitLab, but the commands in this guide will work in any setup.

## Create a pipeline

Declare a GitLab pipeline in CUE. This one is based on an example from
[GitLab's documentation](https://docs.gitlab.com/user/project/pages/getting_started/pages_from_scratch/#specify-a-stage-to-deploy):

```cue { title="pipeline.cue" codeToCopy="cGFja2FnZSBjaWNkCgppbXBvcnQgInRlc3QuY3VlLndvcmtzL3gxL2dpdGxhYi9naXRsYWJjaSIKCnBpcGVsaW5lczogZXhhbXBsZTogZ2l0bGFiY2kuI1BpcGVsaW5lICYgewoJZGVmYXVsdDogaW1hZ2U6ICJydWJ5OjMuMiIKCXdvcmtmbG93OiBydWxlczogW3tpZjogIiRDSV9DT01NSVRfQlJBTkNIIn1dCgkiZGVwbG95LXBhZ2VzIjogewoJCXN0YWdlOiAiZGVwbG95IgoJCXNjcmlwdDogWwoJCQkiZ2VtIGluc3RhbGwgYnVuZGxlciIsCgkJCSJidW5kbGUgaW5zdGFsbCIsCgkJCSJidW5kbGUgZXhlYyBqZWt5bGwgYnVpbGQgLWQgcHVibGljIiwKCQldCgkJcGFnZXM6IHRydWUKCQlydWxlczogW3tpZjogIiRDSV9DT01NSVRfQlJBTkNIID09IFwibWFpblwiIn1dCgkJZW52aXJvbm1lbnQ6ICJwcm9kdWN0aW9uIgoJfQoJdGVzdDogewoJCXN0YWdlOiAidGVzdCIKCQlzY3JpcHQ6IFsKCQkJImdlbSBpbnN0YWxsIGJ1bmRsZXIiLAoJCQkiYnVuZGxlIGluc3RhbGwiLAoJCQkiYnVuZGxlIGV4ZWMgamVreWxsIGJ1aWxkIC1kIHRlc3QiLAoJCV0KCQlhcnRpZmFjdHM6IHBhdGhzOiBbInRlc3QiXQoJCXJ1bGVzOiBbe2lmOiAiJENJX0NPTU1JVF9CUkFOQ0ggIT0gXCJtYWluXCIifV0KCX0KfQo=" }
// filepath: pipeline.cue

package cicd

import "test.cue.works/x1/gitlab/gitlabci"

pipelines: example: gitlabci.#Pipeline & {
	default: image: "ruby:3.2"
	workflow: rules: [{if: "$CI_COMMIT_BRANCH"}]
	"deploy-pages": {
		stage: "deploy"
		script: [
			"gem install bundler",
			"bundle install",
			"bundle exec jekyll build -d public",
		]
		pages: true
		rules: [{if: "$CI_COMMIT_BRANCH == \"main\""}]
		environment: "production"
	}
	test: {
		stage: "test"
		script: [
			"gem install bundler",
			"bundle install",
			"bundle exec jekyll build -d test",
		]
		artifacts: paths: ["test"]
		rules: [{if: "$CI_COMMIT_BRANCH != \"main\""}]
	}
}
```

In later guides we'll add more entries to the `pipelines` struct.

The `import` at the top references the appropriate curated module for the pipeline.
Its path is currently temporary, but only while its proper location is being decided.
The temporary path isn't a problem because one important property of the
[Central Registry](https://registry.cue.works)
is that, once a schema is published, it will always be
available at that location.
When the curated module’s location is finalised and versions are published
under the new path, you can use the
[`cue refactor imports`](https://cuelang.org/docs/reference/command/cue-help-refactor-imports/)
command to update your CUE easily, so it reflects the new location.

## Tidy your local CUE module

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```
Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).
Always use
[`cue mod tidy`](https://cuelang.org/docs/reference/command/cue-help-mod-tidy/)
when you use a curated module for the first time.

## Validate your pipeline

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYw==" }
$ cue vet -c
```
Because `cue vet` doesn't display any errors, you know that the curated schema has validated your pipeline.

## Export your pipeline as YAML

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtLW91dGZpbGUgLmdpdGxhYi1jaS55bWwgLWUgcGlwZWxpbmVzLmV4YW1wbGU=" }
$ cue export --outfile .gitlab-ci.yml -e pipelines.example
```
If you chose to export the `pipelines.example` shown above,
your validated YAML pipeline will look like this:
```yml { title=".gitlab-ci.yml" codeToCopy="ZGVmYXVsdDoKICBpbWFnZTogcnVieTozLjIKd29ya2Zsb3c6CiAgcnVsZXM6CiAgICAtIGlmOiAkQ0lfQ09NTUlUX0JSQU5DSApkZXBsb3ktcGFnZXM6CiAgcnVsZXM6CiAgICAtIGlmOiAkQ0lfQ09NTUlUX0JSQU5DSCA9PSAibWFpbiIKICBzY3JpcHQ6CiAgICAtIGdlbSBpbnN0YWxsIGJ1bmRsZXIKICAgIC0gYnVuZGxlIGluc3RhbGwKICAgIC0gYnVuZGxlIGV4ZWMgamVreWxsIGJ1aWxkIC1kIHB1YmxpYwogIHN0YWdlOiBkZXBsb3kKICBlbnZpcm9ubWVudDogcHJvZHVjdGlvbgogIHBhZ2VzOiB0cnVlCnRlc3Q6CiAgcnVsZXM6CiAgICAtIGlmOiAkQ0lfQ09NTUlUX0JSQU5DSCAhPSAibWFpbiIKICBzY3JpcHQ6CiAgICAtIGdlbSBpbnN0YWxsIGJ1bmRsZXIKICAgIC0gYnVuZGxlIGluc3RhbGwKICAgIC0gYnVuZGxlIGV4ZWMgamVreWxsIGJ1aWxkIC1kIHRlc3QKICBzdGFnZTogdGVzdAogIGFydGlmYWN0czoKICAgIHBhdGhzOgogICAgICAtIHRlc3QK" }
# filepath: .gitlab-ci.yml

default:
  image: ruby:3.2
workflow:
  rules:
    - if: $CI_COMMIT_BRANCH
deploy-pages:
  rules:
    - if: $CI_COMMIT_BRANCH == "main"
  script:
    - gem install bundler
    - bundle install
    - bundle exec jekyll build -d public
  stage: deploy
  environment: production
  pages: true
test:
  rules:
    - if: $CI_COMMIT_BRANCH != "main"
  script:
    - gem install bundler
    - bundle install
    - bundle exec jekyll build -d test
  stage: test
  artifacts:
    paths:
      - test
```
## Run your pipeline

The `cue.mod` directory needs to be stored in your git repository, along with
your `pipeline.cue` and `.gitlab-ci.yml` files.
After recording them in a commit you can push your branch to GitLab and trigger
the pipeline.

Whenever you update your CUE pipeline, re-run the `cue export` command shown
above, and then use `git` to record any changes to these files and directories.
