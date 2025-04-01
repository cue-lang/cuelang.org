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
									workflow: "GjR2a1AkNM2PDTLNB6FCHqC0JwWZaUzsGRzjXJt2kQQ="
								}
								multi_step: {
									hash:       "0TU1LRSUANSGJ44L8MUQVH049ACI1KEHDDTJS3NEQOJDE0GMIEG0===="
									scriptHash: "ITBR2RITDP996O5VLEMBT0E2G2LMEU53QVUCK4JNB5IUB3HHDJLG===="
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
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-alpha.3
												...

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
