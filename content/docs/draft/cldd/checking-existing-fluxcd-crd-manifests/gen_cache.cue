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
									manifest: "7FzEnLJJzn9RsXvHY+MZkKAwmDbdpiehlllStTxHEDU="
								}
								multi_step: {
									hash:       "GQF31G1HO6NE6BCR120MTS6PCNDO9OUQGBID16HEOIVDFBEPSN7G===="
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
