package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-goreleaser-files": {
						page: {
							cache: {
								upload: {
									file: "ilvVJ8ii111j1z6lUkGcNCDdHT9jiGTu6P9TdgdL3HU="
								}
								multi_step: {
									hash:       "J3JVPUVUFP1G8DAI66P749D98A1ULAC7JHS1M6J6DQH9U3BKO2Q0===="
									scriptHash: "ROV86GER5KEIHJGF8HJFSJ2H70R1F5OK5CLFLH14I01P4G19AK0G===="
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
										cmd:      "cue vet -c -d '#Project' cue.dev/x/goreleaser@latest goreleaser.yml"
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
