package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-docker-compose-cue": {
						page: {
							cache: {
								upload: {
									"1":  "Ljl6UWgxUOD8nNsv6SzXsneFLIB4sHJChom9Q3pWdXo="
									yaml: "ohVTlJUKasQ/ra1EqfkBbpdu770bFtQCz2Gzi1mm+9E="
								}
								multi_step: {
									hash:       "44MRKHABAEFSUUUUVD7D6ROP9U7FKJ1QROJRAGCH8K58LE2JV9SG===="
									scriptHash: "UI6OP8R02C3ORG51CNV7SGDDI4DHKBOATN4093CK5O9NUN9QN9A0===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.3:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-alpha.3
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
										cmd:      "cue export --outfile compose.yaml -e files.example"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "mv compose.yaml{,.got}"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff -u compose.yaml{,.got}"
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
