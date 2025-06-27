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
									"file 1": "HF4nIaeFP2SP0Jk1vlt7f2VTnyXd9xLbxg95Y3rXEL4="
									"file 2": "mMNwhbZqlRIsOsCDiGRJcCPNUMsR2bibiJ8jAtZ9h/k="
									cue:      "wfhYwpD0cAOET35tOFSegOJeh7OmgRwRJLMlg2eANZM="
								}
								multi_step: {
									hash:       "NIAM7ORLH2SA9J4U5ROUQB509J23F4KO7P6J93N54JC3AT1M6EU0===="
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
