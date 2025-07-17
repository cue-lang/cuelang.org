package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"validating-several-kyverno-policy-files": {
						page: {
							cache: {
								upload: {
									"file 1": "GmYOydJgrTNPfSCAJP6UrmL88WuMiU2aiUZ9+65Edio="
									"file 2": "E0YjrCeHtZV+VDbPg1nkkiMIeN6ZY1N4i1XH7RTkxLU="
									cue:      "lP/EbzM+nFzgevu9uLDaOUDnemcR9FXLOojUJUZun9c="
								}
								multi_step: {
									hash:       "BI6M0CELCNAVD0IR1NRGIL47HK6QGCO9SVPUCRHHJOSO70GN6REG===="
									scriptHash: "4S0LU7LRFGIUFFOPOD5HJECSE4I7IOBD97678TG6J4T7RHABI1O0===="
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
										cmd:      "cue mod init cue.example"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue mod tidy"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c"
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
