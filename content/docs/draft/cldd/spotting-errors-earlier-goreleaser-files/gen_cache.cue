package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"spotting-errors-earlier-goreleaser-files": {
						page: {
							cache: {
								upload: {
									broken: "eoHKqBZp38BacqX9TnNbkXbawBtXvdqtO01356GjCjQ="
									fixed:  "SZDXErsqSG4GPlcRnQC/zrw0O9nT3OiR6rH6LhdxF1k="
								}
								multi_step: {
									hash:       "C3KO6II712J3B4NUR4D0A5RVPMGQ143FHG4VL77LB8OASD0HB1P0===="
									scriptHash: "QVDVHPTFHNDHJHG0QJQAAIITDKBPRL6KKFHJARA6EU5BCFL202NG===="
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
										cmd:      "export PATH=/cues/v0.14.0-0.dev.0.20250530082924-23f252784fe2:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Project' cue.dev/x/goreleaser@latest .goreleaser.yml"
										exitCode: 1
										output: """
												docker: field not allowed:
												    .goreleaser.yml:7:1

												"""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Project' cue.dev/x/goreleaser@latest .goreleaser.yml"
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
