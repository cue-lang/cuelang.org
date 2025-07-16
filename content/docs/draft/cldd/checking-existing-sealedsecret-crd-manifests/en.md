---
title: Checking SealedSecret CRD manifests using CUE
---

{{{with _script_ "en" "HIDDEN setup"}}}
# Registry auth
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD
{{{end}}}

The easiest way to start taking advantage of CUE’s powerful validation is to
use it to check Kubernetes CRD manifests before deploying them. By adding this
check to your development or deployment process you can catch and fix
structural errors before they cause operational problems.

This guide shows you how to validate a `bitnami.com/SealedSecret` manifest using the appropriate
[curated module](../curated-module-crd-sealed-secrets.md)
from the CUE [Central Registry](/products/central-registry) --
all without writing any schemas or policies in CUE.

## Choose a manifest

This example is adapted from the
[`bitnami-labs/sealed-secrets`](https://github.com/bitnami-labs/sealed-secrets)
repository, but you should use a manifest that's relevant to your situation:

{{{with upload "en" "manifest"}}}
-- manifest.yaml --
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
metadata:
  name: mysecret
  namespace: default
spec:
  encryptedData:
    username: AgBs9G5ehZr...
    password: AgCDEfgh...
  template:
    metadata:
      name: mysecret
      namespace: default
{{{end}}}

## Validate the manifest

{{{with script "en" "cue vet"}}}
cue vet -c -d '#SealedSecret' cue.dev/x/crd/bitnami.com/sealed-secrets/v1alpha1@latest manifest.yaml
{{{end}}}

This command uses the `#SealedSecret` definition from the
`v1alpha1` package to check the manifest.
Because `cue vet` doesn't display any errors
you know that the curated module has validated the file's structure.

If you see an error message mentioning "too many requests" then
[login to the Central Registry](../login-central-registry.md)
and re-run this command.
The Central Registry allows more requests from authenticated users.

## Validate more manifests

You can tell the `cue vet` command to check several manifests at once:

{{{with script "en" "cue vet multiple"}}}
#norun
cue vet -c -d '#SealedSecret' cue.dev/x/crd/bitnami.com/sealed-secrets/v1alpha1 a.yml b.yaml c.yml
{{{end}}}

## Next steps

Validating your YAML CRD manifests with CUE can help make development and
deployments safer, but *defining* those same files in CUE lets you build on its
first-class templating, referencing, and policy features.
