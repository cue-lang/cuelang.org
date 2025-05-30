package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-docker-compose-files": {
						page: {
							cache: {
								upload: {
									file: "U9m8Nk7pThPecuTFnO7+a3KfI1t7sRB2up1/24h6tb0="
								}
								multi_step: {
									hash:       "8D6FFC2SCMS5ABUIUOVHQ92877NF1P1NNT70IN5T8V79RA3PJKS0===="
									scriptHash: "0UPGCVLEVNQO8EEIUVUHUA3KJ77LLUBNI6RVONV9A0LELFHJTVC0===="
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
										cmd:      "export PATH=/cues/v0.14.0-0.dev.0.20250530082924-23f252784fe2:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.14.0-0.dev.0.20250530082924-23f252784fe2
												...

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
