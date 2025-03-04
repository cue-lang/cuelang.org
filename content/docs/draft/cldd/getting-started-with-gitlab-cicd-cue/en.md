---
title: Getting started with GitLab CI/CD + CUE
draft: true
no_index: true
---

{{{with _script_ "en" "HIDDEN setup"}}}
# Registry auth
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD
# Local git repo
git config --global user.email 'user@cue.example'
git config --global user.name user
git init -q
{{{end}}}
{{{with _upload_ "en" "gitignore"}}}
#nofmt
-- .gitignore --
/.cache/
/.config/
/.gitconfig
/.pipeline.yml
/.gitignore
{{{end}}}

The CUE
[Central Registry](https://registry.cue.works/)
provides a well-known location for well-known schemas, including those for
[YAML pipeline files](https://docs.gitlab.com/ci/yaml/)
used by [GitLab CI/CD](https://about.gitlab.com/solutions/continuous-integration/).

This guide shows you how to get started defining your GitLab CI/CD pipelines in CUE.

## Login to the Central Registry
{{{with script "en" "cue login"}}}
#norun
cue login
{{{end}}}
The
[Central Registry](https://registry.cue.works)
requires authentication, so you need to login before you can use its schemas.

## Initialise your local CUE module
{{{with script "en" "cue mod init"}}}
cue mod init
{{{end}}}
CUE that uses schemas and modules from the
[Central Registry](https://registry.cue.works)
needs to exist
within its own CUE module. You can choose any module name you like - it's easy to
[change it later]({{<relref"docs/reference/command/cue-help-mod-rename">}}).

It makes sense for your CUE module to exist at the root of a git repository
that's hosted on GitLab. Other setups are possible, but this guide assumes that
you're running these commands from the top level directory of a git repository.

## Create a CUE pipeline
{{{with upload "en" "1"}}}
# Taken from https://docs.gitlab.com/user/project/pages/getting_started/pages_from_scratch/#specify-a-stage-to-deploy
-- pipeline.cue --
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
{{{end}}}
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
{{{with script "en" "tidy"}}}
cue mod tidy
{{{end}}}
Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).
Always use
[`cue mod tidy`]({{<relref"docs/reference/command/cue-help-mod-tidy">}})
when you use a curated module for the first time.

## Validate your pipeline
{{{with script "en" "vet"}}}
cue vet -c
{{{end}}}
Because `cue vet` doesn't display any errors, you know that the curated schema has validated your pipeline.

## Export your pipeline as YAML
{{{with script "en" "export"}}}
cue export --outfile .gitlab-ci.yml
{{{end}}}
{{{with _script_ "en" "HIDDEN: move"}}}
mv .gitlab-ci.yml .pipeline.yml
{{{end}}}
If you used the example pipeline from above, your validated YAML pipeline will look like this:
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
diff .gitlab-ci.yml .pipeline.yml
{{{end}}}

## Record your new files in git
These files need to be stored in your git repository:
{{{with script "en" "git commit"}}}
git add -v cue.mod .gitlab-ci.yml pipeline.cue
git commit -q -m 'Add GitLab CI/CD pipeline validated by CUE'
{{{end}}}
{{{with _script_ "en" "HIDDEN: clean git state"}}}
# This checks that the preceding git commands didn't miss any user-visible files generated by the rest of the page.
test -z "$(git status --porcelain)" || (git status; git --no-pager diff; false)
{{{end}}}
Each time you update your CUE pipeline, re-run the `cue export` command from
above, and then use `git` to record any changes to these files.

## Run your pipeline
Push your repository and its new pipeline to GitLab:
{{{with script "en" "git push"}}}
#norun
git push origin
{{{end}}}
The outcome of your pipeline will be visible under the repository's "Build" tab on GitLab.
