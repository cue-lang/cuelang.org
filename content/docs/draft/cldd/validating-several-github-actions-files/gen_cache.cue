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
									"file 1": "7fVITNMhTqpzU5AyriaKXDcOw7mqO4iBtmnIxcq/RJk="
									"file 2": "BM0Dc0y1DgUhMR+nD9RHwSWXZ+pTwMkaBA6JuoGnXcs="
									cue:      "rG9ymTJ7XvWP8inNZPV8yJcrKSlW1s7TG1oW3JoZL5M="
								}
								multi_step: {
									hash:       "BOMEVDRCT977HH956HKC8NGJ1968L04D7K0J18NG4BHBSQP82CJ0===="
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
