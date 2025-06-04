package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"validating-several-kyverno-policy-files": {
						page: {
							cache: {
								upload: {
									"file 1": "RMV2yCpFX7m9luKRNNAYvj8ZOyZs2UsVLo4whCVGi3A="
									"file 2": "s4w6hMxoQrtqhfb7RO3Dba4oS07GiIDkm1BTUZs6i84="
									cue:      "W+wVelv07sWMlMz3qSws7OUBiHfeFkM+ws5WEbr7EyM="
								}
								multi_step: {
									hash:       "PU14OE9EOTFG8Q61EHA4B6BOS96SB1FGLNNAJT76GM9DF4UBN2U0===="
									scriptHash: "NMCSG0PHJS1IRF34BSH33VB0VG5P7SU4F77P2RPG44HMT4IME6CG===="
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
										cmd:      "cue vet -c"
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
