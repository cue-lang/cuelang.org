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
									"file 1": "WE2NXZNkk9algLSg2tdrkI5Xw/ctneMp45x8sTvEtqg="
									"file 2": "exFYFG6lcPWLI9fwg2MLqzml0md25dnTCSsuh+6INjk="
									cue:      "oHZB6gWlQHPzYWZa5gzjkTeY74+2ukP0vLM33ohBWFo="
								}
								multi_step: {
									hash:       "N3IJ2SA46J258INBQDCK68Q0D5470Q6LG4V673K8O1PABLUPSLP0===="
									scriptHash: "20I8JVFE6GNSB9J08DGMKN975492CL1VKCST1DLAJ51J52VIGBNG===="
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
										cmd:      "cue vet -c # this should fail due to the \"jobs\" field being replaced with \"job\", temporarily ..."
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
