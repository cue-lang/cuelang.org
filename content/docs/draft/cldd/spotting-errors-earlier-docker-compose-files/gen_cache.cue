package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"spotting-errors-earlier-docker-compose-files": {
						page: {
							cache: {
								upload: {
									broken: "oWmTBBXOoM3QV2KOus6Sxn3JWG9VPOpDqjDi4dimoKI="
									fixed:  "0U7i9ZqBxen6IRyAbR6lekbPcrtoWOMBAHHC+imAEIo="
								}
								multi_step: {
									hash:       "1BFLLOO5SOPIQSHSH5PSQ6FMKM5G4MCKP4QASQIQ6NBIAKGJJ700===="
									scriptHash: "K8GBJPSRJFA4KOV6C7FB64LQRGJ2GTHBHI9P664AU4M9UTPT4GF0===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.3:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Schema' cue.dev/x/dockercompose@latest compose.yml"
										exitCode: 1
										output: """
												services.pgadmin.port: field not allowed:
												    ./compose.yml:18:5
												services.postgres.port: field not allowed:
												    ./compose.yml:9:5

												"""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Schema' cue.dev/x/dockercompose@latest compose.yml"
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
