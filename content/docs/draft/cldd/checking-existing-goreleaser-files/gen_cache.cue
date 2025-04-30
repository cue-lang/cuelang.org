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
									file: "pLnqOxl22Y5gdQ+Dn/4m+CouXxeTFrtlLYyrCXyVtjA="
								}
								multi_step: {
									hash:       "TCPUTQ69B73UCGTGNMUL9EDO9S15R270U85RBUM6JEOA92J979FG===="
									scriptHash: "L1TRCSD91LS5H8TTGAC6VKQPGO1STE7VVUF53BPUK7DL2OK3AMT0===="
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
										doc:      "# TODO(jm): revert to latest when it has evalv3 as default."
										cmd:      "export PATH=/cues/v0.13.0-alpha.4.0.20250430133040-3ba376f34cb6:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-alpha.4.0.20250430133040-3ba376f34cb6
												...

												"""
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
