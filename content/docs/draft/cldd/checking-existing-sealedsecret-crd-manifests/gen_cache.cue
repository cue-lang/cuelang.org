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
									manifest: "Jz0TvFANi8BGjckyFN9FYUOgfDz51F12QInwKdKOqKY="
								}
								multi_step: {
									hash:       "8GH4SCVRDIURNRF5B1C8EM4K5LFL33KTN54OOO14E885179B4PSG===="
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
