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
									"test.cue pre":         "7WeG9lflZd6967WbVFwO3ys9IU/UvoKB3JAP6SzGXYU="
									"release.cue pre":      "rFYJhF6FQIqjG6/dykfppU94qFERBOx0el5mQtbTCYY="
									"test.yml pre":         "c+6YxdRLTGXV1YAOyZXPZEb8dCw36ewtRcXR0POoLJw="
									"release.yml pre":      "xEpDzgbhFfgxTiGoEdhtJKzZILD/VJhu9BMyezjFMW0="
									"test.cue post":        "V1vx/Q4Fm65kd0mjkF/xVa9mwT134IJW1roQl0VsPSQ="
									"release.cue post":     "yjGoydRduWJoD9hEwLS7sCNHHme8SlQj3y/PFeabZEs="
									"workflows.cue":        "MlOjrMIMqVWSuq5He1kMmfHQRtuMwUUR/ty26Eyv60o="
									"test.cue comments":    "9gff8Da5eC5ASR37kOtEE0CXHHFW2jxnLCSW8phYBUw="
									"release.cue comments": "kAHG3CEfS1pj8URPt2GEAITEpRYBb8sO7ywM3eeE078="
								}
								multi_step: {
									hash:       "ET5UM9LEUGE2RLD9AQNP6EKVUEC0PHMSV3TNIGIGRLPQMQJC2RRG===="
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
