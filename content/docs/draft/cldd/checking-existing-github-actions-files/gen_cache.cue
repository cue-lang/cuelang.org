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
									workflow: "hDQEMTeyP1u6P2S+4M0ga35rVG2wsw4o6PCELCsyVM8="
								}
								multi_step: {
									hash:       "JINMKP5MLKMR0J07AK8KLM9O2OLU788J8B6L8N33J06AFSFM2P7G===="
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
