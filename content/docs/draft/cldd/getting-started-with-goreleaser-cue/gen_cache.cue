package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-goreleaser-cue": {
						page: {
							cache: {
								upload: {
									"1":  "124VhagB/D+oI13xboaLg7lPxqZs11pZKCwMwYpJFYI="
									yaml: "G8dkhL2iYPq2y6aDGfFlzA3zGiZdqQ5ojjrx0NhIxZE="
								}
								multi_step: {
									hash:       "0MM49B0HD60IMIMAB3IVSAONEC5DK1JKLME9SV47N5A0UUKO1LQ0===="
									scriptHash: "752M39L7M4B83BK8JH5T8UR8AUB62GS6OJQVMSV3D4RG2UF2PPKG===="
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
										cmd:      "cue export --outfile .goreleaser.yaml -e files.example"
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
