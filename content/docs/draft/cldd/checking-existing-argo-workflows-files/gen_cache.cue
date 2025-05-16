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
									workflow: "4kEUFa4UY9Kn719B+/tQk/9JzJJU5CvQtHxCXvg8Ll4="
								}
								multi_step: {
									hash:       "1JVKM3MGL4U1Q0N4TF0JJN196HP2IU5VBNUSRJNP4SLMKUSBVGV0===="
									scriptHash: "FSSG4VCQ8J44OU92NJHR042CSFJ7JGLPSD60F08EKC4TL3SF1VJ0===="
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
										cmd:      "export PATH=/cues/v0.13.0-rc.1:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-rc.1
												...

												"""
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
