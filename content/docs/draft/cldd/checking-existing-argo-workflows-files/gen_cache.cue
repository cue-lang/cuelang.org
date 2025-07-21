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
									workflow: "0OvVuluZ/TDu3Lvdp/nyKGhU38JNcbM4Om5k4CB/XF0="
								}
								multi_step: {
									hash:       "P1VV5TNJETRNR70NTFKOPARN9RQFPNKU0TL269HA0CFG48GO7320===="
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
