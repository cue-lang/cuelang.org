---
title: Integrations
weight: 25
toc_hide: false
index_hide: true
aliases:
- /docs/integration/
---

## Encodings and languages

CUE has first-class support for a growing range of formats and ecosystems:

{{< cards >}}
{{< card
    title="JSON"
    href="/docs/concept/how-cue-works-with-json/"
    label="Learn more"
 >}}

CUE reads, writes, and validates **JSON data**, regardless of its source:
discrete JSON files, I/O streams, or JSON contained in data fields inside
other formats. The `cue` command emits JSON by default.
{{< /card >}}

{{< card
    title="YAML"
    href="/docs/concept/how-cue-works-with-yaml/"
    label="Read more"
>}}

CUE's support for YAML mirrors its first class JSON support: it reads, writes
and validates **YAML data** anywhere it can be found: discrete YAML files, I/O
streams, or YAML contained in data fields inside other formats.
{{< /card >}}

{{< card
    title="Go"
    href="/docs/concept/how-cue-works-with-go/"
    label="Learn more"
>}}

The `cue` command converts **Go types** to CUE, enabling their first class use as
schema and data constraints. CUE's extensive **Go API** allows code to have
fine grained control over CUE's capabilities and operations, including
export to any encoding supported by CUE.
{{< /card >}}

{{< card
    title="TOML"
    href="/docs/concept/how-cue-works-with-toml/"
    label="Find out more"
>}}

CUE supports reading and writing **TOML data** wherever it's found: discrete
TOML data files, I/O streams, or encoded in string fields inside other formats.
{{< /card >}}

{{< card
    title="OpenAPI"
    href="/docs/concept/how-cue-works-with-openapi/"
    label="Read more"
>}}
CUE reads and writes **OpenAPI data schemas** through its Go API and the `cue`
command, enabling schemas to be used to constrain and validate data directly,
and to be expressed in other formats - including CUE.
{{< /card >}}

{{< card
    title="Protocol Buffers"
    href="/docs/concept/how-cue-works-with-protocol-buffers/"
    label="Learn more"
>}}

CUE's Go API and the `cue` command read **Protobuf definitions**, enabling them
to be used to constrain and validate data directly and to be expressed in other
formats. CUE constraints can be extracted from Protobuf options, allowing
richer data validation than Protobuf's type-based defaults.
{{< /card >}}

{{< card
    title="JSON Schema"
    href="/docs/concept/how-cue-works-with-json-schema/"
    label="Read more"
>}}

CUE understands **JSON Schema constraints** through its Go API and the `cue`
command, enabling schemas to be used to constrain and validate data directly,
and to be expressed in other formats - including CUE.
{{< /card >}}

{{< card
    title="Java"
    href="/docs/tutorial/get-started-cue-java/"
    label="Learn more"
>}}{{< sidenote text="Technology preview">}}

Support for using CUE in Java is available through an experimental Java library.

Follow this introductory tutorial to get started with CUE in Java.
{{< /card >}}
{{< /cards >}}

## Technologies and systems

CUE can be used to configure, enhance, and integrate with any technology that
accepts or generates data in a
[supported encoding]({{< relref "docs/reference/command/cue-help-filetypes" >}}).
To help you get up and running quickly,
[cue.dev](https://cue.dev)
publishes curated modules and guides for some of the most popular and impactful technologies.
[Curated modules](https://cue.dev/docs/curated-modules/)
contain ready-made schemas for the data consumed by these technologies,
with their associated guides showing you how to use them effectively.

Here's a selection of the technologies and systems you'll find on cue.dev:

{{< cards >}}

{{< card
    title="Argo Workflows"
    href="https://cue.dev/docs/curated-module-argo-workflows/"
    label="cue.dev"
>}}
<center> {{< ico vendor=devicons name="argocd/argocd-original" size=4em >}} </center>
{{< /card >}}

{{< card
    title="Azure Pipelines"
    href="https://cue.dev/docs/curated-module-azure-pipelines/"
    label="cue.dev"
>}}
<center> {{< ico vendor=devicons name="azure/azure-original" size=4em >}} </center>
{{< /card >}}

{{< card
    title="Buildkite Pipelines"
    href="https://cue.dev/docs/curated-module-buildkite-pipelines/"
    label="cue.dev"
>}}
<center> {{< ico vendor=simple-icons name="buildkite" size=4em >}} </center>
{{< /card >}}

{{< card
    title="Docker Compose"
    href="https://cue.dev/docs/curated-module-docker-compose/"
    label="cue.dev"
>}}
<center> {{< ico vendor=devicons name="docker/docker-original" size=4em >}} </center>
{{< /card >}}

{{< card
    title="GitHub Actions"
    href="https://cue.dev/docs/curated-module-github-actions/`"
    label="cue.dev"
>}}
<center> {{< ico vendor=devicons name="github/github-original" size=4em >}} </center>
{{< /card >}}

{{< card
    title="GitLab CI/CD"
    href="https://cue.dev/docs/curated-module-gitlab-cicd/"
    label="cue.dev"
>}}
<center> {{< ico vendor=devicons name="gitlab/gitlab-original" size=4em >}} </center>
{{< /card >}}

{{< card
    title="GoReleaser"
    href="https://cue.dev/docs/curated-module-goreleaser/"
    label="cue.dev"
>}}
<center> {{< ico vendor=devicons name="go/go-original-wordmark" size=4em >}} </center>
{{< /card >}}

{{< card
    title="Kubernetes"
    href="https://cue.dev/docs/curated-module-kubernetes/"
    label="cue.dev"
>}}
<center> {{< ico vendor=devicons name="kubernetes/kubernetes-original" size=4em >}} </center>
{{< /card >}}

{{< card
    title="Curated module index"
    href="https://cue.dev/docs/curated-modules/"
    label="cue.dev"
>}}
NPM packages, Kubernetes CRDs, and more ...
{{< /card >}}

{{</ cards >}}

Some older examples of CUE being used use with third party software are
published at [CUE By Example](https://github.com/cue-labs/cue-by-example/),
including:

{{< cards >}}

{{< card
    title="Controlling Kubernetes"
    href="https://github.com/cue-labs/cue-by-example/tree/main/003_kubernetes_tutorial/README.md"
    label="CUE By Example"
>}}
A worked example of converting a set of Kubernetes configuration files
for a collection of microservices into smaller, validated CUE configurations by
automatically removing boilerplate;
automating commands that don't know CUE yet (such as `kubectl`);
and extracting schema definitions from Kubernetes source code.
<center> {{< ico vendor=devicons name="kubernetes/kubernetes-original" size=4em >}} </center>
{{< /card >}}

{{< card
    title="Writing Terraform plan policies"
    href="https://github.com/cue-labs/cue-by-example/blob/main/002_terraform_plan/README.md"
    label="CUE By Example"
>}}
A pair of guides showing how to validate the JSON output from `terraform plan`
using CUE as a policy language.
<center> {{< ico vendor=devicons name="terraform/terraform-original" size=4em >}} </center>
{{< /card >}}

{{< card
    title="Managing Mythic Beasts DNS"
    href="https://github.com/cue-labs/cue-by-example/blob/main/004_mythic_beasts_dns/README.md"
    label="CUE By Example"
>}}
A guide that demonstrates how to use CUE to keep DNS data in a compact format,
using CUE templating to DRY out configurations, and use CUE's constraints to
enforce policies on the data to guard against mistakes.
{{< /card >}}

{{< /cards >}}
