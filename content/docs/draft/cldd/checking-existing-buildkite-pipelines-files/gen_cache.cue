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
									pipeline: "4atPJdkuXzlMNYMY+8gvoJyP+K+1Y/RAQSC16JeMcDc="
								}
								multi_step: {
									hash:       "V7P1KCMSAASS6SP6MVJLROMEHQ570MGKTV3LBTPTFGUJPRNKSDQ0===="
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
