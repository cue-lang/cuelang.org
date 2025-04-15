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
									"test.cue pre":         "YylJts4+NYOJ5l5rLKl5JhGg8Z8ig+wv4IksjuovSQ8="
									"release.cue pre":      "68zj+9RE+q8F4gX4ChZ4cNYxoIi7CDGEb7T+m4F2+yk="
									"test.cue post":        "eFgP1MnG3WoBDEspSRL0xL5f8whd2nvZx7LoMkHNO3c="
									"release.cue post":     "zBrbRCksFYLcPQVi9URkvscdpe47Pna4AWYfLlWZ9P0="
									"workflows.cue":        "qKkKGlC/OdLhp+MSF69TAxgTayzYn1wlKQTYjI+T9Ak="
									"test.cue comments":    "wnROhHLWNhHQgC4jYWKOFBI6TJV6B0lEoDdC1hUggfI="
									"release.cue comments": "XP1aqvyed9PAsIN7ACOp6jOWjLBKi1DqrAo9uJKVypE="
								}
								multi_step: {
									hash:       "MFEJRR5L79J6GK51VBVPHU429HD3G9F7FHJR0S1JBOCKR5I2985G===="
									scriptHash: "4LJ6PKGI0QTILLEDJUIA58MA6MGJ9OTCD1VND8ATF803Q0GER6G0===="
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
										doc:      "# Set up working directory state."
										cmd:      "mkdir -p .github/workflows"
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
										doc:      "#ellipsis 10"
										cmd:      "head -10 .github/workflows/test.yml"
										exitCode: 0
										output: """
												name: Test PRs
												"on":
												  pull_request:
												    branches:
												      - main
												jobs:
												  test:
												    runs-on: ubuntu-latest
												    steps:
												      - uses: actions/checkout@v4
												...

												"""
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
									}, {
										doc:      "#ellipsis 10"
										cmd:      "head -10 .github/workflows/test.yml"
										exitCode: 0
										output: """
												name: Test PRs
												"on":
												  pull_request:
												    branches:
												      - main
												jobs:
												  test:
												    runs-on: ubuntu-latest
												    steps:
												      - uses: actions/checkout@v4
												...

												"""
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
