package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-cert-manager-crd-manifests": {
						page: {
							cache: {
								upload: {
									manifest: "x1fddJh3/mpWZiOAp5b8TVCYj0wCWlZl3iaTD5iPQd8="
								}
								multi_step: {
									hash:       "VJM8ETUS9HJLSN9OILGAGP1MEHQV8E8PEGO943QPV5D5R600JLIG===="
									scriptHash: "17RB60NTKJMIDQ9EADCL2F1VBP8H6PG1QHH2JLAJI2V1JPA6J4K0===="
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
										cmd:      "cue vet -c -d '#Certificate' cue.dev/x/crd/cert-manager.io/v1@latest manifest.yaml"
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
