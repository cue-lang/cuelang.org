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
									broken: "NNWmxsMP8Nr1FJN4mNRMGcWyCwgePnpL4rXMO8qzwAo="
									fixed:  "wRvbkbWz55iUS+S6BMkxRxrNzfXsWhRdI5DjmIjN2Gk="
								}
								multi_step: {
									hash:       "VM69EI22VKN6D4S9MP7OD7OG1ML8UVH6EDNRQOV21AQK3QL4LLLG===="
									scriptHash: "I19SEB3JUITS0UBI0QQ2TEUTJCP67M86LOFMEP5C10M9NDURL390===="
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
										cmd:      "cue vet -c -d '#Pipeline' cue.dev/x/gitlab/gitlabci@latest pipeline.yml"
										exitCode: 1
										output: """
												"create-pages".scripts: field not allowed:
												    .cache/cue/mod/extract/cue.dev/x/gitlab@v0.1.0/gitlabci/schema.cue:293:17
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
