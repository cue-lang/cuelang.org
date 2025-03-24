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
									pipeline: "3z4Pa9tuqfzljfLqT3DgEe0G2FbRgUgdNIFA9pPWgJA="
								}
								multi_step: {
									hash:       "3IOE2A4P7CS5SN6G175KTG1UKE31FODEVLAL693I1L8IF9P1RHT0===="
									scriptHash: "TGSQP86G53P3T8U8UU3AS6HRKQRS0SNA1H5A9370E4FMA8FTS3M0===="
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
										doc: """
												# Switch to CUE tip, as this page will only be seen on tip.cuelang.org
												# and it's easiest to align behaviours here, inline, rather than using
												# the internal/patch/tip.diff mechanism.
												"""
										cmd:      "export PATH=/cues/v0.13.0-alpha.2:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c github.com/cue-tmp/jsonschema-pub/exp3/buildkite@latest pipeline.yml -d '#Pipeline'"
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
