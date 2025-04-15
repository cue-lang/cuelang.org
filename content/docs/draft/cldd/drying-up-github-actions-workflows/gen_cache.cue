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
									"test.cue pre":         "9JDPFb5NDXm0X4xDpbPAFcXjL5m2SpJeOSTCTN3CixI="
									"release.cue pre":      "BkolMYkNTg9aQ1F+HMq3uhaLmOyBfngJB2YdKrA+nKs="
									"test.yml pre":         "45JHvit1aQ5HVCVp+cTRHP+/aFFPHuU3br5PdQc5pQ8="
									"release.yml pre":      "Ajw+4bVsu5o7Ol0kjdAeXrQAA9YaqPXq+CAXgrQeRpo="
									"test.cue post":        "PdV7bjf9xBm+MxwyPc2G5rmwlLYaqmRYIGHz0CMEEMs="
									"release.cue post":     "cv8EZNVLR/AZUtXCHeXtmAAE6LT1ulhNEyKpM7ef9hs="
									"workflows.cue":        "XykdZh7sK535sdTZU6/FltC4/Gh/SHM31y+5+a5bpI4="
									"test.cue comments":    "62rqg9X8a76vv8DIcEoGj/Zd7a/naly5OD5ftBy/jWw="
									"release.cue comments": "q+B/6czul+3dgrL+7Lw3WCNlxD3CYX1AjX+FyqBRm8w="
								}
								multi_step: {
									hash:       "93OUDHPMPV2BUUJ1R13PER16AGFQGI1HIDHRPRV1JNJEUHFHUTNG===="
									scriptHash: "67V671S8P6Q4DJAK1CEEPRS9PNHT3A0SJ57GKTCP9VBE9I6DQO80===="
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
