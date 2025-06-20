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
									"file 1": "aVjadYskLuBdwKK2wnX5NyB8pHlNQ5SAFBDeNGm5XB4="
									"file 2": "BJ3lmn3BXw3rxVAjp+fYdch4B7I38jfIkc4DJ2b/6nM="
									cue:      "3p0s7tlujicI29wR7lB3j7V+w+BKTtqoJf/2bL71Wvg="
								}
								multi_step: {
									hash:       "OE4QGTLEL8LHDBS0R6Q1I4C0KRJVJ851QQA3Q0ITNC50OFUS2DP0===="
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
