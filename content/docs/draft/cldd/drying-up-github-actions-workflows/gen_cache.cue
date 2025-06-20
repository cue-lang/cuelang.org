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
									"test.cue pre":         "OK0E4vvyIWQujKrk9/qvMj0R0et06CMIg4W6ry7arzg="
									"release.cue pre":      "WmLzTP3MesQ+kUtTduS/zNgDZxcIX3syme3rPGpU/rg="
									"test.yml pre":         "3nhtEOPwk2jxkBulrGyptlc1M0k4u4UY4xxk4ImFt6k="
									"release.yml pre":      "0i+mYXwOhukRqTO4nSXuwZeMWF+hM4tzpGf7iaECFOE="
									"test.cue post":        "9fcW5ZdlYCFkwfrxbmLPPmm5z2y4h6x5Cze4TzHYYQs="
									"release.cue post":     "HMbv9UHdmN80LUMUnMlhCU8SfeVRJmAg+ztV1mfZeK8="
									"workflows.cue":        "xhY1+wa5tTCTcWm3E0qzpVNLQl/rYYljO/e2mkx8Z2U="
									"test.cue comments":    "TCAPWswGRFd5nSU5da5GwLXQMHll6vRA+I33bnetWXA="
									"release.cue comments": "DpG3f6WqaWY9oomwye6dBCYKyIGcILDpoMxGNolfmDY="
								}
								multi_step: {
									hash:       "Q5D55665BMKQ093L0IPAK2G45AP8MHJ6SGJEBLU5HCE7JNULRDL0===="
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
