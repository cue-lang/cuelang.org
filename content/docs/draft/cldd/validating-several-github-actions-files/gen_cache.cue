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
									"file 1": "H6QaFuoNMiIkX3T4PPdEZtpxmi9ipcWHZRYtZPy8Dcw="
									"file 2": "EcRTtxkpuJnoBATwIMQN3aqU/5S3EH4ooePxwexQDjE="
									cue:      "kSA9On/nyV7DQd4p+UGYTQaEc0b6VbsKi7j7skO4kUw="
								}
								multi_step: {
									hash:       "2R96EKPKQSERLE6QD6LDJRKMMRFDI9G4NDI5R0H7TG957L5MI7C0===="
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
