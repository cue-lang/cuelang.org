package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"spotting-errors-earlier-github-actions-files": {
						page: {
							cache: {
								upload: {
									broken: "rdPtRjRfLZ+Vl7VuUi4FlnuXJDntK8fDcB2kFtAHlAs="
									fixed:  "KtDwgGFtUjdH/FPdtZ1ySBW7EIAugxxA2uNVh1vWLMw="
								}
								multi_step: {
									hash:       "LDR00BP122OE3DDF862CJDTORTM1DTV1VMA6GQMDLSO6G2E9HTK0===="
									scriptHash: "HNOCG9C13SRP38LFUDAJ4HAKNTDKCM487EQTR9RM7I4GKQSP9IIG===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.4.0.20250430133040-3ba376f34cb6:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Workflow' cue.dev/x/githubactions@latest workflow.yml"
										exitCode: 1
										output: """
												job: field not allowed:
												    ./workflow.yml:5:1

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
