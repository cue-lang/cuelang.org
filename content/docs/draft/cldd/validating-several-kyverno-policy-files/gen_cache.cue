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
									"file 1": "Exfekj8Kdhs2Or6SPRrUwx1p+g41eY3bHLLywTD5JvA="
									"file 2": "p9uW1HCM2jorsgoc+iL29f5iVp0hi/wKdNnE5mfM6bk="
									cue:      "P/PFiTyo7HH8JbwQRDGWy/RajP6tifm1CeIZyi0vzxQ="
								}
								multi_step: {
									hash:       "PDOPN4RH7HCSDO827EJ2UVC8C8U3N7KIRT4DDQOD9ENP8O6FGFGG===="
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
