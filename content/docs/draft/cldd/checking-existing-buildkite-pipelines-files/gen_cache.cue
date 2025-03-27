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
									pipeline: "CszpejGST4teoIaSH2MfsXsbgYWG9Kb2P1XLCkONdlM="
								}
								multi_step: {
									hash:       "OQEDRM06B8670E5CJ11FPQTTTV7SKLKNVP6DDI3QE2LQK4DT8QKG===="
									scriptHash: "PBCR9IATH1GI2FDDRC2M011CDK31VT5S8GA321QOOMSTEPPM8QI0===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.2:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Pipeline' github.com/cue-tmp/jsonschema-pub/exp3/buildkite@latest pipeline.yml"
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
