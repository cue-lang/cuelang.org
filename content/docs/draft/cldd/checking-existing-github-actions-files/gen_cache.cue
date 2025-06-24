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
									workflow: "YpWZlSBvbceQTc/cDXiyoeAbRjGStfiQ5E2hSnxI6LQ="
								}
								multi_step: {
									hash:       "CKUCABBT668F3KIH17UGEVIDPDK27T1NCQOF3QIP2QP2O5UEQEN0===="
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
