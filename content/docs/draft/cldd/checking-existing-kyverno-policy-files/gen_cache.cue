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
									policy: "faUzqTHSfbnS94u6VQqbSAyTXA14uSdISQIj8lUdcfk="
								}
								multi_step: {
									hash:       "BMR5HN6N0RJGTPP1TN4VQC6RBCKU0GJVS57TKEMUIAAN64R9BO6G===="
									scriptHash: "M4O9U93KFAPR8JRM3MUM9U59TBGOK669252ID6P4KRND2S4QLHGG===="
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
										cmd:      "cue vet -c -d '#Policy' cue.dev/x/kyverno/policy/v1@latest require-labels.yaml"
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
