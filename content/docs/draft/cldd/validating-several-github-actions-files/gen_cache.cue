package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"validating-several-github-actions-files": {
						page: {
							cache: {
								upload: {
									"file 1": "rHG7MhPqOt+Z1Ut/NcjjaCtR1ayw58Nza4MP9cPShss="
									"file 2": "fbDe+TWfkNIRsta8Xin4a/S9Z5betMhwdTRvevOI0F8="
									cue:      "PgYswHoscFwUUD4jvIpF7nxTSnK+kzuzURK4kpQCKqc="
								}
								multi_step: {
									hash:       "CE7CNCUQ6ORO8699LHP1VDD4A1H9J7LI0NN9T0F1C7EMKHLEMUQG===="
									scriptHash: "DM38BT83Q76QISJVMTS9I415UJK7D9UOIPK28AEAI24511CEV3AG===="
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
