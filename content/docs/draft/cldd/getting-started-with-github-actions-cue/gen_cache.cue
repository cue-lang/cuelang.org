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
									"1":  "BLTPU1JZ7pcdK+Bvtg3WZeLlktN4ddgswhocr8A8ks0="
									yaml: "zUCw5JxE82V8RkVuFFq6gB5HCAIDC2IEA08J/WrkjQY="
								}
								multi_step: {
									hash:       "NQTEL5PLNS0A9PI4UG6G7HH371LDKEKSVJDT5IH9M90UI02M8L90===="
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
