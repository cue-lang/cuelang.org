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
									"test.cue pre":         "9kuvy8mAdB1GCWA3qMmEUiAqJz5e6DLau0b2ApE+B6o="
									"release.cue pre":      "ype58q9ZJgIyuQO0DtIDLFXIpz409iRWd0AmazAhWaY="
									"test.yml pre":         "4fBf+jLQoiYoaQg2Fi/civPmln1cH7ElvSee44NxIU0="
									"release.yml pre":      "d8VoczdWmSiZljAOQsnIYs2Jg8t9nCdfoxgTLmV99Yw="
									"test.cue post":        "yNZUEGlw2BVMl5TvRMVvIlCR9YV6Mc3TKC4oGIMPCLE="
									"release.cue post":     "1GSYXF78K7Ju7Crc9VZXokcimvoPNToNct1fLS9mGyY="
									"workflows.cue":        "s6wW3tzFqHay5cjLws0OBBlY29X5y+fEiEmB8yjxtmE="
									"test.cue comments":    "QTwC58DFw1rmLaJJFofI3es/FENKgN6znXFZDYP1cl0="
									"release.cue comments": "bARyGqeKVfOB9mqueKe7IUIhVkFz7XU3bDUFWyHEuzc="
								}
								multi_step: {
									hash:       "3T2SV6NL9SPHTUA475V7EA670GKQL4SKU1R7UCRQQQMO9J9OVCJG===="
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
