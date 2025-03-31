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
									"1":  "xp87G3VsBQlcsR/qknyri0OxXGTjzOl5dD91nwRbRS0="
									yaml: "ycb75bNAuWopMkMyT//mn1+iWrhh5h4ACrZL1LfghxQ="
								}
								multi_step: {
									hash:       "R8VSACCHRIC7RV0TIVCROLCF0TQG6JP81BB7MLD0N539QC46HT40===="
									scriptHash: "ILSFQG57HG5361OGPBA4PO6J6MOEN1B1EKH0OS16G41DACKDVPH0===="
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
