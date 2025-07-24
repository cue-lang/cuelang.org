package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-sealedsecret-crd-manifests": {
						page: {
							cache: {
								upload: {
									manifest: "iTWnjxOCp68dEMvthpwTp6megWaHDaI1CPqHXHUKDSk="
								}
								multi_step: {
									hash:       "CIO0OG8N0IOQ19OJS6T3LPHJJ56S6U70K4TI6F072S0MB1VF5BV0===="
									scriptHash: "ESJCHTPM3AU7LUCGRMASOAPO6L7V9MR7DPOQ9S91QOS69Q8UV3CG===="
									steps: [{
										doc:      "# Registry auth"
										cmd:      "mkdir -p $HOME/.config/cue"
										exitCode: 0
										output:   ""
									}, {
										doc: ""
										cmd: """
												cat <<EOD >$HOME/.config/cue/logins.json
												{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
												EOD
												"""
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#SealedSecret' cue.dev/x/crd/bitnami.com/sealed-secrets/v1alpha1@latest manifest.yaml"
										exitCode: 0
										output:   ""
									}]
								}
							}
						}
					}
				}
			}
		}
	}
}
