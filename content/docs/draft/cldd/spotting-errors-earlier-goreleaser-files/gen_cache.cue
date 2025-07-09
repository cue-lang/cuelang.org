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
									broken: "hIoyja0apQRcm7aO5x/PeGkHit8S66YFW12b0b5qLyk="
									fixed:  "56tFyxKgR1od3h4zXVmfmDzqKwA2OVQnnOCalgGD43k="
								}
								multi_step: {
									hash:       "EJ0CH82VGSH1G3UEVC37AKEVPFMTJQKUOO6IPCEKL4S3CV7U3TDG===="
									scriptHash: "Q4IEVKNFID82HN75T2MB6FMP25IGGSEI0AJKTESJNIG8F2A0TE20===="
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
