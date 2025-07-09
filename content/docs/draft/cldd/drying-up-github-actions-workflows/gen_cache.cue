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
									"test.cue pre":         "n4uEq3jchrWfr3eWOPR+63chjb4gSALPP3FepAyPQoQ="
									"release.cue pre":      "KmMCSE5XZcl+lK2ip/u+GSx4hGvg7GrLfDaXPvgUouI="
									"test.yml pre":         "Uvoe1A4in1ir5NmAmp5OgulFIk33YYoPbQ8ssVfQARE="
									"release.yml pre":      "zIUpSWIhgXc13U2YF3A8sSPQSd+n9zdy6sGZEh5WTr0="
									"test.cue post":        "my6/yQ7Z1yLcSy3JAaRt4lRRIyPZlpHncis9ShZfXaE="
									"release.cue post":     "9My2wlgwExZc7wNXWT5Q6MfKkY6yRmpxSvci8xNwoxY="
									"workflows.cue":        "HkDUlW7vBo+dsn3h0vJxecGfHuwk7wsEUPPZfc4spnU="
									"test.cue comments":    "EhXbT8iEz6X8sbHWHJ2H5ulSLqo74OmnR0BuOmTq++0="
									"release.cue comments": "Z4UQCkek3qR1HZlb5hOGc8wjFTpJOnJnf0PKpUQozws="
								}
								multi_step: {
									hash:       "6G92NA6TLLPN274TSAK44Q6AJ6GM63VN0HJEJV6P1BL28727E2TG===="
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
