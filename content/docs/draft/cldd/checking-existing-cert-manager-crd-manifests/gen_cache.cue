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
									manifest: "pxsLfFuhoMpmboGZWBrexrtqJKQqSAlC8i5tM8+mAg4="
								}
								multi_step: {
									hash:       "HAB8Q1AUMIITT9PAMA5AHHB95CRAV492OON8KQKUGTQFIK0EVP80===="
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
