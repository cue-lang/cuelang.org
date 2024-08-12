---
title: Integrations
weight: 25
toc_hide: false
index_hide: true
---

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

## Technologies

CUE is independent of the technologies it can be used alongside.\
Some examples of its use with specific tools, systems, and providers are collected in
[CUE By Example](https://github.com/cue-labs/cue-by-example/):

{{< cards >}}
{{< card
    title="Controlling Kubernetes"
    href="https://github.com/cue-labs/cue-by-example/tree/main/003_kubernetes_tutorial/README.md"
    label="Read on CUE By Example"
>}}

A worked example of converting a set of Kubernetes configuration files
for a collection of microservices into smaller, validated CUE configurations by
automatically removing boilerplate;
automating commands that don't know CUE yet (such as `kubectl`);
and extracting schema definitions from Kubernetes source code.
{{< /card >}}

{{< card
    title="Driving GitHub Actions workflows"
    href="https://github.com/cue-labs/cue-by-example/blob/main/001_github_actions_importing_workflows/README.md"
    label="Read on CUE By Example"
>}}

A guide explaining how to convert GitHub Actions workflow files from YAML to
CUE, check those workflows are valid, and then use CUE's tooling layer to
regenerate YAML - allowing safer and more predictable changes.
{{< /card >}}

{{< card
    title="Writing Terraform plan policies"
    href="https://github.com/cue-labs/cue-by-example/blob/main/002_terraform_plan/README.md"
    label="Read on CUE By Example"
>}}

A pair of guides showing how to validate the JSON output from `terraform plan` using CUE as a policy language.
{{< /card >}}

{{< card
    title="Managing Mythic Beasts DNS"
    href="https://github.com/cue-labs/cue-by-example/blob/main/004_mythic_beasts_dns/README.md"
    label="Read on CUE By Example"
>}}

A guide that demonstrates how to use CUE to keep DNS data in a compact format,
using CUE templating to DRY out configurations, and use CUE's constraints to
enforce policies on the data to guard against mistakes.
{{< /card >}}

{{< card
    title="Driving GitLab CI/CD Pipelines"
    href="https://github.com/cue-labs/cue-by-example/blob/main/005_gitlab_ci/README.md"
    label="Read on CUE By Example"
>}}

A guide illustrating how to convert a GitLab CI/CD pipeline file from YAML to
CUE, check its contents are valid, and then use CUE's tooling layer to
regenerate YAML - allowing safer and more predictable changes.
{{< /card >}}

{{< card
    title="Driving Buildkite pipelines"
    href="https://github.com/cue-labs/cue-by-example/blob/main/006_buildkite_importing_pipelines/README.md"
    label="Read on CUE By Example"
>}}

A guide demonstrating how to convert static Buildkite pipelines files from YAML to
CUE, check the pipelines are valid, and then use CUE's tooling layer to
regenerate YAML - allowing safer and more predictable changes by switching to CUE as a source of truth.
{{< /card >}}

{{< card
    title="Supercharging Buildkite pipelines"
    href="https://github.com/cue-labs/cue-by-example/blob/main/007_buildkite_dynamic_pipelines/README.md"
    label="Read on CUE By Example"
>}}

A guide that builds on an official Buildkite blog post, showing how to use CUE
to define and validate CI pipelines as they're initiated and as they're
executing, so that their steps can vary *dynamically*, based on the pipeline's
execution context.
{{< /card >}}
{{< /cards >}}
