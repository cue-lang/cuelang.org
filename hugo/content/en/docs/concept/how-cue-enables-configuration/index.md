---
title: How CUE enables configuration
tags:
- validation
- workflow command
authors:
- jpluscplusm
toc_hide: true
aliases:
- /docs/concept/configuration-use-case
---

**Configuration is one of CUE's core tasks**. People often start using CUE
because it makes it *safer and easier* to produce new configuration files and
to validate existing files - but its capabilities run deeper.
In this guide we'll begin with the basics of how CUE makes configuration better,
and then explore the potential of some of its more advanced features for configuration.
Here's what you'll find in this guide:

- [Validating existing configuration files](#validating-existing-configuration-files)
- [Type checking](#type-checking)
- [Generating configurations](#generating-configurations)
- [Reducing boilerplate](#reducing-boilerplate)
- [Tooling and automation](#tooling-and-automation)
- [Abstractions versus direct access](#abstractions-versus-direct-access)

## Validating existing configuration files

An easy first step with CUE is using the `cue` command to **check that
existing configuration files are valid**.

Checks can be added to an existing configuration-handling process without
teaching any of the other components about CUE because the language and tooling
make it easy to adopt CUE *incrementally*.

Validation can start as small and simple as verifying only specific parts of a
configuration's data. Then, as confidence increases that the range of
information the system contains is well understood, the scope of the validation
can be expanded. CUE makes it possible to delay *fully* describing a
configuration until it makes sense to do so, whilst still getting the benefit
of robust validation from the start.

In this example we use `cue vet` to validate just a couple of important fields
in a larger automated testing configuration file, and we catch a mistake before
it has the chance to affect a deployment:

{{< code-tabs >}}
{{< code-tab name="check.cue" language="cue" area="top" >}}
Workflow: {
	jobs: deploy: {
		// environment must be specified.
		environment!: string
		// Production deployments must be performed from a supported runner.
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

## Type checking

When teams work in a large codebase,
they often need their programming languages to help them by providing
[type safety](https://en.wikipedia.org/wiki/Type_safety) for their code.
**CUE brings that same rigor to configuration and data.**
In fact, CUE goes *further* than many programming languages,
which can commonly validate only basic data types.

In CUE, types and values are
[a *unified* concept]({{< relref "docs/tour/basics/types-are-values" >}}).
This important property gives the language highly expressive typing
capabilities whilst being both intuitive and concise.

Here's an example of `cue vet` checking `aSpec.yaml` against the schema `#Spec`
that contains some of the types and constraints CUE can encode, along with the
detail that's provided when validation fails:

{{< code-tabs >}}
{{< code-tab name="spec.cue" language="cue" area="top-left" >}}
import "strings"

#Spec: {
	// Required string. Must not contain "-".
	name!: string & !~"-"
	// Required. One of three options.
	kind!: "app" | "VM" | "service"
	// Required. Must match name and kind fields.
	id!: strings.HasPrefix(name + "-" + kind + "-")
	// Optional. Must be a float or an int.
	maxLoad?: number
	users?: {
		// Optional ints. If specified, min
		// must be strictly less than max.
		max?: int & >min
		min?: int & <max
	}
}
{{< /code-tab >}}
{{< code-tab name="aSpec.yaml" language="yaml" area="top-right" >}}
name: production-www-svc
kind: service
id:   production-www-svc-4fc78
users:
  min: 1024
  max: 1024
maxLoad: "4.2"
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCBzcGVjLmN1ZSBhU3BlYy55YW1sIC1kICcjU3BlYyc=" >}}
$ cue vet spec.cue aSpec.yaml -d '#Spec'
maxLoad: conflicting values "4.2" and number (mismatched types string and number):
    ./aSpec.yaml:7:10
    ./spec.cue:11:12
name: invalid value "production-www-svc" (out of bound !~"-"):
    ./spec.cue:5:18
    ./aSpec.yaml:1:7
    ./spec.cue:5:9
users.min: invalid value 1024 (out of bound <1024):
    ./spec.cue:16:15
    ./aSpec.yaml:5:8
{{< /code-tab >}}
{{< /code-tabs >}}

## Generating configurations

Validating existing configuration files reduces risk for many
operations-related processes, but wouldn't it be useful to **shift the
validation left** and stop incorrect configuration values from entering the
system in the first place?

By describing a configuration's different elements in discrete CUE schemas and
policies, folks who contribute data to a configuration can check it
against these definitions before the data is used.
Developers can be confident that updating their existing configuration-related
tools won't cause a later validation or process to fail - allowing them to make
changes with more certainty.

The same discrete schemas and policies can be used when operations processes
generate complete configurations.
Whether the inputs and outputs need to be JSON, YAML, CUE, or a mix of all three,
the `cue` command can assemble data and values from disparate sources - all
whilst checking the same constraints that were available to the developer.

In this next example we see four files combining data with requirements,
or *constraints*, from multiple stakeholders:

{{< table >}}
| File | Purpose | Stakeholders
| :---: | --- | ---
| `schema.cue` | Specifies a deployment's input data and output configuration | Agreed by the whole team
| `policy.cue` | Asserts that certain values meet specific constraints | Management, Product, and Operations
| `deploy.cue` | Contributes operational data only available during a deployment | Operations
| `values.yml` | Contains the details of an app needing deployment | Application developers
{{< /table >}}

Because the configuration is valid the `cue` command unifies all four files' data;
transforms it into the `output` field (in `deploy.cue`); and
exports a JSON file for the deployment process to use:

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue" area="left" >}}
package config

App: {
	name!:       string
	memory!:     int
	replicas!:   int
	replicaMem?: number
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
{{< code-tab name="deploy.cue" language="cue" area="left" >}}
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
{{< code-tab name="values.yml" language="yml" area="left" >}}
app:
  name: frontend-ng
  memory: 3072
  replicas: 3
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAuIHZhbHVlcy55bWwgLWUgb3V0cHV0" >}}
$ cue export . values.yml -e output
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

But watch what happens when a developer updates their `replicas` field with a
setting which causes a policy violation on the *derived* value of the
`replicaMem` field.
An early `cue vet` on the developer's laptop helps prevent a deployment failure
by shortening their feedback cycle:

{{< code-tabs >}}
{{< code-tab name="values.yml" language="yml" area="bottom" >}}
app:
  name: frontend-ng
  memory: 3072
  # 20% more traffic expected: increase replica baseline from 3.
  replicas: 4
{{< /code-tab >}}
{{< code-tab name="schema.cue" language="cue" area="bottom" >}}
package config

App: {
	name!:       string
	memory!:     int
	replicas!:   int
	replicaMem?: number
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
{{< code-tab name="TERMINAL" language="" area="top" type="terminal" codetocopy="Y3VlIHZldCAuIHZhbHVlcy55bWwgLWQgJ3sgYXBwOiBBcHAgfSc=" >}}
$ cue vet . values.yml -d '{ app: App }'
app.replicaMem: invalid value 768.0 (out of bound >=1024):
    ./policy.cue:9:32
    ./policy.cue:9:14
{{< /code-tab >}}
{{< /code-tabs >}}

CUE's processing model allows these kinds of benefits to persist at scale, no
matter how many people and teams feed data and constraints into the process:

- The powerful
  "[types *are* values]({{< relref "docs/tour/basics/types-are-values" >}})"
  concept merges the handling of basic types, concrete data, and the
  constraints that apply to values.
- The language disallows "overrides", so the location where a specific value
  originates is never in doubt.
- The
  [order-independent]({{< relref "docs/tour/basics/order-irrelevance" >}})
  [unification]({{< relref "docs/tour/basics/unification" >}})
  of values *and* constraints removes the need for confusing, overlapping
  defaults that can be painful to understand.

That last point is really powerful:
CUE's [constraints]({{< relref "docs/tour/basics/constraints" >}})
unify, like any other value.
This allows schemas and policies simply to state the values and limits that
they need to enforce,
whilst CUE does the hard work of checking that all their constraints are
compatible and that any configuration data meets the combined requirements.

## Reducing boilerplate

CUE has several language features that allow configuration sources to **reduce boilerplate**
\- as well as a command that **removes boilerplate automatically**!

<!-- They're discussed in depth in [how CUE enables boilerplate removal](#TODO), but -->
Here's a short example that demonstrates a couple of features that
make it really productive to describe configurations in CUE:
[templates]({{< relref "docs/tour/types/templates" >}}) and
[defaults]({{< relref "docs/tour/types/defaults" >}}).

Notice how the `job` struct, at the top of `jobs.cue`, contains *only* the
unique detail that defines each entry.
This allows each job's important data to stand out,
uncluttered by the common information that's added elsewhere in the file:

{{< code-tabs >}}
{{< code-tab name="jobs.cue" language="cue" area="top-left" >}}
job: {
	nginx: replicas:  2
	manager: command: "monit -I"
	policyd: _
	boltdb: replicas:   3
	postgres: replicas: 5
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

// Databases are important, so increase the replica
// minimum for members of the job struct whose keys
// match #DB.
job: [#DB]: replicas: >=3
#DB: "postgres" | "mysql" | =~"db$"
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBqb2JzLmN1ZSAtLW91dCB5YW1s" >}}
$ cue export jobs.cue --out yaml
job:
  nginx:
    name: nginx
    command: exec nginx
    replicas: 2
  manager:
    name: manager
    command: monit -I
    replicas: 1
  policyd:
    name: policyd
    command: exec policyd
    replicas: 1
  boltdb:
    name: boltdb
    command: exec boltdb
    replicas: 3
  postgres:
    name: postgres
    command: exec postgres
    replicas: 5
{{< /code-tab >}}
{{< /code-tabs >}}

## Tooling and automation

<!-- vim_ syntax highlighting hack -->

As we've seen, CUE can validate multiple sources of data and transform them
into a unified, vetted configuration for a target system.
When dealing with *multiple* systems, CUE's ability to transform the same
inputs into several different forms can often be sufficient.
But what happens when components need to be configured using information that's
only available *from other components?*

The rise of complex systems requiring complicated or lengthy configurations
has been paired with a rise of even more specialized tools,
such as `kubectl`, `etcdctl`, or `crossplane`.
The core operation of many of these tools is pretty similar, accepting
configurations in complex forms that are only suitable for their specific use.
Some of these tools have significant overlaps in functionality, along with
areas where they're particularly strong - and yet linking them together or
*composing* them is painful, as they haven't been designed for interoperability.

This is where CUE's tooling layer can help, using
"workflow commands" to extend CUE configurations and enable **data-driven workflows**.

Workflow commands allow the particular strengths of existing, individual
tools to be harnessed, by allowing configurations to be **built up incrementally**.
The output of each tool can be processed through CUE's powerful language
constraints, before being transformed and used as the validated input that
drives the *next* tool.

The tooling layer enables **declarative specification of how external data,
schema, and policy are combined** by modifying CUE's normal operation and
allowing tasks to fetch information directly from external sources.
Reading files, calling APIs, invoking external commands, fetching files from
source control - if it can be scripted, then a workflow command can extract
its information to use as data, schema, and policy.

<!-- TODO: link to a more introductory text for tooling -->
<!-- https://github.com/cue-lang/docs-and-content/issues/102 -->
For more information on workflow commands, and how their ability to
deterministically combine data from static and dynamic sources can supercharge
automation, see the
[`cue commands`]({{< relref "docs/reference/command/cue-help-commands" >}})
reference documentation.

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

## Next steps

Interested in learning more about CUE? Here's what you could try next:

- Test out CUE in your browser, with the [CUE playground](/play)
- Take a [tour through the CUE language]({{< relref "docs/tour" >}})
- Read about [the technologies that CUE directly integrates with]({{< relref
  "docs/integration" >}})
<!-- TODO: extend list when more docs have landed -->
