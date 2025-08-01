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
									pipeline: "kSRhVmgVrpH9F5FICmagCr7I+P0sVRTLWEfC1Foe3lk="
								}
								multi_step: {
									hash:       "EPTMS3E9ULMTEI1FNSGRI2LP4FSD6LNJ74EAAR5GTH9NDKB5OE50===="
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
