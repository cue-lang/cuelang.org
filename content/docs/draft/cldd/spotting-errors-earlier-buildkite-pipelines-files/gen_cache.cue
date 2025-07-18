package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"spotting-errors-earlier-buildkite-pipelines-files": {
						page: {
							cache: {
								upload: {
									broken: "G0Kb2Vt/v7o0ogjmNHI/l1ofCRuZf8OmjPOaAr4Bh3k="
									fixed:  "5tgVoSLTyuR74wKQT+0VJrpoNtZVq59Bn2mYUkRXRkY="
								}
								multi_step: {
									hash:       "7CVPT8QH2I1HSSEG1AL0BP7OU923BS6RAU6LQIH2U4IR1SMD399G===="
									scriptHash: "HA4OOIAPR242RNFUTUGKDNS5OTHOAHGQ636DR1BKLFC0RLVMJI9G===="
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
										cmd:      "cue vet -c -d '#Pipeline' cue.dev/x/buildkite@latest pipeline.yml"
										exitCode: 1
										output: """
												steps: field is required but not present:
												    .cache/cue/mod/extract/cue.dev/x/buildkite@v0.1.0/schema.cue:16:2

												"""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Pipeline' cue.dev/x/buildkite@latest pipeline.yml"
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
