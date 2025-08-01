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
									file: "GWPvxS7SqRfhN1ddb7ITwoBypgbfExblKOGCwoETno4="
								}
								multi_step: {
									hash:       "5C4ELPFLPL4ICI5OU2LDAKI1QT4H08908VS2FIPAIBQGM1HKG75G===="
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
