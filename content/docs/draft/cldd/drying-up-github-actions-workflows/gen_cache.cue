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
									"test.cue pre":         "l1yx4WF9gPtVIzwc28wQBfax0HSTsXL3eIQlV8jL3Vk="
									"release.cue pre":      "+EJvY1+ETh4/XxW6fgfZei2ekBDhdyzWfIopKgilXwo="
									"test.yml pre":         "dgP85GBqSvjm99EGetbDkIxeyABV53vn1VdOwm3c3S4="
									"release.yml pre":      "MvJhzQN/eZrwihsm4n47XRL73NVK2wNkPqfI3CG+Bic="
									"test.cue post":        "vn0NKVhYz156Wb7YmUc9uy/3Gd/iIFuHfJ7adAXIm5w="
									"release.cue post":     "BDT+feMwXnJWrXc888IRo72MkcaG52c2DqrMQQEpExQ="
									"workflows.cue":        "ycx8ex6WdlS20o6tNtC1ny4gyMHcqyZSNvebTwYWWzQ="
									"test.cue comments":    "L3aAKuJxOeipok0VJUVUa1FAfvEWVqFTitA+9+OGEwc="
									"release.cue comments": "qFvucDh4Yw0020oJcGwsoHKjY1mV7qZLlPcbQgHtBd4="
								}
								multi_step: {
									hash:       "13352ERP695K3HFUTBD022F89UQ82LPTFSB6HIJ2B5GS25I7IKC0===="
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
