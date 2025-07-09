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
									broken: "ovXppxM0GGUF8kx1cdmmbjEOxA/jag4lcr4Vq8GVbO4="
									fixed:  "iOWTG76G4IOcoueZ8NR4u5oe7VkibzxKQh8LlzFu2kw="
								}
								multi_step: {
									hash:       "6O841PHLDGQQBCA00B2IK9AEJ7VNOLE23FMM9BI13LJ8G69HN3EG===="
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
