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
									manifest: "RH6wEfjdikQ37BuhT3d7p46wsVIYiHp00E7k9JJ5/cQ="
								}
								multi_step: {
									hash:       "43OS0GPTG25TP40NUC61GSR90QH7LCHNTRLK4GL2FO7R6J17I4V0===="
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
