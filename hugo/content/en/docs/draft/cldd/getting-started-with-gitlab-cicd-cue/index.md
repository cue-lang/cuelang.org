---
title: Getting started with GitLab CI/CD + CUE
draft: true
no_index: true
---

{{<info>}}
Curated modules are a work in progress and your feedback is important!
Please [report any issues]({{<report-issue-url>}}) you find.
{{</info>}}

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
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0" }
$ cue mod init
```
CUE that uses schemas and modules from the
[Central Registry](https://registry.cue.works)
needs to exist
within its own CUE module. You can choose any module name you like - it's easy to
[change it later]({{<relref"docs/reference/command/cue-help-mod-rename">}}).

It makes sense for your CUE module to exist at the root of a git repository
that's hosted on GitLab. Other setups are possible, but this guide assumes that
you're running these commands from the top level directory of a git repository.

## Create a CUE pipeline
{{< code-tabs >}}
{{< code-tab name="pipeline.cue" language="cue" area="top-left" >}}
package cicd

import "github.com/cue-tmp/jsonschema-pub/exp3/gitlab/gitlabci"

gitlabci.#Pipeline & {
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
{{< /code-tab >}}{{< /code-tabs >}}
The `import` at the top references the appropriate curated module for the pipeline.
Its path is currently temporary, but only while its proper location is being decided.
The temporary path isn't a problem because one important property of the
[Central Registry](https://registry.cue.works)
is that, once a schema is published, it will always be
available at that location.
When the curated module’s location is finalised and versions are published
under the new path, you can use the
[`cue refactor imports`]({{<relref"docs/reference/command/cue-help-refactor-imports">}})
command to update your CUE easily, so it reflects the new location.

## Tidy your local CUE module
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```
Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).
Always use
[`cue mod tidy`]({{<relref"docs/reference/command/cue-help-mod-tidy">}})
when you use a curated module for the first time.

## Validate your pipeline
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYw==" }
$ cue vet -c
```
Because `cue vet` doesn't display any errors, you know that the curated schema has validated your pipeline.

## Export your pipeline as YAML
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtLW91dGZpbGUgLmdpdGxhYi1jaS55bWw=" }
$ cue export --outfile .gitlab-ci.yml
```
If you used the example pipeline from above, your validated YAML pipeline will look like this:
{{< code-tabs >}}
{{< code-tab name=".gitlab-ci.yml" language="yml" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}
## Record your new files in git
These files need to be stored in your git repository:
```text { title="TERMINAL" type="terminal" codeToCopy="Z2l0IGFkZCAtdiBjdWUubW9kIC5naXRsYWItY2kueW1sIHBpcGVsaW5lLmN1ZQpnaXQgY29tbWl0IC1xIC1tICdBZGQgR2l0TGFiIENJL0NEIHBpcGVsaW5lIHZhbGlkYXRlZCBieSBDVUUn" }
$ git add -v cue.mod .gitlab-ci.yml pipeline.cue
add '.gitlab-ci.yml'
add 'cue.mod/module.cue'
add 'pipeline.cue'
$ git commit -q -m 'Add GitLab CI/CD pipeline validated by CUE'
```
Each time you update your CUE pipeline, re-run the `cue export` command from
above, and then use `git` to record any changes to these files.

## Run your pipeline
Push your repository and its new pipeline to GitLab:
```text { title="TERMINAL" type="terminal" codeToCopy="Z2l0IHB1c2ggb3JpZ2lu" }
$ git push origin
```
The outcome of your pipeline will be visible under the repository's "Build" tab on GitLab.
