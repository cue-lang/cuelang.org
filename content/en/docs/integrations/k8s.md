+++
title = "Kubernetes"
weight = 480
description = "How CUE supports Kubernetes."
+++

CUE is inspired by, but certainly not limited to the domain
of configurations for cloud.
That said, dealing with configuring Kubernetes has been one of the
sources of inspiration for CUE and prompted its development.

One issue that inspired the design of CUE was the desire to, on the one hand,
have an abstraction layer that could be converted to not only Kubernetes,
but also other targets like docker compose, but on the other hand have full
access to the Kubernetes API without needing continuous support.
The "Manual" section in the
[Kubernetes Tutorial](/docs/tutorials/kubernetes)
describes how this can be accomplished.

CUE is not specific to Kubernetes, though.
A lot of the functionality described in this section applies equally
to other domains.


## Validating Kubernetes Configurations

### Importing definitions

Kubernetes has no direct support for CUE.
However, as it is written in Go, CUE can automatically extract definitions
from its  code base.
[This section](/docs/integrations/go#download-cue-definitions-from-go-packages)
describes how to extract and use such definitions.


## Creating OpenAPI schema for CRDs

[Istio](https://istio.io) uses CUE to generate OpenAPI.
This includes schema defintions for Custom Resource Definitions.
As of 1.15, these are required to be of the
[Structural form](https://kubernetes.io/blog/2019/06/20/crd-structural-schema/).
The `cuelang.org/go/encoding/openapi` package outputs it in this form
if expansion of references is requested.

This topic has been covered in more detail in the
[OpenAPI and CRDs](/docs/integrations/openapi) section.
