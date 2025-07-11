package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-kubernetes-cue": {
						page: {
							cache: {
								upload: {
									"1":  "BxaGUTrDgiYEoonp2xVm+Hjon7Q5qYE2Zn3ep8m0Wc0="
									yaml: "ef1Cx9kuD+hhBjsQNE5o88EWJNrnJYTCr8WPJtXQdvc="
								}
								multi_step: {
									hash:       "LJ17PRORE15D4MSMSFC6T7JP78JK4EGSD2T9T47VPBD7FD7G5CJ0===="
									scriptHash: "RBP1QE7EG2NLP5MAFJBIBV8FAI2A03LEMJROAH0NLLFFKUJ38U80===="
									steps: [{
										doc:      ""
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
									}, {
										doc:      ""
										cmd:      "cue export --outfile manifest.yml"
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
