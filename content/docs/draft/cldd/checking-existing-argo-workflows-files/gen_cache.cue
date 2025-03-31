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
									workflow: "Lih4f9TEgM2SU0jH3kZc2ywD7Xs21826cXPZbzKylUI="
								}
								multi_step: {
									hash:       "T5US3BPKQLKTV5CV5A7KIDPIKAJASL54B9D102PR76AHKUV6329G===="
									scriptHash: "8AK7AJ5NAI9RG3RLD18LULIOJ906BGAUG5K51NF357DLQFHNTVGG===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.2:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-alpha.2
												...

												"""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Workflow' test.cue.works/x1/argocd@latest workflow.yml"
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
