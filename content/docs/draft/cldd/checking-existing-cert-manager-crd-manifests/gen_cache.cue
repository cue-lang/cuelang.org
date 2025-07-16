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
									manifest: "po+A/ORfg1wU3ywRLOZzn8/puZQipCXlj0oBnJLV1HQ="
								}
								multi_step: {
									hash:       "9ECLFDKOVFP618V0951N0GGP0U1HQK8AQN9LSQVHN6UEL4GTANU0===="
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
