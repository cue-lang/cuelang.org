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
									"test.cue pre":         "OGAIZ4zGsNc8erdBjXqfz3ImSE/TzX6oMPmU+kvEEdc="
									"release.cue pre":      "pwF4gWK2EZle5w6di7pMGZ5wds00QWuht4Rhpd/oqwI="
									"test.yml pre":         "G3ompIYpDVlaBUDbdFG8Ni1kW/NAzt5QNdrYhKshicU="
									"release.yml pre":      "4A8MsF3qas1uBc1sjhmepKTrh/lktWbb0qux/6i8i0Q="
									"test.cue post":        "XOqAqA9IFx6+SC24qcnMEbrVICnsyOsLURfRxIbJ3Hw="
									"release.cue post":     "1BPF3p3mHRpPzajK/NCOhoVELViHZhWP+MTG4CmxcNQ="
									"workflows.cue":        "0HbNy5NgQvXQ4hDDgPbXaUWt5jOSBqYYcNANIUEopzk="
									"test.cue comments":    "JyHMThkhFdS9ISsytIaY4cy9NNre2xQzWCEES116HME="
									"release.cue comments": "/3hHDY35s+osL5cdlTsQLvxFgieZj8j2tZJ1aaPVnvg="
								}
								multi_step: {
									hash:       "DP71RI7QN1LUH1PN0PMAO4O6DMHTFI0NRDOMNB71LASSILAT2HNG===="
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
