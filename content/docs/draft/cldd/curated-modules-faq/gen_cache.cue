package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"curated-modules-faq": {
						page: {
							cache: {
								code: {
									kubernetes: "sWTHbGguFC+WqnyNbHyta+yJtpGWfZN9zZmYsRHFw2g="
									github:     "O+DVoOkNa7znvNNqXuQlZFLKHukAiSVU35DiQ5Mwsy8="
									gitlab:     "1Ttch9Q4guZbh5BgtdaaP53u3+Y/o5kGDfOYpjxcbuo="
									buildkite:  "Xpeaj1J7Ii+Hjo475rFdLqgTT8+jwWT2Pa2Am0t2jfc="
									azure:      "PayGnri7aRlTlg3jW0wKw0sP3a4xFAMB4aN6GIUiQrI="
									argo:       "WquFI03uM0EVTZNb2t2x3PhP/YSAwB6QcNRETr/2WY0="
									goreleaser: "U5Ip8VrEVDKSo7iTQIqH9ctMS0cDawNqrPXrHA+qYYs="
									compose:    "JS5WhY5Ft+WSAfOtIYSOkFGO4VtSdZPC9xAd/W1YIX0="
									npmpackage: "pncMfr2qv/HdTo3bJw6jLDInXgabViZcLskWww5ZU8c="
								}
								multi_step: {
									hash:       "6MRKM1FSCPUJNUMRN23L6K8R3ROTTJFCDEEB56Q46P37Q97JTGE0===="
									scriptHash: "9A6PSBCCHOU5VA7LVCUII2AUL3L4JT7REI0FUV5N544T4CKRO4B0===="
									steps: [{
										doc:      ""
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
