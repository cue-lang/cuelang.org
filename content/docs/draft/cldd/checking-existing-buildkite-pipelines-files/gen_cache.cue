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
									pipeline: "FkDCjZXQr7qv4dfruV6Dpkx/sNJOPiYUg1aLYay0+18="
								}
								multi_step: {
									hash:       "G8PGS8A7HVFAEL30N9EE2FR1LCPDV02JMPQBNJMH5ML8FML360TG===="
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
