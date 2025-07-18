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
									"file 1": "Sxc2X7dWs2kz6dsyBHGsNuv5bTQF635SJwgDKFRQNTU="
									"file 2": "TF0mN8iJmpM6w1oOZSJjrb13FAijfAlMsVEjSguibJE="
									cue:      "8FBGiUF2SV3VCf+wHKPbYEP1w8Jze95CJOGGj7IyKXE="
								}
								multi_step: {
									hash:       "KIJK6Q6TGH611L0SU1HUHJJUPLRMH7O08K409N9H9PKE8RSKE9L0===="
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
