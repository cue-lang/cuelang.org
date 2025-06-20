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
									broken: "tYLB719NVDOlNtQP0q6EAOE+rJrp4Wr/Pjw9n5HpS1Q="
									fixed:  "oEiJokNZxf+9CMsyJRBBZacDqN7bvH96WvEIJbuh1i8="
								}
								multi_step: {
									hash:       "M5RL9OS1HME6GC14L0RB9S40FQCLEFFMB7JG6ANEFN50MDGH9710===="
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
