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
									broken: "LT5A5ndrHcinqO3aLVDJF7I5P6Kdcq1U3z1HQP2D3AE="
									fixed:  "TLbTYwJAtTIVo7Q2cwW8q/fzEOxvg1dIJqrU3E+ZUkM="
								}
								multi_step: {
									hash:       "8NAIBVGAMLRHMU1M2DJ6JT2FH7NSDR925OCHGQ5B4KIFBMCFH40G===="
									scriptHash: "QETKPM62ENDUAD4D5UOA2BHQVPGFC5PJLTPLRA7HNC66FAMEF3F0===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.3:$PATH"
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
