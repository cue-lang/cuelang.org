package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"validating-several-kyverno-policy-files": {
						page: {
							cache: {
								upload: {
									"file 1": "OWhJ0d5ltDQzcoZ4nI2SoysXqVeuBTRgV+WIGDui6Aw="
									"file 2": "YBxZzKnwJtvVURfIyIQYsj1YBQOvKdx6FB2QYkNcvM8="
									cue:      "t4Uy62+zo+F348E+aAaguP9Ukr0eY6oeaASHELJ9X2k="
								}
								multi_step: {
									hash:       "SVV6SSMSC6NHN6CH630DOIS9F0A6BEEC1BFSCNVL71B753TCAOT0===="
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
