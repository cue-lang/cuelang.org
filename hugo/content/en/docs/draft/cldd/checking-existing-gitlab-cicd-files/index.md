---
title: Checking existing GitLab CI/CD files using CUE
draft: true
no_index: true
---

The easiest way to start taking advantage of CUE's powerful validation is to
use it to check existing configuration files.
By adding this check to your development or deployment process
you can catch and fix errors before they affect downstream
systems.

This guide shows you how to use the `cue` command to validate a GitLab CI/CD
pipeline file using a
[curated module](https://cuelang.org/docs/draft/cldd/curated-modules-faq/) from the
CUE [Central Registry](https://registry.cue.works) -- all without writing any
schemas or policies in CUE.

## Login to the Central Registry

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2lu" }
$ cue login
```
The
[Central Registry](https://registry.cue.works)
requires authentication, so you need to login before you can use its modules.

## Choose a GitLab CI/CD pipeline file

This example is adapted from
[GitLab's documentation](https://docs.gitlab.com/user/project/pages/getting_started/pages_from_scratch/#deploy-specific-branches-to-a-pages-site),
but you should use any pipeline file that's relevant to your situation.

```yml { title="pipeline.yml" codeToCopy="ZGVmYXVsdDoKICBpbWFnZTogcnVieTozLjIKd29ya2Zsb3c6CiAgcnVsZXM6CiAgICAtIGlmOiAkQ0lfQ09NTUlUX0JSQU5DSApjcmVhdGUtcGFnZXM6CiAgc2NyaXB0OgogICAgLSBnZW0gaW5zdGFsbCBidW5kbGVyCiAgICAtIGJ1bmRsZSBpbnN0YWxsCiAgICAtIGJ1bmRsZSBleGVjIGpla3lsbCBidWlsZCAtZCBwdWJsaWMKICBwYWdlczogdHJ1ZQogIHJ1bGVzOgogICAgLSBpZjogJENJX0NPTU1JVF9CUkFOQ0ggPT0gIm1haW4iCg==" }
# filepath: pipeline.yml

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

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAtZCAnI1BpcGVsaW5lJyB0ZXN0LmN1ZS53b3Jrcy94MS9naXRsYWIvZ2l0bGFiY2lAbGF0ZXN0IHBpcGVsaW5lLnltbA==" }
$ cue vet -c -d '#Pipeline' test.cue.works/x1/gitlab/gitlabci@latest pipeline.yml
```

This command uses the `#Pipeline` definition from the `gitlabci` package to
check the `pipeline.yml` file. Because `cue vet` doesn't display any errors,
you know that the curated module has validated your configuration file.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with GitLab CI/CD + CUE]({{<relref"getting-started-with-gitlab-cicd-cue">}})
...
