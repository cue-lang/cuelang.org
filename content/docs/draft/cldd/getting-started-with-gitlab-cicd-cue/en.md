---
title: Getting started with GitLab CI/CD + CUE
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

The CUE
[Central Registry](https://registry.cue.works/)
provides a well-known location for well-known schemas, including those for
[YAML pipeline files](https://docs.gitlab.com/ci/yaml/)
used by [GitLab CI/CD](https://about.gitlab.com/solutions/continuous-integration/).

This guide shows you how to get started defining your GitLab CI/CD pipelines in CUE using
[curated modules]({{<relref"curated-modules-faq">}}).

## Login to the Central Registry

{{{with script "en" "cue login"}}}
#norun
cue login
{{{end}}}
The
[Central Registry](https://registry.cue.works)
requires authentication, so you need to login before you can use its schemas.

## Initialise your local CUE module

CUE that uses schemas and modules from the
[Central Registry](https://registry.cue.works)
needs to exist within its own CUE module.
{{{with script "en" "cue mod init"}}}
cue mod init cue.example
{{{end}}}
You can choose any module name you like - it's easy to
[change it later](https://cuelang.org/docs/reference/command/cue-help-mod-rename/).
It makes sense for your CUE module to exist at the root of a git repository
that's hosted on GitLab, but the commands in this guide will work in any setup.

## Create a pipeline

Declare a GitLab pipeline in CUE. This one is based on an example from
[GitLab's documentation](https://docs.gitlab.com/user/project/pages/getting_started/pages_from_scratch/#specify-a-stage-to-deploy):

{{{with upload "en" "1"}}}
-- pipeline.cue --
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
{{{end}}}

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

{{{with script "en" "tidy"}}}
cue mod tidy
{{{end}}}
Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).
Always use
[`cue mod tidy`](https://cuelang.org/docs/reference/command/cue-help-mod-tidy/)
when you use a curated module for the first time.

## Validate your pipeline

{{{with script "en" "vet"}}}
cue vet -c
{{{end}}}
Because `cue vet` doesn't display any errors, you know that the curated schema has validated your pipeline.

## Export your pipeline as YAML

{{{with script "en" "export"}}}
cue export --outfile .gitlab-ci.yml -e pipelines.example
{{{end}}}
{{{with _script_ "en" "HIDDEN: move before diff"}}}
mv .gitlab-ci.yml{,.got}
{{{end}}}

If you chose to export the `pipelines.example` shown above,
your validated YAML pipeline will look like this:
{{{with upload "en" "yaml"}}}
-- .gitlab-ci.yml --
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
{{{end}}}
{{{with _script_ "en" "HIDDEN: diff"}}}
diff -u .gitlab-ci.yml{,.got}
{{{end}}}

## Run your pipeline

The `cue.mod` directory needs to be stored in your git repository, along with
your `pipeline.cue` and `.gitlab-ci.yml` files.
After recording them in a commit you can push your branch to GitLab and trigger
the pipeline.

Whenever you update your CUE pipeline, re-run the `cue export` command shown
above, and then use `git` to record any changes to these files and directories.
