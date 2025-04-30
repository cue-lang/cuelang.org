package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"spotting-errors-earlier-gitlab-cicd-files": {
						page: {
							cache: {
								upload: {
									broken: "dCYRwZlclanPhwWn4uJHSTu6U/A4+vDv5xLIFFgmE0g="
									fixed:  "7x6WIvbJTP1zcT2Q7YPjlG+54A2+dGuO7h/i41rWAmU="
								}
								multi_step: {
									hash:       "ME748KHUBCANUE5JRQD0TN9BVG2N7A73NTG4G286PFL637J33H70===="
									scriptHash: "RA3MA69LOSLUOQDETI1U32JMJ701BGEP2Q4R48KKIR9RC6L4KLCG===="
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
										cmd:      "cue vet -c -d '#Pipeline' cue.dev/x/gitlab/gitlabci@latest pipeline.yml"
										exitCode: 1
										output: """
												"create-pages".scripts: field not allowed:
												    .cache/cue/mod/extract/cue.dev/x/gitlab@v0.0.0/gitlabci/schema.cue:295:17
												    ./pipeline.yml:7:3

												"""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Pipeline' cue.dev/x/gitlab/gitlabci@latest pipeline.yml"
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
