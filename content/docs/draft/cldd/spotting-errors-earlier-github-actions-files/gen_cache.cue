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
									"workflow broken": "ka1oKMpTKKzHuH07wa0qZhSg8NNITfB7P4CIpHNcVqk="
									"workflow fixed":  "waYXlOUrC+h2uCvl27xeKaz99gviozW9RWV7A3yQcvQ="
								}
								multi_step: {
									hash:       "9N8TVSDUB36C6KP2PDS3UR599S8RB1A422TTUASABA771VIIQKS0===="
									scriptHash: "PC0EM0K9PE9DB9CARF07EK4U0K9KNJBJVIRNFBKLOKOTAQAPUDS0===="
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
