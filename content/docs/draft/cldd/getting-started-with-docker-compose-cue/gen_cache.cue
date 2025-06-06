package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-docker-compose-cue": {
						page: {
							cache: {
								upload: {
									"1":  "LOcKvtBvHUDiVjZRD9c0wkzMK/vpWdKgHnWsGuVtJK8="
									yaml: "U9GMc8+XXKe9kYKfVHlZUsANfoWBRdsHNiRecuC8R34="
								}
								multi_step: {
									hash:       "00ANABOEKCH8URU6L5JR0D0MG3LA2MENP1LSHDOH4N1OPV7DU8UG===="
									scriptHash: "MHFVLPPE1D7E1M6RHESP387P9DL4QRSNM86E1M8NK0C6G5IB7VJ0===="
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
									}, {
										doc:      ""
										cmd:      "cue export --outfile compose.yaml -e files.example"
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
