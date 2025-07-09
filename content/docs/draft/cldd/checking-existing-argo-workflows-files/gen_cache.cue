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
									workflow: "/uE8C8f0vCoa2Y8CQx/xf0b7O4vyXXn6+RFOmFKYtLQ="
								}
								multi_step: {
									hash:       "0K8ANDC9VO6DIOGJ963IQPQBN0JUFU4G0C8QNIK3TRBNA5QN6A80===="
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
