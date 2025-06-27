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
									workflow: "jqvHKEpxEa3loO0CRmyLmfszU5EyevCZu8uPGworVw4="
								}
								multi_step: {
									hash:       "V6OS54KLVCASR0H3JAJOJ9S3CCL38LGIE091TCMPGV9G0JRL9MC0===="
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
