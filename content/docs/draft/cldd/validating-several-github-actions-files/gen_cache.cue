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
									"file 1": "7qIDfHKxOl46moZaGqWhQE/FSg2ZEw4CDSRg+t9rJ2g="
									"file 2": "BVsWkL1KAAaVLJDvLu21Hi/hqIIgTw9nTrVBrUvPUKo="
									cue:      "hDKkDnqj7+/eY1oGJSqr2GCaDKvluY/xkAxTHIjcqs4="
								}
								multi_step: {
									hash:       "54N4ABRKOJQPJE0UTHPPHCFDO4N9P95J30HEUEP7T76NCMDJKHN0===="
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
