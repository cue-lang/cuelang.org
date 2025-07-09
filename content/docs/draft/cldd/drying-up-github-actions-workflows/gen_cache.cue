package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"drying-up-github-actions-workflows": {
						page: {
							cache: {
								upload: {
									"test.cue pre":         "sIMy2YcCsHEbEe/IOV+WV5nn9DC5vhsjxDHnqTZB+Gg="
									"release.cue pre":      "KcbWy5PBrOO2CF8ZvGEP54x38/nG/ZfP0nHPSkno7mw="
									"test.yml pre":         "CC2ngAuu+L9c6lNZ5Au0l9kSb0woavfc1Tfz/YCX70Y="
									"release.yml pre":      "Fhd+bVi+MwsguUY4/1SWJh0/TSuQvzT+umZ7iHCJQAU="
									"test.cue post":        "4UgL7uZ5SzXmkMrehj2fLhC/ScW+9gKryVFN6H5DsZg="
									"release.cue post":     "lUgVUStqQX8+9uwyeEiSiA2eFeM3A5izSWbp6/7Idfg="
									"workflows.cue":        "Zlj83a/k9OttP3OWwcD3VMNUayrk3gIDPzSnr8zFK9c="
									"test.cue comments":    "gYMJwTkZ1rGGIfuE+X1dhnDAjCXGTR27fwFlbaus0Dc="
									"release.cue comments": "0qoG8J1//Dj552cS2PpDJLnVz7Z+qlKWEYxC1pxC1gs="
								}
								multi_step: {
									hash:       "P3J9BSB3AREI0DDIK15P6M4EMKRVMUVRF4OAF91VCI52M2UCKJCG===="
									scriptHash: "431471NG5NSOQ12FCB1B3FGDD039B2613RUH6N9MJOQHLJHPP43G===="
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
												# Set up the working directory, given that the reader's hypothetical entry
												# point into this guide would bring some existing state with them.
												"""
										cmd:      "mkdir -p .github/workflows"
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
										cmd:      "cue export ./ci/github -f -e workflows.test -o .github/workflows/test.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export ./ci/github -f -e workflows.release -o .github/workflows/release.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue import .github/workflows/test.yml -l '#pre:' -o test.pre.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue import .github/workflows/release.yml -l '#pre:' -o release.pre.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export ./ci/github -f -e workflows.test -o .github/workflows/test.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export ./ci/github -f -e workflows.release -o .github/workflows/release.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue import .github/workflows/test.yml -l '#post:' -o test.post.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue import .github/workflows/release.yml -l '#post:' -o release.post.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue eval -e '#pre & #post' test.pre.cue test.post.cue >/dev/null"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue eval -e '#pre & #post' release.pre.cue release.post.cue >/dev/null"
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
