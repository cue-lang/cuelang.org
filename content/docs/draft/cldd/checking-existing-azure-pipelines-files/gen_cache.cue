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
									pipeline: "lSIkigS5EJx3zdc7S1GH4loRToWpr62GJ/01/z9C12c="
								}
								multi_step: {
									hash:       "M1F4O4VNN1JSE5L24FHTPEDMGK1KLFL2JMRB8TK4TAKQE0U6B680===="
									scriptHash: "VECRRSM8HQPCL8C52SQQJG2I6JSKJSIOAVN8NBG10BJ4AQK695Q0===="
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
										cmd:      "cue vet -c github.com/cue-tmp/jsonschema-pub/exp3/azurepipelines@latest pipeline.yml -d '#Pipeline'"
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
