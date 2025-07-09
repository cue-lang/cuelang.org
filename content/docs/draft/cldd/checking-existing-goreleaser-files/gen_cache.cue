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
									file: "/0R0KppkIanPpwh9bRjAg3KOimbjFBYrsF12LJH51AU="
								}
								multi_step: {
									hash:       "8J0N3VOF1QPKP108VSMDRA7AOL54TIF3JAK43QPM3JMD0QT67UIG===="
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
