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
									"test.cue pre":         "3rAzOPWKFnEB5G/ZtXSVlu8baL/dhiC7wp8D8G4y6Is="
									"release.cue pre":      "IEAlmDRDiuZPdbT5uWVY3SrVlR7MdGVX6t105fN0O5A="
									"test.yml pre":         "3zTcbukxEClQwn1lN4gLLWb7a0BTX1w7S+3KLphqMCE="
									"release.yml pre":      "7ubMHArljhMBoGarePbCAa7u3ffOQVAUqY8wKnzBPac="
									"test.cue post":        "WD80LN//RlwZvklh2d/4nFPd1bx9CJ/Xwv3ehMt9Low="
									"release.cue post":     "3r0WY3C1w/5y2RVWApgzsqD6cbew/vKYXbhn2PesrV4="
									"workflows.cue":        "pbIfzjGacnoBUYDpYsJrCpSVGJtyqAhsf8TqUZ1r+ek="
									"test.cue comments":    "r6ni8jNb7orrlBh5wbcp40hy9FG5HuEFU+pjweq+4f0="
									"release.cue comments": "Tyqdc+nfNvVugWuq17cs1goaaFnxJV3TdACqnb/wXN4="
								}
								multi_step: {
									hash:       "JKETP2OKGJ480HJKNUK0V075VQINJM73PEPPR08333PJH0GIGSUG===="
									scriptHash: "PV1J3TC30PBH8P7A32RLIHV3T8JPDH3776GJFSBGJ1O5KLRKLJNG===="
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
										cmd:      "export PATH=/cues/v0.13.0-rc.1:$PATH"
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
												cue version v0.13.0-rc.1
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
