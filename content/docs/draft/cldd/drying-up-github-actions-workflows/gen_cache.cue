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
									"test.cue pre":         "MDEn8tpdH1Q0eKGsmV/oUge7d0SU9GX4aoo3O7HVd3c="
									"release.cue pre":      "nBzMZGDsH8gYHSLna+vq5VAJPzd+n0nl6Sn1YNRtj5g="
									"test.yml pre":         "jgSjCDtUvOOBman47hu4lI8RN0roDfs3EBkbL2Bh+Io="
									"release.yml pre":      "fgMORvoNIEqbWJ4MIMoYmgABQXKCq9VjTlvHEc5A32Q="
									"test.cue post":        "jKq2JGXIpz1D533ygRxMZfgnS1rcb9Z+7X5N6rlVtGo="
									"release.cue post":     "aqi1SaMwQwSMovl9j1bmGnOXS1/1N6B4O7gZX22f4/Q="
									"workflows.cue":        "ZDeEtoNnJ2Jp/PR/xEM70dK7WVZlc67LMAwPcjr1VDs="
									"test.cue comments":    "QWa6d6Se+n0fHmzym2QhaavfaUsRlQxb/nubpgh4QBE="
									"release.cue comments": "lCBSFj7grIamI68dVdGSfojh2th5xNMw9DI5HLGulLA="
								}
								multi_step: {
									hash:       "0QGPMC6VFQOQM1BF59LAPD5N9DTHDQK6CKURGMS99A2RLCEO6B70===="
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
