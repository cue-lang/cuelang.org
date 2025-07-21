package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-kyverno-policy-files": {
						page: {
							cache: {
								upload: {
									policy: "oWr9tMikZxHr/TmZTV54pRhA+d+1zOzd2vNYwdIm67g="
								}
								multi_step: {
									hash:       "H7J0I2PPFO1UF8IBCVU7RG9R8O9931AJ5EAMAEHO6DNVAQQ5REEG===="
									scriptHash: "0GNV46KODIFLACS6JPHVOPTUQJ7UJ75NIBR1EIVPASGTVN3E32M0===="
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
										cmd:      "cue vet -c -d '#ClusterPolicy' cue.dev/x/kyverno/clusterpolicy/v1@latest require-labels.yaml"
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
