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
									"1":  "6UXm/ZerPZSXPXqok9Qh7DvZoQQL5tyM7ZmMVVrn7sQ="
									yaml: "EywJ+Z3bp/4Z72FT0RG8/9iQuuhGJo6K02VKuhqEId8="
								}
								multi_step: {
									hash:       "BMO1P2FE9D9PQHKT7KN7E5B9UIOQ589VBI0NREGKQ4IN4DVJT1Q0===="
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
