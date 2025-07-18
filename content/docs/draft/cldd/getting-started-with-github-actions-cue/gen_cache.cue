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
									"1":  "tRsUJgSvn9nr9jfXomfMXqTmC1p/hjptUv2LfVUDDh4="
									yaml: "xkBYcy7EkWKCBMzTiK20O6A1x+Mh3bs5y653lhSufbE="
								}
								multi_step: {
									hash:       "HK7S5PRME14TK2O05OC0C6VLN5C7JGI2S2GJI6B466P7TRBDAH2G===="
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
