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
									broken: "gjv/dOKKQICK4o7d1Yb++kIrbI2QkUSej/zUhFXTfhk="
									fixed:  "8WrUh7o9O+hNXH4XMbqefaEVptaioq0Ry4RJJPcKMik="
								}
								multi_step: {
									hash:       "HJ70MOHGNUB042KT66I3ARJDP1IQLHKGF7ISEKJIC1UI6DTA1ON0===="
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
