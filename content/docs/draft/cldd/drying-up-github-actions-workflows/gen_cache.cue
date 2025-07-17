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
									"test.cue pre":         "+0FLha5WGaSjakrCMOGRLjjpb36W/B6lYeG3f/cgFPI="
									"release.cue pre":      "4Br1LJCfip+mDULkFS6dkpNWI+I12dYnEcRRsHjx8BM="
									"test.yml pre":         "RfCU+FGQKTNV0TW1AnbVaI41gUpNBWPMJUnAQu1ya1o="
									"release.yml pre":      "5HQR2AGYjM4wVpHZnMvcMBTTTMIA5tmzL43404jCZwQ="
									"test.cue post":        "02T7HrQzRUrVQmm9ZKJjy8Kkt5clyBaBBUB8BKVwers="
									"release.cue post":     "Q7Cyk+LriER+RZu8YlIlQXMTMpBvX8QoLzWkN7Dfga8="
									"workflows.cue":        "vEumoEtiyzTi1v0AsR4iT57zpFyErSnIboDBTteeFY8="
									"test.cue comments":    "ESG1gzWcJxj3jAMuGJ7aDOH+egpD8DsRatLH5UW1ZOU="
									"release.cue comments": "ROGG88WzFbqqZ3Vf4XyzoCrmLaT555O092zz9WIRyps="
								}
								multi_step: {
									hash:       "O2AF0M8UQI9MN5USEMG41FFB53J7BF0IULGNDVJEKHL6IJ3LRHFG===="
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
