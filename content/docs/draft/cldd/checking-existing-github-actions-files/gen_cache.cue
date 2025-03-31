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
									workflow: "hTVciwCRtljNu+rtJiwgH74yx9Uzx2Y49hwtD3AjopI="
								}
								multi_step: {
									hash:       "CMJM0LP5KC5676T7GLC9KQR1EFS7DMQCNFUMR675JBS3PG9H5UNG===="
									scriptHash: "VBGQSOQU6294BBU8KCSEOF9PE53EEH4296C1ODPF3REIQTBH3EMG===="
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
										cmd:      "cue vet -c -d '#Workflow' test.cue.works/x1/githubactions@latest workflow.yml"
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
