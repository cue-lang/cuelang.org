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
									"test.cue pre":         "ekx9vaKdaQF7KHb7SCTV3nH0YatL5JCRJiuldVeyRJQ="
									"release.cue pre":      "XfFspOfqkzVhAohCGdgZVNx8YHo6myXPmZcdXpfAR8M="
									"test.yml pre":         "/Hlgh/pmZpv2QHPkrXLqo+iT0l+uFUAfNNZkayyr6kc="
									"release.yml pre":      "1Q5U50goBZZXtNmEuR+R8eO3yClZDAIZifUzHYudprs="
									"test.cue post":        "m3TFUxa86b6Evo24ctscZxeuQMykLPcqyyM1cK1NkNQ="
									"release.cue post":     "EWb8bSTcEIYjhDUaXbBW57zXJF+aq6HharUpgJ6exxU="
									"workflows.cue":        "ckHhwkrdLuNzlVt3WBcCIupsaGVhteoah3fJhe2hv1A="
									"test.cue comments":    "iizrx4r9JWp47WEurWtvaBqxwXaayZXTZOhIblxUv8o="
									"release.cue comments": "kBHvdg4FNimP0C/pKxOn5c114OPCjfUrGNThGZ0TKz0="
								}
								multi_step: {
									hash:       "7AAVNDP5O453FU8HR8D2PO17G1NSK3T65DFJ5HGUTS5DIV4D51Q0===="
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
