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
									file: "tfw2Fti5HQDlXlSt4kBA/oTXTASFu+2ZTDbTNibEUv0="
								}
								multi_step: {
									hash:       "BPMCK1HJ3JQC7G3ACFSN94URDBGSHLG9JAL2CJRD0L4KN6NHEO7G===="
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
