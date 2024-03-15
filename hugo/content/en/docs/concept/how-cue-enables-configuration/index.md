---
title: How CUE enables configuration
tags:
authors:
- jpluscplusm
toc_hide: true
---

**Configuration is one of CUE's core tasks**. People often start using CUE
because it makes producing new configuration files and validating existing
files *safer and easier*, but its capabilities run much deeper. In this guide
we'll begin with the basics of how CUE helps make configuration better, and
then explore the potential of some of its more advanced features for
configuration.

**On this page**:
  [Validating existing config files](#validating-existing-config-files)
| [Generating configurations](#generating-configurations)
| [Abstractions versus direct access](#abstractions-versus-direct-access)\
  [Reducing boilerplate](#reducing-boilerplate)
| [Tooling and automation](#tooling-and-automation)
| [Next steps](#next-steps)

## Validating existing config files

An easy first step to take advantage of CUE is to use it to **check that
existing config files are valid**. This can be tacked on to an *existing*
config-generation process, without having to teach any of the other components
about CUE. Validation can start as small and simple as verifying the presence
or types of critical fields, delaying the time investment in further describing
a configuration until it makes sense to do so.

In this example we use `cue vet` to validate just a couple of important fields
in a larger CI config file, and we catch a mistake before it has the chance to
affect a deployment:

{{< code-tabs >}}
{{< code-tab name="check.cue" language="cue" area="top" >}}
Workflow: {
	jobs: deploy: {
		// environment must be specified.
		environment!: string
		// Production deployments must be performed from the current runner OS.
		if environment == "production" {
			"runs-on"!: "ubuntu-latest"
		}
	}
}
{{< /code-tab >}}
{{< code-tab name=".github/workflows/deploy-to-ecs.yml" language="yml" area="top" >}}
# Adapted from https://github.com/actions/starter-workflows/blob/main/deployments/aws.yml
name: Deploy to Amazon ECS

on:
  push:
    branches: [ $default-branch ]

env:
  AWS_REGION: MY_AWS_REGION
  ECR_REPOSITORY: MY_ECR_REPOSITORY
  ECS_SERVICE: MY_ECS_SERVICE
  ECS_CLUSTER: MY_ECS_CLUSTER
  ECS_TASK_DEFINITION: MY_ECS_TASK_DEFINITION
  CONTAINER_NAME: MY_CONTAINER_NAME

permissions:
  contents: read

jobs:
  deploy:
    name: Deploy
    runs-on: ubuntu-20.04
    environment: production

    steps:
    - name: Checkout
      uses: actions/checkout@v3

    - name: Configure AWS credentials
      uses: aws-actions/configure-aws-credentials@v1
      with:
        aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws-region: ${{ env.AWS_REGION }}

    - name: Login to Amazon ECR
      id: login-ecr
      uses: aws-actions/amazon-ecr-login@v1

    - name: Build, tag, and push image to Amazon ECR
      id: build-image
      env:
        ECR_REGISTRY: ${{ steps.login-ecr.outputs.registry }}
        IMAGE_TAG: ${{ github.sha }}
      run: |
        docker build -t $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG .
        docker push $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG
        echo "image=$ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG" >> $GITHUB_OUTPUT

    - name: Fill in the new image ID in the Amazon ECS task definition
      id: task-def
      uses: aws-actions/amazon-ecs-render-task-definition@v1
      with:
        task-definition: ${{ env.ECS_TASK_DEFINITION }}
        container-name: ${{ env.CONTAINER_NAME }}
        image: ${{ steps.build-image.outputs.image }}

    - name: Deploy Amazon ECS task definition
      uses: aws-actions/amazon-ecs-deploy-task-definition@v1
      with:
        task-definition: ${{ steps.task-def.outputs.task-definition }}
        service: ${{ env.ECS_SERVICE }}
        cluster: ${{ env.ECS_CLUSTER }}
        wait-for-service-stability: true
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCBjaGVjay5jdWUgLmdpdGh1Yi93b3JrZmxvd3MvZGVwbG95LXRvLWVjcy55bWwgLWQgJ1dvcmtmbG93Jw==" >}}
$ cue vet check.cue .github/workflows/deploy-to-ecs.yml -d 'Workflow'
jobs.deploy."runs-on": conflicting values "ubuntu-latest" and "ubuntu-20.04":
    .github/workflows/deploy-to-ecs.yml:22:14
    ./check.cue:6:3
    ./check.cue:7:16
{{< /code-tab >}}
{{< /code-tabs >}}

The CUE language's validation features are extensive but concise. Here's an
example showing off a just a few types of constraint it can check, and the
detail that's provided when validation fails:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
// CUE speaks JSON, YAML, and other formats.
replicas!: int & >1 // Integer greater than 1
cluster!:  string & =~"^PRD-" // Starts with PRD-
os!:       "Linux" | "FreeBSD" //  Alternatives
quorum?:   int & >=(replicas / 2) // Optional int
maxLoad!: float // Required float
{{< /code-tab >}}
{{< code-tab name="config.json" language="json" area="top-right" >}}
{
    "replicas": 5,
    "cluster": "PROD-c01",
    "os": "linux",
    "quorum": 2,
    "maxLoad": "4.2"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCBmaWxlLmN1ZSBjb25maWcuanNvbg==" >}}
$ cue vet file.cue config.json
maxLoad: conflicting values "4.2" and float (mismatched types string and float):
    ./config.json:6:16
    ./file.cue:6:11
os: 2 errors in empty disjunction:
os: conflicting values "FreeBSD" and "linux":
    ./config.json:4:11
    ./file.cue:4:22
os: conflicting values "Linux" and "linux":
    ./config.json:4:11
    ./file.cue:4:12
cluster: invalid value "PROD-c01" (out of bound =~"^PRD-"):
    ./file.cue:3:21
    ./config.json:3:16
    ./file.cue:3:12
quorum: invalid value 2 (out of bound >=2.5):
    ./file.cue:5:18
    ./config.json:5:15
{{< /code-tab >}}
{{< /code-tabs >}}

## Generating configurations

Validating existing config files decreases risk for many operations-related
processes, but wouldn't it be useful to **shift the validation left** and stop
incorrect config values from entering the processing stream in the first place?

By moving a configuration's source of truth into CUE, folks with access to even
*partial* configs can check them against a shared schema definition.
Developers can be surer that their contributions to a configuration won't cause
a later validation to fail, allowing them to make changes confidently.

And when the complete config file is required, operations processes can
generate it using the `cue` tool in the format required, assembling and
*unifying* data and values from disparate sources - all whilst applying and
checking those same constraints that were available to the developer.

In this example, we see:

- `schema.cue` describing the required shape of a deployment's input and output
  configurations
- `policy.cue` asserting that certain values meet specific requirements, or
  *constraints*
- `deployment.cue` contributing operational data that's only available during
  the deployment process, and
- `config.yml` containing the detail of the app being deployed, provided by its
  developers.

Because the configuration is valid, the `cue` CLI unifies all the files' data
and exports its default: a single JSON file.

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue" area="left" >}}
package config

App: {
	name!:     string
	memory!:   int
	replicas!: int
}

Config: {
	id!:           string
	appName!:      string
	appMemory!:    int
	replicaCount!: int
	clusterName!:  string
	region!:       string
}
{{< /code-tab >}}
{{< code-tab name="policy.cue" language="cue" area="left" >}}
package config

import "strings"

App: {
	name!:      !~#"\."# // no dots
	memory:     >=1024 & <10240
	replicas:   >=2
	replicaMem: memory/replicas & >=1024
}

Config: {
	appName:      strings.MaxRunes(62)
	appMemory:    >=(replicaCount * 1024)
	replicaCount: >=2
	clusterName:  "PROD" | "STAGE" | "DEV"
	region:       "EU" | "NA" | "APAC" | "AMEA"
}
{{< /code-tab >}}
{{< code-tab name="deployment.cue" language="cue" area="left" >}}
package config

import "strings"

app: App
deployment: region:  "AMEA"
deployment: cluster: "PROD"

output: Config & {
	appName:      "\(app.name).service"
	appMemory:    app.memory
	replicaCount: app.replicas
	region:       deployment.region
	clusterName:  deployment.cluster
	id: strings.ToLower(strings.Join(
		[appName, clusterName, region], "."))
}
{{< /code-tab >}}
{{< code-tab name="config.yml" language="yml" area="left" >}}
app:
  name: frontend-ng
  memory: 3072
  replicas: 3
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAuOmNvbmZpZyBjb25maWcueW1sIC1lIG91dHB1dA==" >}}
$ cue export .:config config.yml -e output
{
    "appName": "frontend-ng.service",
    "appMemory": 3072,
    "replicaCount": 3,
    "clusterName": "PROD",
    "region": "AMEA",
    "id": "frontend-ng.service.prod.amea"
}
{{< /code-tab >}}
{{< /code-tabs >}}

But watch what happens when a developer, who is able to access the same
non-sensitive `schema.cue` and `policy.cue` files, updates their `config.yml`
file with a setting which reduces a **calculated value** below its minumum
threshold. An early `cue vet` on the developer's laptop helps prevent a
deployment cycle failure:

{{< code-tabs >}}
{{< code-tab name="config.yml" language="yml" area="bottom" >}}
app:
  name: frontend-ng
  memory: 3072
  # 2024 holiday season: 20% traffic increase expected
  replicas: 4
{{< /code-tab >}}
{{< code-tab name="schema.cue" language="cue" area="bottom" >}}
package config

App: {
	name!:     string
	memory!:   int
	replicas!: int
}

Config: {
	id!:           string
	appName!:      string
	appMemory!:    int
	replicaCount!: int
	clusterName!:  string
	region!:       string
}
{{< /code-tab >}}
{{< code-tab name="policy.cue" language="cue" area="bottom" >}}
package config

import "strings"

App: {
	name:       !~#"\."# // no dots
	memory:     >=1024 & <10240
	replicas:   >=2
	replicaMem: memory/replicas & >=1024
}

Config: {
	appName:      strings.MaxRunes(62)
	appMemory:    >=(replicaCount * 1024)
	replicaCount: >=2
	clusterName:  "PROD" | "STAGE" | "DEV"
	region:       "EU" | "NA" | "APAC" | "AMEA"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top" type="terminal" codetocopy="Y3VlIHZldCAuOmNvbmZpZyBjb25maWcueW1sIC1kICd7IGFwcDogQXBwIH0n" >}}
$ cue vet .:config config.yml -d '{ app: App }'
app.replicaMem: invalid value 768.0 (out of bound >=1024):
    ./policy.cue:9:32
    ./policy.cue:9:14
{{< /code-tab >}}
{{< /code-tabs >}}

CUE's **unification** model allows these kinds of benefits to persist at scale,
even as the number of inputs increases significantly. The language disallows
"overrides", so the location where a specific value originates is never in
doubt. The unified
"[types *are* values]({{< relref "docs/tour/basics/types-are-values" >}})"
concept merges basic types, concrete data, and the constraints that apply to
values. It removes the need for deeply nested layerings that each apply their
own default values, by allowing any layers to simply state their *constraints*,
with CUE figuring out if all the unified constraints are being satisfied.

## Abstractions versus direct access

Abstractions can be a powerful mechanism for protecting a user from detail they
don't need to know, whilst guarding them against mistakes or misuse of the
system or API being abstracted.

But they come with a significant downside: the extra toil and investment that's
required to keep the abstraction up to date with changes in the systems they
encapsulate. Over time, **unmaintained abstractions inevitably drift**, and
even a *maintained* abstraction over a third-party, as-a-service system can
discover drift after the fact, instead of being able to prevent it.
Additionally, abstractions don't just need to handle drift against upstream
systems - they also require an ongoing time investment in delivering feature
parity with new upstream capabilities .

To ease this tension between protection and agility, **consider using CUE's
fine-grained type and constraints** to impose *strong limits* on the known,
important values and structures that drive a system, whilst permitting *looser
validation* of the surrounding, perhaps unknown, fields. Layering detailed,
cascading constraints over APIs and systems, without developing an abstraction
layer, allows more agile teams to take immediate advantage of upstream feature
releases whilst still protecting the core functions relied on by all teams.

If this approach isn't suitable for your situation, take advantage of CUE's
[order irrelevance]({{< relref "docs/tour/basics/order-irrelevance" >}})
to build abstractions that control API requests or configurations to your
specific requirements.

## Reducing boilerplate

CUE has several powerful features that allow boilerplate configuration to be
removed - as well as discovering and removing boilerplate automatically!

They're discussed in depth in
[how CUE enables boilerplate removal](#TODO),
but here's a short example that demonstrates a couple of language features that
make handling configurations in CUE so productive: **templates** and
**defaults**.

{{< code-tabs >}}
{{< code-tab name="jobs.cue" language="cue" area="top-left" >}}
job: {
	nginx: replicas:  2
	manager: command: "monit -I"
	etcd:     _
	boltdb:   _
	postgres: _
}

// This template's constraints are unified with
// each member of the job struct.
job: [Name=_]: {
	name: Name
	// command can be set, but has a default.
	command: string | *"exec \(Name)"
	// replicas can be set, but defaults to 1.
	replicas: uint | *1
}

// Databases are important, so increase the
// replica minimum and default for members of the
// job struct whose keys match #DB.
job: [#DB]: replicas: >=3 | *3
#DB: =~"db$" | "etcd" | "postgres" | "mysql"
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBqb2JzLmN1ZSAtLW91dCBqc29u" >}}
$ cue export jobs.cue --out json
{
    "job": {
        "nginx": {
            "name": "nginx",
            "command": "exec nginx",
            "replicas": 2
        },
        "manager": {
            "name": "manager",
            "command": "monit -I",
            "replicas": 1
        },
        "etcd": {
            "name": "etcd",
            "command": "exec etcd",
            "replicas": 3
        },
        "boltdb": {
            "name": "boltdb",
            "command": "exec boltdb",
            "replicas": 3
        },
        "postgres": {
            "name": "postgres",
            "command": "exec postgres",
            "replicas": 3
        }
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}

## Tooling and automation

<!-- vim_ syntax highlighting hack -->
A configuration language usually transforms its configurations to a lower-level
representation, like JSON, YAML, or Protobuf, so that it can be consumed by
tools that accept these languages. Initially, using basic scripting features
such as simply piping the output into those tools works reasonably well.
Sooner or later, however, folks *will* want to automate this to save time and
effort, and reduce mistakes.

The rise of systems requiring complex or lengthy configurations has been paired
with a rise of even more specialized command line tools, such as `kubectl`,
`etcdctl`, or `crossplane`.
The core structure of many of these tools is pretty similar. Annoyingly, some
have significant overlaps in functionality, along with areas where they're
particularly strong - and yet linking them together or composing them is
painful, as they haven't been designed for interoperability.

**This is where CUE's tooling layer can help**.

It extends CUE's configuration layer by providing an open, declarative, and
**data-driven scripting layer** on top, and allows the particular strengths of
existing, individual tools to be harnessed.  It permits and promotes
**incremental evaluation**, with the output of one tool being processed through
CUE's powerful language constraints, before being transformed and used as the
validated input that drives the next tool.

The tooling layer modifies CUE's normal operation by loosening the language's
standard hemetic seal (where only data can affect evaluation, and only data can
be emitted, side-effect free) by allowing environment information to be
accessed from CUE, by providing cross-platform filesystem access mechanisms,
and by allowing arbitrary command execution.

<!-- TODO: link to a more introductory text for tooling -->
For more information on CUE tooling, and how its ability to deterministically
merge data from multiple static and dynamic sources can supercharge automation,
see the [`cue commands`]({{< relref "docs/reference/cli/cue-commands" >}})
reference documentation.

## Next steps

Interested in learning more about CUE? Here's what you could try next:

- Test out CUE in your browser, with the [CUE playground](/play)
- Take a [tour through the CUE language]({{< relref "docs/tour" >}})
- Read about [the technologies that CUE directly integrates with]({{< relref
  "docs/integration" >}})
<!-- TODO: extend list when more docs have landed -->
