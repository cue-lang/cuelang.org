---
title: Checking Flux HelmRelease CRD manifests using CUE
---

The easiest way to start taking advantage of CUE’s powerful validation is to
use it to check Kubernetes CRD manifests before deploying them. By adding this
check to your development or deployment process you can catch and fix
structural errors before they cause operational problems.

This guide shows you how to validate a HelmRelease manifest using the
[`crd/fluxcd.io`](../curated-module-crd-fluxcd.md)
curated module from the CUE [Central Registry](/products/central-registry) --
all without writing any schemas or policies in CUE.

## Choose a manifest

This example is adapted from the
[Flux HelmRelease CRD documentation](https://fluxcd.io/flux/components/helm/helmreleases/)
but you should use a manifest that's relevant to your situation:

``` { .yaml title="manifest.yaml" }
apiVersion: helm.toolkit.fluxcd.io/v2
kind: HelmRelease
metadata:
  name: podinfo
  namespace: default
spec:
  interval: 10m
  timeout: 5m
  chart:
    spec:
      chart: podinfo
      version: '6.5.*'
      sourceRef:
        kind: HelmRepository
        name: podinfo
      interval: 5m
  releaseName: podinfo
  install:
    remediation:
      retries: 3
  upgrade:
    remediation:
      retries: 3
  test:
    enable: true
  driftDetection:
    mode: enabled
    ignore:
    - paths: ["/spec/replicas"]
      target:
        kind: Deployment
  values:
    replicaCount: 2
```

## Validate the manifest

``` { .text title="TERMINAL" data-copy="cue vet -c -d &#39;#HelmRelease&#39; cue.dev/x/crd/fluxcd.io/helm/v2@latest manifest.yaml" }
$ cue vet -c -d '#HelmRelease' cue.dev/x/crd/fluxcd.io/helm/v2@latest manifest.yaml
```

This command uses the `#HelmRelease` definition from the
`helm/v2` package to check the manifest.
Because `cue vet` doesn't display any errors
you know that the curated module has validated the file's structure.

If you see an error message mentioning "too many requests" then
[login to the Central Registry](../login-central-registry.md)
and re-run this command.
The Central Registry allows more requests from authenticated users.

## Validate more manifests

You can tell the `cue vet` command to check several manifests at once:

``` { .text title="TERMINAL" data-copy="cue vet -c -d &#39;#HelmRelease&#39; cue.dev/x/crd/fluxcd.io/helm/v2@latest a.yml b.yaml c.yml" }
$ cue vet -c -d '#HelmRelease' cue.dev/x/crd/fluxcd.io/helm/v2@latest a.yml b.yaml c.yml
```

## Next steps

Validating your YAML CRD manifests with CUE can help make development and
deployments safer, but *defining* those same files in CUE lets you build on its
first-class templating, referencing, and policy features.
