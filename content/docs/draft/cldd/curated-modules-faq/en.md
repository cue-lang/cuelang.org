---
title: Curated Modules
draft: true
no_index: true
---

{{<warning>}}
This page is a work in progress -- your feedback is very welcome!
Please [report any issues]({{<report-issue-url>}}) you find.
{{</warning>}}

The CUE [Central Registry](https://registry.cue.works)
provides some carefully selected and curated
[CUE modules]({{<relref"docs/concept/modules">}}) that you can use to
create validated configurations across a range of popular projects and
services, or to check that your existing configurations are valid.

Here are some common questions that folks have asked about curated modules.
Please do join [the CUE community]({{<relref"community">}}) and ask us anything
you think we've missed!

## What curated modules are available?

The curated modules currently published cover:
- [Kubernetes](#kubernetes)
- [GitHub Actions](#github-actions)
- [GitLab CI/CD](#gitlab-cicd)
- [Buildkite Pipelines](#buildkite-pipelines)
- [Azure Pipelines](#azure-pipelines)
- [Argo Workflows](#argo-workflows)
- [Go Releaser](#go-releaser)
- [Docker Compose](#docker-compose)
- [npm's `package.json`](#npms-packagejson)

In the future, the search function of the Central Registry will be the easiest
way to discover suitable modules to use.

### Kubernetes
"*Kubernetes, also known as K8s, is an open source system for automating deployment, scaling, and management of containerized applications.*"
([kubernetes.io](https://kubernetes.io/))

Each package in this module is named after its respective Go source code package.
For example, to use the schemas defined in the Go package `k8s.io/api/core/v1` use the following:
{{{with code "en" "kubernetes"}}}
-- example.cue --
import "github.com/cue-tmp/jsonschema-pub/exp3/k8s.io/api/core/v1"
{{{end}}}
Learn more with:
- {{<linkto/inline"draft/cldd/getting-started-with-kubernetes-cue">}}
- {{<linkto/inline"draft/cldd/k8s-io-moving-from-cue-get-go-to-central-registry">}} by replacing existing `cue get go` schemas
- The Central Registry's [module documentation](https://registry.cue.works/docs/github.com/cue-tmp/jsonschema-pub/exp3/k8s.io@v0.1.0)

### GitHub Actions
"*GitHub Actions makes it easy to automate all your software workflows, now with world-class CI/CD: build, test, and deploy your code right from GitHub.*"
([github.com](https://github.com/features/actions))
{{{with code "en" "github"}}}
-- example.cue --
import "github.com/cue-tmp/jsonschema-pub/exp3/githubactions"
{{{end}}}
Learn more with:
- {{<linkto/inline"draft/cldd/checking-existing-github-actions-files">}}
- {{<linkto/inline"draft/cldd/getting-started-with-github-actions-cue">}}
- The Central Registry's [module documentation](https://registry.cue.works/docs/github.com/cue-tmp/jsonschema-pub/exp3/githubactions@v0.2.0)

### GitLab CI/CD
"*GitLab’s complete CI/CD solution that accelerates delivery with automation.*"
([gitlab.com](https://about.gitlab.com/solutions/continuous-integration/))
{{{with code "en" "gitlab"}}}
-- example.cue --
import "github.com/cue-tmp/jsonschema-pub/exp3/gitlab/gitlabci"
{{{end}}}
Learn more with:
- {{<linkto/inline"draft/cldd/checking-existing-gitlab-cicd-files">}}
- {{<linkto/inline"draft/cldd/getting-started-with-gitlab-cicd-cue">}}
- The Central Registry's [module documentation](https://registry.cue.works/docs/github.com/cue-tmp/jsonschema-pub/exp3/gitlab@v0.2.0)

### Buildkite Pipelines
"*An advanced, scalable, and composable workflow orchestration engine that enables blazing fast delivery at any scale.*"
([buildkite.com](https://buildkite.com/))
{{{with code "en" "buildkite"}}}
-- example.cue --
import "github.com/cue-tmp/jsonschema-pub/exp3/buildkite"
{{{end}}}
Learn more with:
- {{<linkto/inline"draft/cldd/checking-existing-buildkite-pipelines-files">}}
- {{<linkto/inline"draft/cldd/getting-started-with-buildkite-cue">}}
- The Central Registry's [module documentation](https://registry.cue.works/docs/github.com/cue-tmp/jsonschema-pub/exp3/buildkite@v0.1.0)

### Azure Pipelines
"*Continuously build, test, and deploy to any platform and cloud.*"
([azure.microsoft.com](https://azure.microsoft.com/en-us/products/devops/pipelines/))
{{{with code "en" "azure"}}}
-- example.cue --
import "github.com/cue-tmp/jsonschema-pub/exp3/azurepipelines"
{{{end}}}
Learn more with:
- {{<linkto/inline"draft/cldd/getting-started-with-azure-pipelines-cue">}}
- The Central Registry's [module documentation](https://registry.cue.works/docs/github.com/cue-tmp/jsonschema-pub/exp3/azurepipelines@v0.1.0)

### Argo Workflows
"*An open source container-native workflow engine for orchestrating parallel jobs on Kubernetes.*"
([argo-workflows.readthedocs.io](https://argo-workflows.readthedocs.io/en/latest/))

We're aware that this module's import path is slightly unsuitable.
It will be updated soon, but is safe to use as-is:
{{{with code "en" "argo"}}}
-- example.cue --
import argoworkflows "github.com/cue-tmp/jsonschema-pub/exp3/argocd"
{{{end}}}
Learn more with:
- {{<linkto/inline"draft/cldd/checking-existing-argo-workflows-files">}}
- {{<linkto/inline"draft/cldd/getting-started-with-argo-workflows-cue">}}
- The Central Registry's [module documentation](https://registry.cue.works/docs/github.com/cue-tmp/jsonschema-pub/exp3/argocd@v0.0.0)

### Go Releaser
"*GoReleaser does everything you need to create a professional release process for Go, Rust, and Zig projects.*"
([goreleaser.com](https://goreleaser.com/))
{{{with code "en" "goreleaser"}}}
-- example.cue --
import "github.com/cue-tmp/jsonschema-pub/exp3/goreleaser"
{{{end}}}
Learn more with:
- {{<linkto/inline"draft/cldd/getting-started-with-goreleaser-cue">}}
- The Central Registry's [module documentation](https://registry.cue.works/docs/github.com/cue-tmp/jsonschema-pub/exp3/goreleaser@v0.2.0)

### Docker Compose
"*A specification for developer-centric application definition used in Cloud Native Applications.*"
([compose-spec.io](https://compose-spec.io/))
{{{with code "en" "compose"}}}
-- example.cue --
import "github.com/cue-tmp/jsonschema-pub/exp3/dockercompose"
{{{end}}}
Learn more with:
- {{<linkto/inline"draft/cldd/getting-started-with-docker-compose-cue">}}
- The Central Registry's [module documentation](https://registry.cue.works/docs/github.com/cue-tmp/jsonschema-pub/exp3/dockercompose@v0.1.0)

### npm's `package.json`
"*npm is the standard package manager for Node.js.*"
([nodejs.org](https://nodejs.org/en/learn/getting-started/an-introduction-to-the-npm-package-manager))
{{{with code "en" "npmpackage"}}}
-- example.cue --
import "github.com/cue-tmp/jsonschema-pub/exp3/npmpackage"
{{{end}}}
Learn more with:
- [Specifics of npm's package.json handling](https://docs.npmjs.com/cli/v11/configuring-npm/package-json)
<!-- TODO: link to Central Registry when docs pages don't break on modules that have dependencies. -->

## Why are curated modules published in a temporary namespace?

Well spotted! The import paths you *currently* need to use for a curated module
include a `cue-tmp/jsonschema-pub/exp3` component.
This definitely looks a bit
"temporary" - which it is, but only while the proper namespace is being
decided.

At some point in the future the curated modules will be published in
their proper namespace. But you can rest easy, because one important property
of the
[Central Registry](https://registry.cue.works)
is that, once a schema is published, it will always be available at that
location. Your CUE can rely on the "temporary" paths mentioned on this page for
as long as you like. When the proper namespace is decided, you can then easily
use the
[`cue refactor imports`]({{<relref"docs/reference/command/cue-help-refactor-imports">}})
command to update your CUE.

## What do I need to use a curated module?

You'll need to authenticate to the CUE
[Central Registry](https://registry.cue.works).
We also suggest that you upgrade to
[the latest version]({{<relref"docs/introduction/installation">}})
of CUE so that you can switch to the new evaluator.
All curated modules are tested using `evalv3`, so its use is strongly recommended.
Many questions about `evalv3` are answered in
{{<linkto/inline"concept/faq/upgrading-from-evalv2-to-evalv3">}} -- and if you
have an unanswered question, please join
[the CUE community]({{<relref"community">}}) and ask for help!
