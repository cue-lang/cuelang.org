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
									"workflows.cue":        "83MBtVxj9yo7jZr2S/qZvZ81oCKDfCaFckOnkJASwAw="
									"test.cue comments":    "+pbQ+iZUqXUW4N7r+eh8aPRhQV7hWAtD5sR1wRGwYBM="
									"release.cue comments": "kHOm+8j2OY5QNg2z9mmSepYFadI9ssj4C4QEEJU819w="
								}
								multi_step: {
									hash:       "LHLEN25KFEMIN76JFFML4E3NF64OJVLTOI7QU0CQO8UINABP32J0===="
									scriptHash: "FQKREO7TKCB6HCDBBV8DF6EM97FJH423KPVUJ2QBA3IC91NRF940===="
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
