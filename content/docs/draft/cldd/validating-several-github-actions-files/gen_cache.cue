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
									"file 1": "S29epzAsXZNO10nDnwyQXiBD8xRBEQOZLhFm60cViEQ="
									"file 2": "kzDttvqFluicyn6w19wK0SMwJ2kgK1JrqDrYbcvVA24="
									cue:      "DxFOLxW827KKGo9NADUd7Vt/W8TnnktRPcxmN3TZEQ0="
								}
								multi_step: {
									hash:       "N0JRV4PVD0BPT7GETSR3I3128JGASTM47TQGU4SSU43RNCMLHF0G===="
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
