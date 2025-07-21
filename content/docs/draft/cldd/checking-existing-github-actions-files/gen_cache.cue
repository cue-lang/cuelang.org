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
									workflow: "KnS2pdoiwBZGf8ad+dVc+Dae7Kizk+vsUa4lPEkKvAQ="
								}
								multi_step: {
									hash:       "9C8M830GLTSIOA74PJIVDJ6P2N9QQ42MOTARV4ELLJCB4QRQ3KJG===="
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
