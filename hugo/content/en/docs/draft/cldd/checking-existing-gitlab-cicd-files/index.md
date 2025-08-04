---
title: Checking existing GitLab CI/CD files using CUE
---

The easiest way to start taking advantage of CUE's powerful validation is to
use it to check existing configuration files.
By adding this check to your development or deployment process
you can catch and fix errors before they affect downstream
systems.

This guide shows you how to use the `cue` command to validate a GitLab CI/CD
pipeline file using
[a curated module](../curated-module-gitlab-cicd/index.md) from the
CUE [Central Registry](https://registry.cue.works) -- all without writing any
schemas or policies in CUE.

<!--more-->

## Choose a GitLab CI/CD pipeline file

This example is adapted from
[GitLab's documentation](https://docs.gitlab.com/user/project/pages/getting_started/pages_from_scratch/#deploy-specific-branches-to-a-pages-site),
but you should use any pipeline file that's relevant to your situation.

``` { .yaml title="pipeline.yml" }
default:
  image: ruby:3.2
workflow:
  rules:
    - if: $CI_COMMIT_BRANCH
create-pages:
  script:
    - gem install bundler
    - bundle install
    - bundle exec jekyll build -d public
  pages: true
  rules:
    - if: $CI_COMMIT_BRANCH == "main"
```

## Validate the pipeline file

``` { .text title="TERMINAL" data-copy="cue vet -c -d &#39;#Pipeline&#39; cue.dev/x/gitlab/gitlabci@latest pipeline.yml" }
$ cue vet -c -d '#Pipeline' cue.dev/x/gitlab/gitlabci@latest pipeline.yml
```

This command uses the `#Pipeline` definition from the `gitlabci` package to
check the `pipeline.yml` file. Because `cue vet` doesn't display any errors,
you know that the curated module has validated your configuration file.

If you see an error message mentioning "too many requests" then
[login to the Central Registry](../login-central-registry/index.md)
and re-run this command.
The Central Registry allows more requests from authenticated users.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with GitLab CI/CD + CUE](../getting-started-with-gitlab-cicd-cue/index.md)
...
