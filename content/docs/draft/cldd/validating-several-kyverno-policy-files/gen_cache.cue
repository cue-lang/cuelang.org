package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"validating-several-kyverno-policy-files": {
						page: {
							cache: {
								upload: {
									"file 1": "RMV2yCpFX7m9luKRNNAYvj8ZOyZs2UsVLo4whCVGi3A="
									"file 2": "vHEzCNsVkTvTHKA6zh631ltGTeLqm6h8KKZV1mnpP0I="
									cue:      "W+wVelv07sWMlMz3qSws7OUBiHfeFkM+ws5WEbr7EyM="
								}
								multi_step: {
									hash:       "B3J1VIK3FPKRRIUIMJ9H6O28D1KNB7FK8IBKIDF47SMQUBDUFIDG===="
									scriptHash: "S9HG8I8P1921R2Q4G64GTDB3TJ54I4T6KUAKS1AKOTJE5R12EPU0===="
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
										cmd:      "cue mod init cue.example"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue mod tidy"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c"
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
