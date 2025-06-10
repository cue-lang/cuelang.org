package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-github-actions-files": {
						page: {
							cache: {
								upload: {
									workflow: "9txHUOM7buuFnGwh62TYEpMmvEKCI7RQRnuIkc84QoA="
								}
								multi_step: {
									hash:       "UIT0HAE37KVTPK7PB7M0O1U9ESC21K834VKEB440GGASSI96TN9G===="
									scriptHash: "E4J8NMT4RVC2HAD66NM9C8AK4VGV5452MV72FUDIPEJB2VVIA95G===="
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
