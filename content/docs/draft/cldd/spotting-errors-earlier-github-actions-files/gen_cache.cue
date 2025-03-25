package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"spotting-errors-earlier-github-actions-files": {
						page: {
							cache: {
								upload: {
									"workflow broken": "oqMXkWaXuEIfHipUUOu7FfidDYBwl7R5Xua9FJhnrQQ="
									"workflow fixed":  "GAFK81fjcZM6liMm9+lyseqId1FVWDjbCSphxCBP9R0="
								}
								multi_step: {
									hash:       "I5KC18VTIQG1N9R0JOJQQ80GGIL6GOOHQQI1AK8ABJ43QL9FLKS0===="
									scriptHash: "7L2S1F2CMITFUFH0J3N2AAPKJ9IH3H6SFTQSBQ29PHU3QPCPL2RG===="
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
										cmd:      "cue vet -c github.com/cue-tmp/jsonschema-pub/exp3/githubactions@latest workflow.yml -d '#Workflow'"
										exitCode: 1
										output: """
												job: field not allowed:
												    ./workflow.yml:5:1

												"""
									}, {
										doc:      ""
										cmd:      "cue vet -c github.com/cue-tmp/jsonschema-pub/exp3/githubactions@latest workflow.yml -d '#Workflow'"
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
