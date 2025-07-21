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
									"file 1": "blvWtixIn7USyg5wZWSXIklhAlWj1QN5cJZNBHBRD7U="
									"file 2": "hVexJeJDtSyh8j1DIiOqdzG6fwSJ4l9n6lBgt9phQhk="
									cue:      "QW8Uy+dEvqZoYbpLgPgfPm0W6DhXLgr0lRGtvVuSwHY="
								}
								multi_step: {
									hash:       "B4IJ20K5LT8QV00U3EDRSDDQUS1VOUAUQOK3MPPSDDVUUL74CKI0===="
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
