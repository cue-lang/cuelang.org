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
									broken: "sFB6z32m9lwHN7Mat2cHCHx1eSOZ7UToJBOkW/0V04E="
									fixed:  "bXLafPoA6cyM9D3iTsY8EuQnODcZO5ILlc7NJJl/nSA="
								}
								multi_step: {
									hash:       "RMQ72C1FD8PPKVHU4A82L2KOFFSL9KE1SNCV672M7QGOCK3IFFD0===="
									scriptHash: "RNNHC3G4I63AQ470V4MEBFCS1VTTBM58RT11FEKPF52FU4Q9BOVG===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.4:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Workflow' cue.dev/x/githubactions@latest workflow.yml"
										exitCode: 1
										output: """
												job: field not allowed:
												    ./workflow.yml:5:1

												"""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Workflow' cue.dev/x/githubactions@latest workflow.yml"
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
