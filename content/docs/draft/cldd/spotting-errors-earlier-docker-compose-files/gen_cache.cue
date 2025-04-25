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
									broken: "SftVU8yHLALu1pipOuxj0M8SimsXaxEKv3GcF8mpgpw="
									fixed:  "2wMKY0esp0a+o7kPQ3Ucy0IDwvzDsH44e7Gu0XgoEN0="
								}
								multi_step: {
									hash:       "7ERR9TBFIGNRJAIPIEASVVVNQ0Q6DM66GQ14L8JI5PSJFDT7SKK0===="
									scriptHash: "58SD70BGTNB0JNTD2GP31JKKD1P5KUVISQ3IDNVTFMQN28731TS0===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.4:$PATH"
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
