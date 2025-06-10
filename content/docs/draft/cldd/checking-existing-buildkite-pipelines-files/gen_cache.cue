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
									pipeline: "30Vzg/rLFxuXlIb6NzIq0lq7N9bGMqv8tdOaVMlwmog="
								}
								multi_step: {
									hash:       "HRMOUB41QUHRIHURHQN6MHC13UQPITQLGDV7OBJ2JFQQ4TS1GD6G===="
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
