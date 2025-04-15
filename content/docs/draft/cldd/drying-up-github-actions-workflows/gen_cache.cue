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
									"test.cue pre":         "tNdAdeByDIUJSG/EdnmrkeIctkBs+RpmoEZWpjiiRYo="
									"release.cue pre":      "s52R11hauWGFen9jZ+AETrbwnr2/GI4BpFJR4Cceb4s="
									"test.cue post":        "Cj/Arur/dlGdu/DA0jIAX9dKVMXJb8ioAgf4R74oN6M="
									"release.cue post":     "DXg8Rqj+YgDqi/d+LMcXo/d4W12tmJEaRHQcU4RBetE="
									"workflows.cue":        "vttqYDkX4/5ohBprGbDIc7KhtVF0xXCykolTxyR1r4Q="
									"test.cue comments":    "gYicxTus0axzINvD+Kg2pRK+vrUMAnESyvmIpJOvPHg="
									"release.cue comments": "y0jhIdfb+FgZlkPagikvInL2ADw3ZbcmaqvNKwPYxHY="
								}
								multi_step: {
									hash:       "5RPRSD6L29NQ1P2UCJK3C9JN0LV3V2UEHV4TDK28IQOE5I9G76VG===="
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
