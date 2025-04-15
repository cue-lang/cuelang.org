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
									"test.cue pre":         "yph8zjCX6PWhWCrEhYwTMOdvyhho1IT+GYJVPWbqQbU="
									"release.cue pre":      "D9a1uAbR/ylUr+SC0KS7l9E4UaqA+2CCkKCC2zHW9XQ="
									"test.yml pre":         "s2F33kNW02VNy6wJtTd4ylypjAnj2Z0X2vypNk+5AHU="
									"release.yml pre":      "hSOAD290bkvDSgYVSSMhVpZLksaxzELjBCdpMG3aVWI="
									"test.cue post":        "wfiRonjMKxRIa4F+z2MWsCF375jhnI+9CaAIDZxrl70="
									"release.cue post":     "4askBdi1M5kKLzKSZa6ZR9/q80XmFdBqs19f+22kiWc="
									"workflows.cue":        "aWRxsa3jpIkzIY29GYl5UCsn84QjPa2GwNDVg8KWFZA="
									"test.cue comments":    "OsLV4wbnvguQ6e87OTUYi2ldEWxw8WCvmsOwwdUOUMA="
									"release.cue comments": "6S7qPxQzs9x97iOtysrkL0fNGuCmbrJUkBJWJ/Ica+8="
								}
								multi_step: {
									hash:       "BRAOHCKEH77ML9GJED02QRC9OK3BM0D3IMOR0LP4BPL4J3U4HSMG===="
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
