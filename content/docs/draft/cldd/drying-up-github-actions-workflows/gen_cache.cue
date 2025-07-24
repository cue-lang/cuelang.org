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
									"test.cue pre":         "78YwtnI7HNVQB1lserWZ7fyqjNJUxKPSzjngxUWtpXQ="
									"release.cue pre":      "O6hPeGKffV9mImVqhEEuR05Bw507xIxz8l3ExXBrs1g="
									"test.yml pre":         "Bv1TVw91UtYrU2R+jCVsseFieLlBZEq28o9J6wGFlek="
									"release.yml pre":      "v50X1Lgov5yWdHkGL9zl+ZIbLBomy85gVU2rZJxKH1s="
									"test.cue post":        "44+HxEW60smZesA4DlzzAi3lyJm9/gMFM/h0Qozw+LI="
									"release.cue post":     "7yZ5KQL8gNUMVxoM5PplZgxh76PAd8UJx0Ocmy0/138="
									"workflows.cue":        "/jOB0dGzmWfAAXb8Hyhh8QKlIzdJB5OlL0L5bZydBS4="
									"test.cue comments":    "quLhJ8N14yndMfFE4tGroJZNiWrDvoQZHlqvI1T7gN8="
									"release.cue comments": "8NCrAyxIHsf/u0S8Omowi+wWY2ZObL9zs9WlL2JJ4tc="
								}
								multi_step: {
									hash:       "J3VIP32RD66QPG9Q9FBEJEV58637NSD9AN1SIIBLSB8RS7161SMG===="
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
