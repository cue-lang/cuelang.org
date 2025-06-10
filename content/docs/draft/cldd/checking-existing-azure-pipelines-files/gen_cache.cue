package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-azure-pipelines-files": {
						page: {
							cache: {
								upload: {
									pipeline: "ySUQM49WfarZ4hXeYlzSVF3ctM3AfY1Wpf0OeafXirc="
								}
								multi_step: {
									hash:       "KP6S1SH6R6K4M0R8I0GCM66552E93BCM1FFVBEDGCQNVCHNH4VM0===="
									scriptHash: "OTD2D7UKHKNGRHTBBEQ963UR3ICGI5R94P7IN528RR4EJ1CGOCUG===="
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
										cmd:      "cue vet -c -d '#Pipeline' cue.dev/x/azurepipelines@latest pipeline.yml"
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
