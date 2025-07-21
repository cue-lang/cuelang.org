package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-argo-workflows-files": {
						page: {
							cache: {
								upload: {
									workflow: "UP4M2vc5r4LuzKAa1Tas4jEbHed+tULT6MC+obvYPaE="
								}
								multi_step: {
									hash:       "6POB8356T0IF6U8R2O6ASL6AHOHIGVL2P67LJTQK59VD4H7Q8380===="
									scriptHash: "I0KQ2645UH72D10BE35LPC3NV886JCDVKGQ4I3GQC4IMCUSNTOPG===="
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
										cmd:      "cue vet -c -d '#Workflow' cue.dev/x/argocd@latest workflow.yml"
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
