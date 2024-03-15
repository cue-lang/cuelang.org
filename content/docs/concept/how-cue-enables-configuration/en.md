---
title: How CUE enables configuration
tags:
authors:
- jpluscplusm
toc_hide: true
---

Configuration is one of CUE's core tasks. People often start using CUE because
it makes producing new configuration files and validating existing files safer
and easier, but its capabilities run much deeper. In this guide we'll begin
with the basics of how CUE helps make configuration better, and then explore
the potential of some of its more advanced features for configuration.

## Validate existing config files

An easy first step to take advantage of CUE is to use it to **check that
existing config files are valid**. This can be tacked on to an *existing*
config-generation process, without having to teach any of the other components
about CUE. Validation can start as small and simple as verifying the presence
or types of critical fields, delaying the time investment in further describing
a configuration until it makes sense to do so.

In this example we use `cue vet` to validate just a couple of important fields
in a larger CI config file, and we catch a mistake before it has the chance to
affect a deployment:

{{{with code "en" "validate"}}}
#location top top bottom

! exec cue vet check.cue .github/workflows/deploy-to-ecs.yml -d 'Workflow'
cmp stderr out
-- check.cue --
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
-- .github/workflows/deploy-to-ecs.yml --
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
-- out --
jobs.deploy."runs-on": conflicting values "ubuntu-latest" and "ubuntu-20.04":
    .github/workflows/deploy-to-ecs.yml:22:14
    ./check.cue:6:3
    ./check.cue:7:16
{{{end}}}

The CUE language's validation features are extensive but concise. Here's an
example showing off a just a few types of constraint it can check, and the
detail that's provided when validation fails:

{{{with code "en" "constraints"}}}
#nofmt leading CUE comment
! exec cue vet file.cue config.json
cmp stderr out
-- file.cue --
// CUE speaks JSON, YAML, and other formats.
replicas!: int & >1 // Integer greater than 1
cluster!:  string & =~"^PRD-" // Starts with PRD-
os!:       "Linux" | "FreeBSD" //  Alternatives
quorum?:   int & >=(replicas / 2) // Optional int
maxLoad!: float // Required float
-- config.json --
{
    "replicas": 5,
    "cluster": "PROD-c01",
    "os": "linux",
    "quorum": 2,
    "maxLoad": "4.2"
}
-- out --
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
{{{end}}}

## Generate configurations

Validating existing config files decreases risk for many operations-related
processes, but wouldn't it be useful to **shift the validation left** and stop
incorrect config values from entering the processing stream in the first place?

By moving a configuration's source of truth into CUE, folks with access to even
*partial*, non-sensitive config values can check them against a shared schema
definition.  Developers can be surer that their contributions to a
configuration won't cause a later validation to fail, allowing them to make
changes more fearlessly.

And when the complete config file is required, operations processes can
generate it using the `cue` tool in the format required, assembling and
*unifying* data and values from disparate sources - all whilst applying and
checking those same constraints that were available to the developer.

In this example, we see

- `schema.cue` describing the required shape of a deployment's input and output
  configurations
- `policy.cue` asserting that certain values meet specific requirements
- `deployment.cue` contributing operational data that's only available during
  the deployment process, and
- `config.yml` containing the detail of the app being deployed, provided by its developers.

Because the configuration is valid, the `cue` CLI unifies all the files' data
and exports its default: a single JSON file.

{{{with code "en" "generate-success"}}}
#location left left left left right

exec cue export .:config config.yml -e output
cmp stdout out
-- schema.cue --
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
-- policy.cue --
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
-- deployment.cue --
package config

app: App

deployment: {
	region:  "AMEA"
	cluster: "PROD"
}

output: Config & {
	appName:      app.name
	appMemory:    app.memory
	replicaCount: app.replicas
	region:       deployment.region
	clusterName:  deployment.cluster
	id:           "\(appName).\(clusterName).\(region)"
}
-- config.yml --
app:
  name: frontend-ng
  memory: 3072
  replicas: 3
-- out --
{
    "appName": "frontend-ng",
    "appMemory": 3072,
    "replicaCount": 3,
    "clusterName": "PROD",
    "region": "AMEA",
    "id": "frontend-ng.PROD.AMEA"
}
{{{end}}}

But watch what happens when a developer, who is able to access the same
non-sensitive `schema.cue` and `policy.cue` files, updates their `config.yml`
file with a setting which reduces a **calculated value** below its minumum
threshold. An early `cue vet` on the developer's laptop helps prevent a
deployment cycle failure:

{{{with code "en" "generate-failure"}}}
#location bottom bottom bottom top

! exec cue vet .:config config.yml -d '{ app: App }'
cmp stderr out
-- config.yml --
app:
  name: frontend-ng
  memory: 3072
  # 2024 holiday season: 20% traffic increase expected
  replicas: 4
-- schema.cue --
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
-- policy.cue --
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
-- out --
app.replicaMem: invalid value 768.0 (out of bound >=1024):
    ./policy.cue:9:32
    ./policy.cue:9:14
{{{end}}}

CUE's **unification model** allows these kind of benefits to continue, even at
scale, as the number of inputs increases significantly. The language disallows
"overrides", so the location where a specific value originates is never in
doubt.
Its fundamental
"[types *are* values]({{< relref "docs/tour/basics/types-are-values" >}})"
concept merges the idea of concrete data and the constraints that apply to
them. This removes the need for deeply nested layerings that each applying
their own default values, by allowing any layers to simply state their
*constraints*, with CUE unifying everything and figuring out if the combined
constraints are being satisfied.

## Abstract

## Template

## Tooling

## Useful at scale

Mention boilerplate removal page.

## Future

- emit multiple files

