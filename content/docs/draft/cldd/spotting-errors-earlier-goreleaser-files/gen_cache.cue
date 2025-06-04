package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"spotting-errors-earlier-goreleaser-files": {
						page: {
							cache: {
								upload: {
									broken: "ivMpRFmcryI7KCZ41SmEfTDD1t/uYIvayohXxN/m4/g="
									fixed:  "3LGno0DDV8TeFZOUpdsEbosjqGdQfxNuNpf0y/WCUs4="
								}
								multi_step: {
									hash:       "APTRB4N9BQQH4OKJSUIBF5P4L5BUDITR2QHJFIR1Q1O0FGC7JOK0===="
									scriptHash: "Q4IEVKNFID82HN75T2MB6FMP25IGGSEI0AJKTESJNIG8F2A0TE20===="
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
										cmd:      "cue vet -c -d '#Project' cue.dev/x/goreleaser@latest .goreleaser.yml"
										exitCode: 1
										output: """
												docker: field not allowed:
												    .goreleaser.yml:7:1

												"""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Project' cue.dev/x/goreleaser@latest .goreleaser.yml"
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
