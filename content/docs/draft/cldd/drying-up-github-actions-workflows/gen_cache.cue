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
									"test.cue pre":         "fYb++8w7hoD6Qt4nzICEwltcESAoc0L+E/VRqHawdfM="
									"release.cue pre":      "37gLCKNVnc3LFdocgJiHLrLe3unT85GfKgrR16bg05w="
									"test.yml pre":         "DaKHXdOemmr7cv3mUKUiNR5GqnARK201L0lVnErUxRQ="
									"release.yml pre":      "T0+ZAYm/dSbhg2dA/XlhJ+CTXABoRUvzYOoYs9TaJPc="
									"test.cue post":        "FsmZxPvN45v6uUPGSVyHTcaeeGs3eGACKcKZrSZx4RE="
									"release.cue post":     "lKYQPAlnC3DfnssBiu5x8Gx1VS9NSWXDWoykYTxi0cQ="
									"workflows.cue":        "cvHEou1/Ofk5yv/Ia9xiAuT3rfkwePI0Gedr0KAqvYQ="
									"test.cue comments":    "/Fo0OedkcMkk3xVy541P6tDTnK9SKKOqEnlQYIZ3/IY="
									"release.cue comments": "eyNbhyYrc3GUOcUMUS9zoyAWJqNUKpc1seUNhAHvXeY="
								}
								multi_step: {
									hash:       "BEQELFUH06427OU690RHBFACC1U014CKOMP03A6236FLO7GJGFR0===="
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
