package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-buildkite-pipelines-files": {
						page: {
							cache: {
								upload: {
									pipeline: "y9DcltRD5fuqDbn94jGEqUkXX/rMY5KwdB/jvQ4RNJM="
								}
								multi_step: {
									hash:       "263H4DUJ5462M93R1FFL27A0U80HIVCM3JUKGD7ORAMNA20NTP5G===="
									scriptHash: "KKBGD11QIHOBVMIH4SQ97A38VOOPOT91UBLAJ8UKC5CL53L5V960===="
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
