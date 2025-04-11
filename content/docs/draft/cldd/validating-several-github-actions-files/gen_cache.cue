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
									"file 1": "TMwtZwO+KTBqTaPCendsrTzvZGRCnLzlio7fWP4kAp4="
									"file 2": "een0YBJ3h0prm9vzWVC3cqHGNb1VDBZqJkh31TkeV64="
									cue:      "jKg4tUWTyvzhZo2ddIvoqtwUgSVgK6zHbmjrah9XH8Y="
								}
								multi_step: {
									hash:       "2SBILTUIINLKP4CRRJCQJI02UE5GVLI5BJSQP1R3K15U4QFJ4J8G===="
									scriptHash: "AC37HQ3E8DQI8RK3J16O24FD7E1V4M2E0EO2K4UK9RKBJ8CPAMNG===="
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
										doc:      "# TODO(jm): revert to latest when it has evalv3 as default."
										cmd:      "export PATH=/cues/v0.13.0-alpha.3:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-alpha.3
												...

												"""
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
