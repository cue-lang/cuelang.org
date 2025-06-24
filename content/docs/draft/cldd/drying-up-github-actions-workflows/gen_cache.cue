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
									"test.cue pre":         "0JQ/zJ1fU0OuJ89kprHhJEZAbHSslQak0AC3nsOlNJg="
									"release.cue pre":      "wLVRotn6k/Ko/G/vN9WKehNSmyqXITUNoU/m041EcKc="
									"test.yml pre":         "UAkm/8+dMeAjGTeopXrTBk52/lwAgYDH+g0n3u8eijI="
									"release.yml pre":      "xgTvcpkjUB2pKpnD+yNxWgnlU+yisdZkyRrt8HGOeFw="
									"test.cue post":        "3rnkjD9f9iZewUslVN33Sbc2tyFfaS/95lFGqZol7QE="
									"release.cue post":     "ar4ykQ/nTKrMrwzeam+ZjX4wxSfCOiogDVK9LIvO1pQ="
									"workflows.cue":        "z9Cv/9YVIg6+hndTBsoMJBEq2rLhAL4KsepaPh99Phw="
									"test.cue comments":    "VAQwdN8tNPlN19Y7n/NBwyE8GiWdAkSIGJQNri6leM4="
									"release.cue comments": "WcRZX9rJsnYbOGLKAvFioqUY9NOi0+fU+P3yaUGKGH4="
								}
								multi_step: {
									hash:       "9LH8MJRCPCT2JS93QSM5ML2JSDT35PUH3G184T3C0TUR7NIC5UMG===="
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
