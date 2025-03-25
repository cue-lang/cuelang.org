---
title: Spotting errors earlier in GitLab CI/CD files
draft: true
no_index: true
---

An easy first step with CUE is shown in
[Checking existing GitLab CI/CD files using CUE]({{<relref"checking-existing-gitlab-cicd-files">}}).
There, we see the happy path of using `cue vet` to confirm that one of our
existing GitLab CI/CD pipeline files is valid.
But what does it look like when one of our manually maintained pipeline files
isn't valid?
How does CUE help us catch errors early, before they've had the chance to move
further downstream and waste time, resources, and focus?

This guide shows what happens when the `cue vet` command finds a problem with a
GitLab CI/CD pipeline file using a
[curated module](/getting-started/gitlab-ci-cd-pipelines/) from the
CUE [Central Registry](https://registry.cue.works),
and how it highlights the data we need to fix.

## Login to the Central Registry

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2luICMgb25seSBkdXJpbmcgYmV0YQ==" }
$ cue login # only during beta
```
The
[Central Registry](https://registry.cue.works)
requires authentication while it’s in beta testing,
so we need to login before using its modules.

## A broken pipeline file

This example is adapted from
[GitLab's documentation](https://docs.gitlab.com/user/project/pages/getting_started/pages_from_scratch/#deploy-specific-branches-to-a-pages-site)
-- but the deliberate errors introduced here aren't part of the original file,
of course!

```yml { title="pipeline.yml" codeToCopy="ZGVmYXVsdDoKICBpbWFnZTogcnVieTozLjIKd29ya2Zsb3c6CiAgcnVsZXM6CiAgICAtIGlmOiAkQ0lfQ09NTUlUX0JSQU5DSApjcmVhdGUtcGFnZXM6CiAgc2NyaXB0czoKICAgIC0gZ2VtIGluc3RhbGwgYnVuZGxlcgogICAgLSBidW5kbGUgaW5zdGFsbAogICAgLSBidW5kbGUgZXhlYyBqZWt5bGwgYnVpbGQgLWQgcHVibGljCiAgcGFnZXM6IHRydWUKICBydWxlczoKICAgIC0gaWY6ICRDSV9DT01NSVRfQlJBTkNIID09ICJtYWluIgo=" }
# filepath: pipeline.yml

default:
  image: ruby:3.2
workflow:
  rules:
    - if: $CI_COMMIT_BRANCH
create-pages:
  scripts:
    - gem install bundler
    - bundle install
    - bundle exec jekyll build -d public
  pages: true
  rules:
    - if: $CI_COMMIT_BRANCH == "main"
```

## Validate the pipeline file

We use `cue vet` to validate `pipeline.yml` against the `gitlabci` package's `#Pipeline` definition:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAtZCAnI1BpcGVsaW5lJyBjdWUuZGV2L3gvZ2l0bGFiL2dpdGxhYmNpQGxhdGVzdCBwaXBlbGluZS55bWw=" }
$ cue vet -c -d '#Pipeline' cue.dev/x/gitlab/gitlabci@latest pipeline.yml
"create-pages".scripts: field not allowed:
    .cache/cue/mod/extract/cue.dev/x/gitlab@v0.0.0/gitlabci/schema.cue:295:17
    ./pipeline.yml:7:3
```

The `cue vet` command shows us the error (`"create-pages".scripts: field not
allowed:`), and tells us the location of the problem (line 7 of our data file).

## Fix the pipeline file

From the `cue vet` error message we know that the `scripts` field isn't permitted.
We check the GitLab CI/CD documentation (or perhaps we review the most recent
change made to the pipeline file in our version control system) and discover
that the field should actually be named `script`.

We fix our pipeline file by updating the highlighted line that `cue vet`
mentioned, so that the file becomes:

```yml { title="pipeline.yml" codeToCopy="ZGVmYXVsdDoKICBpbWFnZTogcnVieTozLjIKd29ya2Zsb3c6CiAgcnVsZXM6CiAgICAtIGlmOiAkQ0lfQ09NTUlUX0JSQU5DSApjcmVhdGUtcGFnZXM6CiAgc2NyaXB0OgogICAgLSBnZW0gaW5zdGFsbCBidW5kbGVyCiAgICAtIGJ1bmRsZSBpbnN0YWxsCiAgICAtIGJ1bmRsZSBleGVjIGpla3lsbCBidWlsZCAtZCBwdWJsaWMKICBwYWdlczogdHJ1ZQogIHJ1bGVzOgogICAgLSBpZjogJENJX0NPTU1JVF9CUkFOQ0ggPT0gIm1haW4iCg==" hl_lines=9 }
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

## Re-validate the pipeline file

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAtZCAnI1BpcGVsaW5lJyBjdWUuZGV2L3gvZ2l0bGFiL2dpdGxhYmNpQGxhdGVzdCBwaXBlbGluZS55bWw=" }
$ cue vet -c -d '#Pipeline' cue.dev/x/gitlab/gitlabci@latest pipeline.yml
```

We know that the curated module has validated our file this time because `cue
vet` doesn't display any errors.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with GitLab CI/CD + CUE]({{<relref"getting-started-with-gitlab-cicd-cue">}})
...
