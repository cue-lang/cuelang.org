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
									pipeline: "GBMa7fIqJW0bHis4QUsDbfEd0ALo7YHfSmobZswHGQY="
								}
								multi_step: {
									hash:       "86OD575M6IJVL69OC573QARLPGA5FP5DJJDU3NPARR07VJFBOKRG===="
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
