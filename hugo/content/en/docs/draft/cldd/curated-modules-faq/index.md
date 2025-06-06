---
title: Curated Modules
---

The CUE [Central Registry](https://registry.cue.works)
provides some carefully selected and curated
[CUE modules](https://cuelang.org/docs/concept/modules/) that you can use to
create validated configurations across a range of popular projects and
services, or to check that your existing configurations are valid.

Here are some common questions that folks have asked about curated modules.
Please do join [the CUE community](https://cuelang.org/community/) and ask us anything
you think we've missed!

<!--more-->

## What curated modules are available?

The curated modules currently published cover:
- [Kubernetes](#kubernetes)
- [GitHub Actions](#github-actions)
- [GitLab CI/CD](#gitlab-cicd)
- [Buildkite Pipelines](#buildkite-pipelines)
- [Azure Pipelines](#azure-pipelines)
- [Argo Workflows](#argo-workflows)
- [GoReleaser](#goreleaser)
- [Docker Compose](#docker-compose)
- [npm's `package.json`](#npms-packagejson)

In the future, the search function of the Central Registry will be the easiest
way to discover suitable modules to use.

### Kubernetes
"*Kubernetes, also known as K8s, is an open source system for automating deployment, scaling, and management of containerized applications.*"
([kubernetes.io](https://kubernetes.io/))

Each package in this module is named after its respective Go source code package.
For example, to use the schemas defined in the Go package `k8s.io/api/core/v1` use the following:
```cue
import "cue.dev/x/k8s.io/api/core/v1"
```
Learn more with:
- [Getting started with Kubernetes + CUE]({{<relref"getting-started-with-kubernetes-cue">}})
- [Migrating to the Central Registry's curated Kubernetes Schemas]({{<relref"k8s-io-moving-from-cue-get-go-to-central-registry">}}) by replacing existing `cue get go` schemas
- The Central Registry's per-package documentation - e.g.
  [`api/core/v1`](https://registry.cue.works/docs/cue.dev/x/k8s.io/api/core/v1)

### GitHub Actions
"*GitHub Actions makes it easy to automate all your software workflows, now with world-class CI/CD: build, test, and deploy your code right from GitHub.*"
([github.com](https://github.com/features/actions))
```cue
import "cue.dev/x/githubactions"
```
Learn more with:
- [Checking existing GitHub Actions files using CUE]({{<relref"checking-existing-github-actions-files">}})
- [Getting started with GitHub Actions + CUE]({{<relref"getting-started-with-github-actions-cue">}})
- The Central Registry's [module documentation](https://registry.cue.works/docs/cue.dev/x/githubactions)

### GitLab CI/CD
"*GitLab’s complete CI/CD solution that accelerates delivery with automation.*"
([gitlab.com](https://about.gitlab.com/solutions/continuous-integration/))
```cue
import "cue.dev/x/gitlab/gitlabci"
```
Learn more with:
- [Checking existing GitLab CI/CD files using CUE]({{<relref"checking-existing-gitlab-cicd-files">}})
- [Getting started with GitLab CI/CD + CUE]({{<relref"getting-started-with-gitlab-cicd-cue">}})
- The Central Registry's [module documentation](https://registry.cue.works/docs/cue.dev/x/gitlab/gitlabci)

### Buildkite Pipelines
"*An advanced, scalable, and composable workflow orchestration engine that enables blazing fast delivery at any scale.*"
([buildkite.com](https://buildkite.com/))
```cue
import "cue.dev/x/buildkite"
```
Learn more with:
- [Checking existing Buildkite Pipelines files using CUE]({{<relref"checking-existing-buildkite-pipelines-files">}})
- [Getting started with Buildkite + CUE]({{<relref"getting-started-with-buildkite-cue">}})
- The Central Registry's [module documentation](https://registry.cue.works/docs/cue.dev/x/buildkite)

### Azure Pipelines
"*Continuously build, test, and deploy to any platform and cloud.*"
([azure.microsoft.com](https://azure.microsoft.com/en-us/products/devops/pipelines/))
```cue
import "cue.dev/x/azurepipelines"
```
Learn more with:
- [Checking existing Azure Pipelines files using CUE]({{<relref"checking-existing-azure-pipelines-files">}})
- [Getting started with Azure Pipelines + CUE]({{<relref"getting-started-with-azure-pipelines-cue">}})
- The Central Registry's [module documentation](https://registry.cue.works/docs/cue.dev/x/azurepipelines)

### Argo Workflows
"*An open source container-native workflow engine for orchestrating parallel jobs on Kubernetes.*"
([argo-workflows.readthedocs.io](https://argo-workflows.readthedocs.io/en/latest/))

We're aware that this module's import path is slightly unsuitable.
It will be updated soon, but is safe to use as-is:
```cue
import argoworkflows "cue.dev/x/argocd"
```
Learn more with:
- [Checking existing Argo Workflows files using CUE]({{<relref"checking-existing-argo-workflows-files">}})
- [Getting started with Argo Workflows + CUE]({{<relref"getting-started-with-argo-workflows-cue">}})
- The Central Registry's [module documentation](https://registry.cue.works/docs/cue.dev/x/argocd)

### GoReleaser
"*GoReleaser does everything you need to create a professional release process for Go, Rust, and Zig projects.*"
([goreleaser.com](https://goreleaser.com/))
```cue
import "cue.dev/x/goreleaser"
```
Learn more with:
- [Checking existing GoReleaser files using CUE]({{<relref"checking-existing-goreleaser-files">}})
- [Getting started with GoReleaser + CUE]({{<relref"getting-started-with-goreleaser-cue">}})
- The Central Registry's [module documentation](https://registry.cue.works/docs/cue.dev/x/goreleaser)

### Docker Compose
"*A specification for developer-centric application definition used in Cloud Native Applications.*"
([compose-spec.io](https://compose-spec.io/))
```cue
import "cue.dev/x/dockercompose"
```
Learn more with:
- [Checking existing Docker Compose files using CUE]({{<relref"checking-existing-docker-compose-files">}})
- [Getting started with Docker Compose + CUE]({{<relref"getting-started-with-docker-compose-cue">}})
- The Central Registry's [module documentation](https://registry.cue.works/docs/cue.dev/x/dockercompose)

### npm's `package.json`
"*npm is the standard package manager for Node.js.*"
([nodejs.org](https://nodejs.org/en/learn/getting-started/an-introduction-to-the-npm-package-manager))
```cue
import "cue.dev/x/npmpackage"
```
Learn more with:
- [Specifics of npm's package.json handling](https://docs.npmjs.com/cli/v11/configuring-npm/package-json)
<!-- TODO: link to Central Registry when docs pages don't break on modules that have dependencies. -->

## Why are curated modules published in a temporary namespace?

Well spotted! The import path you *currently* need to use for a curated module
includes a `cue.dev/x` component.
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
[`cue refactor imports`](https://cuelang.org/docs/reference/command/cue-help-refactor-imports/)
command to update your CUE.

## What do I need to use a curated module?

You'll need to authenticate to the CUE
[Central Registry](https://registry.cue.works).
We also suggest that you upgrade to
[the latest version](https://cuelang.org/docs/introduction/installation/)
of CUE so that you can switch to the new evaluator.
All curated modules are tested using `evalv3`, so its use is strongly recommended.
Many questions about `evalv3` are answered in
[Upgrading from evalv2 to evalv3](https://cuelang.org/docs/concept/faq/upgrading-from-evalv2-to-evalv3/)
-- and if you have an unanswered question, please join
[the CUE community](https://cuelang.org/community/) and ask for help!
