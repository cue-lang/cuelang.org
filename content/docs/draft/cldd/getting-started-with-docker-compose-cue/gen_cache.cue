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
									"1":  "pvuGuN2JAfg21tGriR8Hvs2duVMrvy7XOvyfUGQ/qEE="
									yaml: "kfPJchujmMjaIzBD51id/1gX73i7b7jfO2w0mqRNbNY="
								}
								multi_step: {
									hash:       "RN2CS0GUT0RG3AGHR61R6SSJVD5MOGA2ORPDJB9MMUBE2021IRMG===="
									scriptHash: "HCM3UAGPKOERTCIAI81A2RJDH55TPNRPO10TR9V0RJE25GS9SSHG===="
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
										doc: """
												# Switch to CUE tip, as this page will only be seen on tip.cuelang.org
												# and it's easiest to align behaviours here, inline, rather than using
												# the internal/patch/tip.diff mechanism.
												"""
										cmd:      "export PATH=/cues/v0.13.0-alpha.1.0.20250313135405-2fe368efde2b:$PATH"
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
										cmd:      "cue export --outfile docker-compose.yml -e files.example"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "mv docker-compose.yml{,.got}"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff -u docker-compose.yml{,.got}"
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
