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
									broken: "v3yFQJW0pWJNqVy4MJeXli9jY4r6YzTUxRCo7jKeTSs="
									fixed:  "0xsioGeKRZhe7aWoUrHXv0ZjrsG3aIHnW9z/eLqOX3c="
								}
								multi_step: {
									hash:       "G5E5P4DNLFC1OSA9TARSRAG32KQE96MS77M92SPBD3VI2AOKPT3G===="
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
