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
									"file 1": "OWhJ0d5ltDQzcoZ4nI2SoysXqVeuBTRgV+WIGDui6Aw="
									"file 2": "YBxZzKnwJtvVURfIyIQYsj1YBQOvKdx6FB2QYkNcvM8="
									cue:      "t4Uy62+zo+F348E+aAaguP9Ukr0eY6oeaASHELJ9X2k="
								}
								multi_step: {
									hash:       "VPVF7MUDTNCP79500AIK3G1S1CCDJ483Q9LN86I6DPNDQ6DVPTA0===="
									scriptHash: "3EJC5ONN5H0FKGPU04TQPFRQ0AI2AGSQ9BUBI1OMI42I676R9U5G===="
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
										cmd:      "export PATH=/cues/v0.13.0:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0
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
