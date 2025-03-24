package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-gitlab-cicd-files": {
						page: {
							cache: {
								upload: {
									pipeline: "hu9i2yGdiJ6EQG7+ow3YzBw3RS2sdLTfNRWx+sjXAC4="
								}
								multi_step: {
									hash:       "5CF1TU816S35CNMUVLKTG0NGJBCTE5NBIA84AIS3S4JVB1T7GQVG===="
									scriptHash: "A2BVFEOM96GKFCAOMQ0RQ2197FP660SSOHESFMH4QFMTBBG4G30G===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.1.0.20250324111431-1eccc4649d73:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c github.com/cue-tmp/jsonschema-pub/exp3/gitlab/gitlabci@latest pipeline.yml -d '#Pipeline'"
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
