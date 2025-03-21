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
									workflow: "4YOGwAf9xt7B52PDUxFPuT3XRtHSTtrNGYfmiVmGrDs="
								}
								multi_step: {
									hash:       "ACD6CG6JU1UC68RPREIJGRHLQGGAH9DLS1DQJ1C078PO4440FJ10===="
									scriptHash: "2JE2KOBGIDL2S1PCIAM6STJR13H6GB7OKE7RF8DQBPOQHPH2TF2G===="
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
										cmd:      "cue vet -c github.com/cue-tmp/jsonschema-pub/exp3/githubactions@latest workflow.yml -d '#Workflow'"
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
