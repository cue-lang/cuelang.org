package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-crd-cert-manager-certificate-manifests": {
						page: {
							cache: {
								upload: {
									manifest: "/33XE/e5IC5G/1/vf/7jHGqcj5vjvzLLeYdiXqIg2Ow="
								}
								multi_step: {
									hash:       "NT655QTU8TIGCTAB306UB3BA19UMLGSLESJEPFSAE67AEF8GFTF0===="
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
