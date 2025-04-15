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
									"test.cue pre":         "YylJts4+NYOJ5l5rLKl5JhGg8Z8ig+wv4IksjuovSQ8="
									"release.cue pre":      "68zj+9RE+q8F4gX4ChZ4cNYxoIi7CDGEb7T+m4F2+yk="
									"test.yml pre":         "BwvcAvQQHgzM2hKAt8r42Nb3/tXVEyNyxiJkeU9TR8M="
									"release.yml pre":      "ayKqC4CTtbc3lTwcwOMhJP5MS140MrUe/6upGToAMkQ="
									"test.cue post":        "KOjefy4UaUFgTH5jEjLgwJqSCjkNkX5M8MNE7fglHQs="
									"release.cue post":     "wqJXNYXXq+dXownBCvXY93crlI9dWDWPBMTqXSxUKK0="
									"workflows.cue":        "qKkKGlC/OdLhp+MSF69TAxgTayzYn1wlKQTYjI+T9Ak="
									"test.cue comments":    "wL+2uvqoWh5HK2WyiFcEy+HMEWO8yaSfIigBouv+aCg="
									"release.cue comments": "FbhOM3wsNzvlZSxDcqVqzaQwitYVHSN/38v1dI6HqPg="
								}
								multi_step: {
									hash:       "S62TSJLCRUO85M6NJ24UDA2CNLUMFR49ASG4RF4TM84QHJK0S6C0===="
									scriptHash: "JGKLCUSHCP69KI9T234MCEDTTA8Q2F5HRKP67NQIIMN5ML0OUEBG===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.4:$PATH"
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
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-alpha.4
												...

												"""
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
