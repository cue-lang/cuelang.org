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
									file: "9/UWWD6052xM5D0NMKCKmPdl64bYPpkj1SxjVc2gbbU="
								}
								multi_step: {
									hash:       "TGUHFJCC6H610G6OK155R55JAJ0VJ9SK7CAB16A0P36SLO4F9OCG===="
									scriptHash: "3K2VCI6QQFJ6L7J82V2P0V80CL7SOJAH163330FU19HCEQF3OOG0===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.2:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Schema' test.cue.works/x1/dockercompose@latest compose.yml"
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
