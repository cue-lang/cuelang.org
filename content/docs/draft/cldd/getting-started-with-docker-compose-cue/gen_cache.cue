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
									"1":  "bQ/9BdaY51NeO9Bw5SJ5b4Pw6TnvtREPD7AfovUUR6Y="
									yaml: "RE438sDtHRIohYU8qYlewEWuOzeMULCnlilEWXoDiZY="
								}
								multi_step: {
									hash:       "Q1AM3J29HD7GDA3UP6FSMACMDRENR0U7FPH1601E1AC7IH06CES0===="
									scriptHash: "BV4KUUK8JF177JSHB1KK00L5DONT1MJHTQ4M1TRQ5MO6JK9PQ0B0===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.2:$PATH"
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
