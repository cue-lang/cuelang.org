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
									"file 1": "4mCHxJYTV/ZdeBhqX7DOnqymO4e+kJo17wcQ/bSGxDc="
									"file 2": "Ogkd9XpiIOCxJ8czrUs5vc0GM68Fj139Py2ytZgf8cs="
									cue:      "c6KKWEqd4P+1MI8Dtslp1g6pCnH8876D8cyfTXCBtXI="
								}
								multi_step: {
									hash:       "ST387BI8POD0FK5N3BK59SM7T7K3DR6M38UNF7T1FTK3J7PLHE7G===="
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
