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
									"test.cue pre":         "ftdW5tPujVOXqW2UALkye5yalWfMrfNX1/UD2xmlMIw="
									"release.cue pre":      "wh3MZZRpVauXRli+x2KpzpFWhBMcKaOeE5rpsOyUa2A="
									"test.yml pre":         "AS2txETP4LDcFphd3pn9QDhSWCiF4KjCrwVnwVe1FN0="
									"release.yml pre":      "rvQxlkCB3pnzr1GE+0bCTwt2jHipk5xMBs9sgzA5050="
									"test.cue post":        "J0aMhecHcrUDHVTAcwf58aifmF0rbdWifXk2rsxCOTc="
									"release.cue post":     "N8LWTDO/A+OeidCxu31stFvs9nWrvqzx+GHatp2WTvw="
									"workflows.cue":        "SUg5612UHr7AdKCa0Sd9suXz2vF8rliwmnZXkrUMjHI="
									"test.cue comments":    "aM3feLQFiRLHD0p5nmB0ItgIK4MWcJe3K+esfTtVGMk="
									"release.cue comments": "Trak6MSoiacyX9L0+Krk/BgBCkWAC+hjgR2p+qPP1Xc="
								}
								multi_step: {
									hash:       "G13NLF3QG0JCQBCAEPJP9GCEBTB2KH44K7GGJ4TPA7CGPFUQL4L0===="
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
