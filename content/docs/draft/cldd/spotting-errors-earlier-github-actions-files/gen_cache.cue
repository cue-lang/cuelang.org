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
									broken: "gD53etgDcrPyaILI+03CkmW7pALC3Z8JDGPBs/B8ptQ="
									fixed:  "tuvfNTjx9XLGgDg77H2NlJMzbhik236f/Lzi6wWzvgw="
								}
								multi_step: {
									hash:       "CLM3RO14DVL0S2DUUBBB121AR7NFK8MS250D0EBIS2JI3URCVEU0===="
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
