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
									workflow: "qZqt8dhOLK5/SuwDHEUC9yTbZPkWSAfdscors6Xrpg8="
								}
								multi_step: {
									hash:       "8FLGE6QS9RM8Q7PMDQL5ROL8F2M6TDK5VI95L634U5LQHOPBG740===="
									scriptHash: "DG2P53LUJUF0V0RPBKOB0MEQRDBAH5AKVQR923BRDGD7QGRRK1DG===="
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
										doc: """
												# Switch to CUE tip, as this page will only be seen on tip.cuelang.org
												# and it's easiest to align behaviours here, inline, rather than using
												# the internal/patch/tip.diff mechanism.
												"""
										cmd:      "export PATH=/cues/v0.13.0-alpha.2:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c github.com/cue-tmp/jsonschema-pub/exp3/argocd@latest workflow.yml -d '#Workflow'"
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
