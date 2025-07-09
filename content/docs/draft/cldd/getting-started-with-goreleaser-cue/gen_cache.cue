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
									"1":  "w07OJeoaKWRJiINKCdU6m/gA54X9OPoYuW5iIOAEE5Y="
									yaml: "3YWI5o/XqEfiIQjsnJJe+MYVd890Ksx/o3Ib4FyR6GU="
								}
								multi_step: {
									hash:       "N8HB6A11N61ETII0UMIKTUVDGD2HS595J2Q7RTN7ENK225RAMVJG===="
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
