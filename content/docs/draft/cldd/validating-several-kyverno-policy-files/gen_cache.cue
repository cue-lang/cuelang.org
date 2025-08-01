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
									"file 1": "3APx0YAdXbg7FjxhZ8KmVqKT83j5xGeXcLpC/9t85C8="
									"file 2": "1+FqLGG/JRWFpDiVExiQihoE+c9DJSA2ui5CiC4d0bw="
									cue:      "DUDQYpTOlbT2Yk+iQZniPAlDyCT0JDO+s5C0VxQZkGU="
								}
								multi_step: {
									hash:       "JDE9LDK2ESQUD08L2M6R3S3UHIIUCRCMN1AR2CIRND6OV90DNA30===="
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
