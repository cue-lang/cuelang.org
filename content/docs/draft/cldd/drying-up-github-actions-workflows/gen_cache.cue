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
									"test.cue pre":         "kgv/eaGkJ9MdhGoTaCMm+te7RhKjk/+XK5JZBcUtHxU="
									"release.cue pre":      "lgkrpEbj4Sm4DE0s5JYbiTfE2xPiNKfI8QuMEw6ZCFw="
									"test.yml pre":         "yn0Nmq3MxD8vFJymUzVkisLYgD9iEOVr691uqqZKEVk="
									"release.yml pre":      "DAoG6UcCWQ1fb1DjmWJdmnrZPwqX6GZt/ya/TmrH2Wk="
									"test.cue post":        "d97sdB+yuZ13zV9dFFt/DxtJx7m5wgaZVCrSkSXxfeM="
									"release.cue post":     "ym6T8S67Kj0lzZQOsNBHrDYvOyXgRN0S46yVl37EgMk="
									"workflows.cue":        "ZiGNMi9TuxUipF7ebpZNBuiszoA+TYcGSaxazVSnZuU="
									"test.cue comments":    "cFvJVfdsdVCLTwWhbeyrIQ6WvuYmn+uQ47e8hn/p/fQ="
									"release.cue comments": "MAZMNPTunHnvFbRHeCNEqcbOGbcKmOsuXz7TV4EnGzY="
								}
								multi_step: {
									hash:       "OBLJ6B4T0F0BG8G66CG000TVN1A2AEMA0E206C989E55N0BSJNU0===="
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
