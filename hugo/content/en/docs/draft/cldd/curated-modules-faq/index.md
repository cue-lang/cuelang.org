---
title: Curated Modules
draft: true
no_index: true
---

{{<warning>}}
This page is a work in progress -- your feedback is very welcome!
Please
[report any issues](https://github.com/cue-lang/cue/issues/new?labels=Triage,NeedsInvestigation,cuelang.org&title=cuelang.org:%20&body=%23%23%23+What+page+were+you+looking+at%3F%0A%0Ahttp%3A%2F%2Ftip.cuelang.org%2Fdocs%2Fdraft%2Fcldd%2Fcurated-modules-faq%2F%0A%0A%23%23%23+What+did+you+do%3F%0A%0A%0A%0A%23%23%23+What+did+you+expect%3F%0A%0A%0A%0A%23%23%23+What+did+you+see+instead%3F%0A%0A)
you find.
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
- [GitLab CI](#gitlab-ci)
- [Buildkite](#buildkite)
- [Azure Pipelines](#azure-pipelines)
- [Argo CD](#argo-cd)
- [Go Releaser](#go-releaser)
- [Docker Compose](#docker-compose)
- [npm's `package.json`](#npms-packagejson)

In the future, the search function of the Central Registry will be the easiest
way to discover suitable modules to use.

### Kubernetes
*Kubernetes, also known as K8s, is an open source system for automating deployment, scaling, and management of containerized applications.*
([kubernetes.io](https://kubernetes.io/))

Curated module import path: `github.com/cue-tmp/jsonschema-pub/exp3/k8s.io`.
Learn more with:
- {{<linkto/inline"draft/cldd/getting-started-with-kubernetes-cue">}}
- {{<linkto/inline"draft/cldd/k8s-io-moving-from-cue-get-go-to-central-registry">}} by replacing existing `cue get go` schemas
- The Central Registry's [module documentation](https://registry.cue.works/docs/github.com/cue-tmp/jsonschema-pub/exp3/k8s.io@v0.1.0)

### GitHub Actions
*GitHub Actions makes it easy to automate all your software workflows, now with world-class CI/CD: build, test, and deploy your code right from GitHub.*
([github.com](https://github.com/features/actions))

Curated module import path: `github.com/cue-tmp/jsonschema-pub/exp3/githubactions`.
Learn more with:
- The Central Registry's [module documentation](https://registry.cue.works/docs/github.com/cue-tmp/jsonschema-pub/exp3/githubactions@v0.6.0)

### GitLab CI
*GitLab’s complete CI/CD solution that accelerates delivery with automation.*
([gitlab.com](https://about.gitlab.com/solutions/continuous-integration/))

Curated module import path: `github.com/cue-tmp/jsonschema-pub/exp3/gitlab`.
Learn more with:
- The Central Registry's [module documentation](https://registry.cue.works/docs/github.com/cue-tmp/jsonschema-pub/exp3/gitlab@v0.2.0)

### Buildkite Pipelines
*An advanced, scalable, and composable workflow orchestration engine that enables blazing fast delivery at any scale.*
([buildkite.com](https://buildkite.com/))

Curated module import path: `github.com/cue-tmp/jsonschema-pub/exp3/buildkite`.
Learn more with:
- The Central Registry's [module documentation](https://registry.cue.works/docs/github.com/cue-tmp/jsonschema-pub/exp3/buildkite@v0.0.0)

### Azure Pipelines
*Continuously build, test, and deploy to any platform and cloud.*
([azure.microsoft.com](https://azure.microsoft.com/en-us/products/devops/pipelines/))

Curated module import path: `github.com/cue-tmp/jsonschema-pub/exp3/azurepipelines`.
Learn more with:
- The Central Registry's [module documentation](https://registry.cue.works/docs/github.com/cue-tmp/jsonschema-pub/exp3/azurepipelines@v0.0.0)

### Argo CD
*A declarative, GitOps continuous delivery tool for Kubernetes.*
([argo-cd.readthedocs.io](https://argo-cd.readthedocs.io/en/stable/))

Curated module import path: `github.com/cue-tmp/jsonschema-pub/exp3/argocd`.
Learn more with:
- The Central Registry's [module documentation](https://registry.cue.works/docs/github.com/cue-tmp/jsonschema-pub/exp3/argocd@v0.0.0)

### Go Releaser
*GoReleaser does everything you need to create a professional release process for Go, Rust, and Zig projects.*
([goreleaser.com](https://goreleaser.com/))

Curated module import path: `github.com/cue-tmp/jsonschema-pub/exp3/goreleaser`.
Learn more with:
- The Central Registry's [module documentation](https://registry.cue.works/docs/github.com/cue-tmp/jsonschema-pub/exp3/goreleaser@v0.1.0)

### Docker Compose
*A specification for developer-centric application definition used in Cloud Native Applications.*
([compose-spec.io](https://compose-spec.io/))

Curated module import path: `github.com/cue-tmp/jsonschema-pub/exp3/dockercompose`.
Learn more with:
- The Central Registry's [module documentation](https://registry.cue.works/docs/github.com/cue-tmp/jsonschema-pub/exp3/dockercompose@v0.0.0)

### npm's `package.json`
*npm is the standard package manager for Node.js.*
([nodejs.org](https://nodejs.org/en/learn/getting-started/an-introduction-to-the-npm-package-manager))

Curated module import path: `github.com/cue-tmp/jsonschema-pub/exp3/npmpackage`.
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

You'll need an account on the CUE
[Central Registry](https://registry.cue.works), and we also suggest
that you upgrade to
[the latest version]({{<relref"docs/introduction/installation">}})
of CUE so that you can switch to the new evaluator.
All curated modules are tested using `evalv3`, so its use is strongly recommended.
Many questions about `evalv3` are answered in
{{<linkto/inline"concept/faq/upgrading-from-evalv2-to-evalv3">}} -- and if you
have an unanswered question, please join
[the CUE community]({{<relref"community">}}) and ask for help!
