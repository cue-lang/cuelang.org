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
									"1":  "SfN1IatsSitIW4cybljckBZf+KsmtRQWjU2maju3esA="
									yaml: "APndsxmhUfzsMQrMCq7eR1x+wEEJABH5XciIPvijAO8="
								}
								multi_step: {
									hash:       "3SBCGNDSNFQ3HEMECCAREVTD325KS3VOSH1BPKKK2OS22KVVKHK0===="
									scriptHash: "2K5RFSNAIB60CEP47DJEDUCNQ4PQBF07AT53E2VGMMS0L25Q0MBG===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.4:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-alpha.4
												...

												"""
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
									}, {
										doc:      ""
										cmd:      "mv .goreleaser.yaml{,.got}"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff -u .goreleaser.yaml{,.got}"
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
