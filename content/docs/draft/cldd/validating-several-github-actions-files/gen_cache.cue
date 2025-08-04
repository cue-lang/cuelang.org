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
									"file 1": "tbTn0nqkR+C2TZ/szYPkRz6BUKOlCDA1oAdNr2pOqMU="
									"file 2": "vIGyNmcITfa2gk0o+fJ/ZRJPRl3p7tWC2ORIj77StDY="
									cue:      "ZUvXW0BT5kAazGqS/JfXKiO9LoJvKO+bHwTNb3OQB1A="
								}
								multi_step: {
									hash:       "I2A4F12PEOCMG64IP5M8AJ7K1OQPNLJNEIHUOM37QEB1A3DVV51G===="
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
