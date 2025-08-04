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
									broken: "Mv6HBOwSTuQsqYv20ugMY2Mpc+eL3GCHEsy91vha2Yc="
									fixed:  "DSmpj1INtsJxWT8R7UR7LdTgbwaLMqmAKUiEYz7j/68="
								}
								multi_step: {
									hash:       "MUISFRMKOK1ULHC29N8M2FFM2OI8IHGC48CIUR5V9UBANJKCNB00===="
									scriptHash: "B21B2958P7CF9CCK0EGMDJLK6U8V943GHNRLUDVK2C67UCAHOMUG===="
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
