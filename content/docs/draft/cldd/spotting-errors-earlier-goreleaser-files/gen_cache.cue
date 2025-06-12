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
									broken: "5Xn2cH9OTS9nROuG0G3ZrWvX6stJI3TEcMGTlu/6LQA="
									fixed:  "O59dBwhuQ6XerGc2zZrf05d478q9MUhk1zEa20uuXCE="
								}
								multi_step: {
									hash:       "2JV5TQAV1NBVNGP82DG2GQ8SMBMU3MNV3K97LO8GDNOIIVLRI0QG===="
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
