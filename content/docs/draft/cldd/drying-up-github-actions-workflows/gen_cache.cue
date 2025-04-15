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
									"release.cue post":     "7t7Vv6fh+b2xQh1Yy/dvrh08ExKKI8gDWqDAbKAUc6U="
									"workflows.cue":        "AfffvJdwFxuwLSBAnWyK5D8BsqINwrn2tAtadWbqhY4="
									"test.cue comments":    "b54i2aIMwRelieX0A2IvEAtxDYhE3jzJgac5wX/rFpI="
									"release.cue comments": "ZEX/FBXKvYufaBkfd15+lNSf/mYteU5y9QzE9sUeTU8="
								}
								multi_step: {
									hash:       "CPVNP0FJ07ERADK9163Q2G5BBAUP348OMDOVRH5J94FEAM6U8JE0===="
									scriptHash: "27DGC53JFUGC000KHDANEIO1454LF3HD8FNMDUFD0TMIQ6F5ARE0===="
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
