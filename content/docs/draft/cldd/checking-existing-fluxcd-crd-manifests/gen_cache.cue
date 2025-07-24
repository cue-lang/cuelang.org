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
									manifest: "HBt8fYzY7M+wrPaYkj0V03U971Su9h1cJIRCL4oopqA="
								}
								multi_step: {
									hash:       "FHV2SB3HS2UUKG68TIUVHUM19OBFQ00C8ACE7A7H2G99JOJ3P080===="
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
