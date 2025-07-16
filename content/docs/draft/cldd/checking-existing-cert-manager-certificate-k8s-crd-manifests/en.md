---
title: Checking existing Sealed Secrets manifests using CUE
---

{{{with _script_ "en" "HIDDEN setup"}}}
# Registry auth
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD
{{{end}}}

You can use CUE to validate Sealed Secrets CRD manifests against a curated schema,
making sure they're structurally valid before deployment.

This guide shows how to validate a SealedSecret manifest using a curated module
from the [CUE Central Registry](https://registry.cue.works), with no CUE authoring required.

## Choose a SealedSecret manifest

This example is adapted from public Bitnami samples but simplified for clarity:

{{{with upload "en" "sealedsecret"}}}
-- mysecret.yaml --
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

## Validate the SealedSecret manifest

{{{with script "en" "cue vet"}}}
cue vet -c -d '#SealedSecret' cue.dev/x/crd/bitnami.com/sealed-secrets/v1alpha1 mysecret.yaml
{{{end}}}

If the manifest passes without errors, the schema has validated it successfully.
If you encounter "too many requests," ensure you're authenticated with the registry.

## Validate multiple SealedSecret manifests

You can pass multiple CRD manifests to `cue vet` in one invocation:

{{{with script "en" "cue vet multiple"}}}
#norun
cue vet -c -d '#SealedSecret' cue.dev/x/crd/bitnami.com/sealed-secrets/v1alpha1 secret1.yaml secret2.yaml
{{{end}}}

## Next steps

This structural validation helps prevent errors during secret management.
You can also define your SealedSecrets directly in CUE for better templating and control.

