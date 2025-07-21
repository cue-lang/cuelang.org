package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-fluxcd-crd-manifests": {
						page: {
							cache: {
								upload: {
									manifest: "8bVcgoLDkwMQxfnWptGenMA772J5whvvOKyrFh8rVzo="
								}
								multi_step: {
									hash:       "N9M1KSA0F7PDBEI48G2D41HN7J0MFII6RG3FU0KRS9V5VHLDGBJ0===="
									scriptHash: "9MJMC4LNDJ3QP1QS0M6IMG1N3RIV36PQ2D9B2EUNDGT7V0OVBR6G===="
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
										cmd:      "cue vet -c -d '#HelmRelease' cue.dev/x/crd/fluxcd.io/helm/v2@latest manifest.yaml"
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
