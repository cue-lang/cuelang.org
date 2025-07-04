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
									"test.cue pre":         "2QXnFzWbGAnv0VpBWnGIqD/o95mYBJ1EhjJctARNSok="
									"release.cue pre":      "QbGniSqjge2Z/B2TB1d1a1wDWAdXPcACL0r+Okyrsb8="
									"test.yml pre":         "lp6tIk5giKTNh/OemDXpcXrC9jI8o0gBkNYAb23PKsI="
									"release.yml pre":      "Ffp6y/7r6Wcvm20BtWfGsTRs4ChUe7RAKEBBmO3VLQk="
									"test.cue post":        "gl6ySBRXEiAg8C35eUf2lC6SJRG4ujicyawPQdvx93g="
									"release.cue post":     "Mx6dohXJZYVNDc31LLyd7Y/EYq5joNBQB+Ue955y5k0="
									"workflows.cue":        "hLGH5+XPnbyjMbMmLAzhU4CWdLqxwLWUmzRJbTENzOc="
									"test.cue comments":    "61ttm0NnR3324hWdr98IN8/UW2rqnS/ZDEPLcCqx6EA="
									"release.cue comments": "6AotanNM41Kaxlmp7uJpDgVYbwDptu15Os/PgRZuPFk="
								}
								multi_step: {
									hash:       "DFJMARC7EMQ8RTMNVDDRCNII6CI78LS6U434J750AV6I6GRICPT0===="
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
