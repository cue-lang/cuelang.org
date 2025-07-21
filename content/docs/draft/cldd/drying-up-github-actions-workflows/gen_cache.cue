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
									"test.cue pre":         "2Zqlbv0JysWbRrfpRGmii1xESddmMiwyLWBQu6ReCI8="
									"release.cue pre":      "7GFBNxlHbg5vfr2DpgnWcH6pNVPp4RtoQt0xHoO7sEY="
									"test.yml pre":         "lB/GIudqfhbwbcLGQB/SI/ggCbM43ezGALMhaBSAD+g="
									"release.yml pre":      "YKrO69ZyIuGuJtvIgWFGBnZIcCXGqLEFmxq3Yi3RmLo="
									"test.cue post":        "iF+gl2R0ccGoHR1HwMdivqCU9rYNXQ3rNzNzGhVDRDU="
									"release.cue post":     "KmeTxe3+usf5MYd+YSiys6sbHEGK03lnUtfYmfCS2Pk="
									"workflows.cue":        "yCR/gpOCCkO5hKosrQNT8JwiNJ8psM+V0A8QUXPSIoo="
									"test.cue comments":    "LR4ceoW5v9jHQtbCtphCtOZB1/aRg7tQ8eOpAxtpoQQ="
									"release.cue comments": "VIJKx6bo519Rbfy+iN39NuW2hoAo45Zwj6ec6NkRoKs="
								}
								multi_step: {
									hash:       "0DFM5KIV06FJ0NQFJ093QKM3BIRS71HLTO51TJIH6T10F93P2ULG===="
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
