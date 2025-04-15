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
									"test.cue pre":         "5TX55kG4ygtYOUbyeSAHBnokRsCA77VKt0Y/KDuX//o="
									"release.cue pre":      "PsyBlfTOGT1cpwIIBuXBnScvWWyn1zhNbcH/XrXmof0="
									"test.yml pre":         "uHm9sboroSYF0N24KeUVTGndhcSpxM+a2fPB/axQFD4="
									"release.yml pre":      "nQU4s1Xtpzi6p6xX+Z8b4/HG0OIWbLLACLLDjAo7vdk="
									"test.cue post":        "zcemgJ4lw/hgNAYaEZUtzmYp5dWpDYw/uP1YAoeyeB0="
									"release.cue post":     "kSxJo7fy9ho1+mFNmJ0OdxCFHS7uCxEaxo0NhLhcqFg="
									"workflows.cue":        "0R1uVxF/zJ/61lP6l/IpJ/irPEdxqesCZJbBBoKtgM8="
									"test.cue comments":    "+pbQ+iZUqXUW4N7r+eh8aPRhQV7hWAtD5sR1wRGwYBM="
									"release.cue comments": "pkbryIqfZO9Vk5aG4ls0ynDIYE2xnVbMCbqqmKefoz4="
								}
								multi_step: {
									hash:       "BH851FQFMHF1IBAB6TAHDQNCU94HP6VN5OF0F29OLA2L8VFP9PRG===="
									scriptHash: "UH34N3D7VA4VBUD6TOJNS0NJFRO67DRL4IOFII5TV1HETTTH7880===="
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
