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
									file: "lnezHuJ1ch/XA3o0ntjTnT82hahlNAQyJZiCU/TGnoE="
								}
								multi_step: {
									hash:       "CG81TR0DK4UJD4KI8F23RCLS7C0I17BT4RR1HT7348T1B8ITU80G===="
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
