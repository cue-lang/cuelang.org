package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-buildkite-cue": {
						page: {
							cache: {
								upload: {
									"1":  "wDW1YpjeF49obyXjC8gI8uNzaPvYWPmyGQg1U+Xa9FY="
									yaml: "3dfgp46np6yopCr/+bpdSsxNcbP4ls397vf5swvtAHU="
								}
								multi_step: {
									hash:       "53FG9JMSLNOTE9B73ORPOPLEHDD61TJ8KLH1OT1G3JJEOUP0K590===="
									scriptHash: "RV90L1G24CDNPQEL1EGQBE26EPC8NADG88G2BL02U2DKJJNQC2N0===="
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
										cmd:      "mkdir .buildkite"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile .buildkite/pipeline.yml -e pipelines.example"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "mv .buildkite/pipeline.yml{,.got}"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff -u .buildkite/pipeline.yml{,.got}"
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
