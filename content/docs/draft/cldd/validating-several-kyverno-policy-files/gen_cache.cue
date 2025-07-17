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
									"file 1": "7f/mkLo7HhUBYOAnbN0FH8Mg+rNnOuTGedLhy1IkgwY="
									"file 2": "+OZLR64iFU0AOxKoi1IGEd0oj39SWbKu1DiepqV7D+k="
									cue:      "ANtwPH/m53EKyFyujFtHi8G8JcRov0Qvi9kmKgRMqGg="
								}
								multi_step: {
									hash:       "LFHM7IKN2VR1V6QJH7EUTULI53P0QLETANOH8PNQ0LT5C3A520NG===="
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
