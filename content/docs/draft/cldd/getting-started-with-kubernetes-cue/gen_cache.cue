package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-kubernetes-cue": {
						page: {
							cache: {
								upload: {
									"1":  "Sx1V9t7TTRwJVtfVGfb8qeX0ruvxxl9AkRA1QH6VJ/0="
									yaml: "gDOANeaLxaINpxRtOZLSy88dz0LP8TAvV64fzWyK2wQ="
								}
								multi_step: {
									hash:       "7B6HOAPL2IBR6AU4EM6PFKCQ2P49DECE0MJRBPMDC6KJV5J6Q3EG===="
									scriptHash: "OM79744O3V3QOD7KVCIUPAN9EUUVHJCAO75JMSHMHLELQJ3UORKG===="
									steps: [{
										doc:      ""
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
										doc: """
												# Switch to CUE tip, as this page will only be seen on tip.cuelang.org
												# and it's easiest to align behaviours here, inline, rather than using
												# the internal/patch/tip.diff mechanism.
												"""
										cmd:      "export PATH=/cues/v0.13.0-alpha.1.0.20250321144843-86e62b281609:$PATH"
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
									}, {
										doc:      ""
										cmd:      "cue export --outfile manifest.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "mv manifest.yml .manifest.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff manifest.yml .manifest.yml"
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
