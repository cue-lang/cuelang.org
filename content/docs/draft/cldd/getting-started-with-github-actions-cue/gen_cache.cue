package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-github-actions-cue": {
						page: {
							cache: {
								upload: {
									"1":  "JDjsXgmysw2Cm3K+meDN4lIuTJX4sZ0EXghE99HvFRg="
									yaml: "QIHmLYCT+At3maJ3+sgsPRdnHGTAPUkTsoKCp7bFSnk="
								}
								multi_step: {
									hash:       "HE75GAJVIB1PFR0GT6A2J34A7BH7E3EF7OQ3FS0CV35GOIOHQ8U0===="
									scriptHash: "P0GT2NQ1HGSUCAFNC2OE2QOJ0VEKIGQRIKO06T1JT982GGR55910===="
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
										cmd:      "mkdir -p .github/workflows/"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile .github/workflows/workflow.yml -e workflows.example"
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
