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
									broken: "FX5xyM2hiyWIndCHF+tZtik0ZELWePB1napfzpYnJcg="
									fixed:  "dzikRyqwPl/uqrtvL3lSdlTemHcZ8L3t/4jTnTUBJng="
								}
								multi_step: {
									hash:       "2L036V3KFT1QKPS3KVF6QNH3Q40JS875T9CKVF1JQ7A8PE49P1VG===="
									scriptHash: "3NHL0TRM1Q4A2U7PBEP0G0E4SSBCDT4VJVSA9HL0NV5MTGRA5AT0===="
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
