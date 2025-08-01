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
									"test.cue pre":         "vCXhfsuyg/Ez0cXQsaLdn3l+hqDHbeWORAqYeo6IVEY="
									"release.cue pre":      "C9qVx059M+qt1IZRnKZjZTGKUZyMkrz0W91R+yWLswU="
									"test.yml pre":         "qURjz+AE2bmBWAmrfTXCIKd1fTGjrY2G4TKFp+ntWmQ="
									"release.yml pre":      "C625OTCFqiRRPF9SjcwFPFkS4CNNO8Etg/TjXpTmeEw="
									"test.cue post":        "JRfP/au5UcCifzTDy+vXFFnF9mKSZQhy7xNtABo8528="
									"release.cue post":     "+vBvcz348YOp5tDPykavCJRzrN0DEMVss7DPz+eD01M="
									"workflows.cue":        "6N5Sfr1v/YfhYBRrF7NyoGve0C1L44PdxsXtyiXdYs4="
									"test.cue comments":    "BLA54nGLe5IfuyOCEZE6xUC3oPQNv9Mh4jul1IhOaSg="
									"release.cue comments": "QtxMCSyBXtE/KuSelPBVsMJfavCxQ2Y5zkJcY/iHpoM="
								}
								multi_step: {
									hash:       "FE95JBPUBS26GQTOF9OJMCROMPIPG3OQMVMRE2A5RTDE8JNQKOAG===="
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
