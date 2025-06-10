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
									workflow: "vujrR5mqQMV/d88p8X+KTryeKXw0xsKLs+Cupu5FrkQ="
								}
								multi_step: {
									hash:       "DEFKV381IM4I32OUOA9324A07BKQV7MQ85V0H0V61SD83HEOUQ7G===="
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
