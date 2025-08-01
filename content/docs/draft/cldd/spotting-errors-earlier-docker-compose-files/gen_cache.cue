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
									broken: "STOC+PtmJspBQgsQJApq2c89AydoG5f+XIJ5sadTFYE="
									fixed:  "CpTsOBX6iJk4EAZWPtsZmoX6b1NqycxVJI/4MGHq6Eg="
								}
								multi_step: {
									hash:       "BSFV8SFE3CBJU49PA9E2RU8IR1SA4UTBOFR7NLQ06RTFONARLPSG===="
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
