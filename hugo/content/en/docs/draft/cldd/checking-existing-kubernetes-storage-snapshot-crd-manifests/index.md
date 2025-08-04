---
title: Checking snapshot.storage.k8s.io CRD manifests using CUE
---

The easiest way to start taking advantage of CUE’s powerful validation is to
use it to check Kubernetes CRD manifests before deploying them. By adding this
check to your development or deployment process you can catch and fix
structural errors before they cause operational problems.

This guide shows you how to validate a `snapshot.storage.k8s.io` CRD manifest using the appropriate
[curated module](../curated-module-crd-k8s-storage/index.md)
from the CUE [Central Registry](/products/central-registry) --
all without writing any schemas or policies in CUE.

## Choose a manifest

This example is adapted from Kubernetes documentation,
but you should use a manifest that's relevant to your situation:

``` { .yaml title="manifest.yaml" }
apiVersion: snapshot.storage.k8s.io/v1
kind: VolumeSnapshot
metadata:
  name: my-snapshot
  namespace: default
spec:
  volumeSnapshotClassName: csi-hostpath-snapclass
  source:
    persistentVolumeClaimName: my-pvc
```

## Validate the manifest

``` { .text title="TERMINAL" data-copy="cue vet -c -d &#39;#VolumeSnapshot&#39; cue.dev/x/crd/k8s.io/storage/snapshot/v1@latest manifest.yaml" }
$ cue vet -c -d '#VolumeSnapshot' cue.dev/x/crd/k8s.io/storage/snapshot/v1@latest manifest.yaml
```

This command uses the `#VolumeSnapshot` definition from the
`snapshot/v1` package to check the manifest.
Because `cue vet` doesn't display any errors
you know that the curated module has validated the file's structure.

If you see an error message mentioning "too many requests" then
[login to the Central Registry](../login-central-registry/index.md)
and re-run this command.
The Central Registry allows more requests from authenticated users.

## Validate more manifests

You can tell the `cue vet` command to check several manifests at once:

``` { .text title="TERMINAL" data-copy="cue vet -c -d &#39;#VolumeSnapshot&#39; cue.dev/x/crd/k8s.io/storage/snapshot/v1@latest a.yml b.yaml c.yml" }
$ cue vet -c -d '#VolumeSnapshot' cue.dev/x/crd/k8s.io/storage/snapshot/v1@latest a.yml b.yaml c.yml
```

## Next steps

Validating your YAML CRD manifests with CUE can help make development and
deployments safer, but *defining* those same files in CUE lets you build on its
first-class templating, referencing, and policy features.
