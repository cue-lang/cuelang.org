package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-azure-pipelines-files": {
						page: {
							cache: {
								upload: {
									pipeline: "qveFLO+V8wMEHTXMMtAas6R2TA/UC+Z35sjEnpnyjyE="
								}
								multi_step: {
									hash:       "283CAP4C9QSK3TF35H977CU1TKLG9N3HFCNT73V2NNF5NKBKV5IG===="
									scriptHash: "OTD2D7UKHKNGRHTBBEQ963UR3ICGI5R94P7IN528RR4EJ1CGOCUG===="
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
										cmd:      "cue vet -c -d '#Pipeline' cue.dev/x/azurepipelines@latest pipeline.yml"
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
