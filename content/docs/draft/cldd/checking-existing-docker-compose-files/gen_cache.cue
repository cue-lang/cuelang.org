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
									file: "wVX3obzOwM38R1pbt+zDmg7u3dfHY+tF3HR93iJ42W8="
								}
								multi_step: {
									hash:       "RV9CS6B9L7GRNA8PFU28T54F210QJGG5J6VEJMCD2AINKN0LBT2G===="
									scriptHash: "7CCP61RQQD0KEGGTL108RIHIHFL33IJ32L9PU7F93TNM4RU7F4K0===="
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
