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
									"1":  "Tqjayxq0TVDZOOuWFkK3pKhFdqdG5F0cqbxvrAwLdvw="
									yaml: "dEhff+TW3MMdJW4qjmTsYbRDQD8X4eNxE96cFHK3GC4="
								}
								multi_step: {
									hash:       "TLQ9H7DJE8ONIJN76CMHOABGEIT8DJJKT2SVCKC9EIBFCF68A3HG===="
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
