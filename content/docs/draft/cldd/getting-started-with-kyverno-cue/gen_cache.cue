package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-kyverno-cue": {
						page: {
							cache: {
								upload: {
									"1":  "vW9QUmexELNjfRJPCgEt0OohyTSdutM83MzUjWGR7yE="
									yaml: "ZjHkETdviLFph8nbcsJriazUs1wE16HL2aX1Y0htAII="
								}
								multi_step: {
									hash:       "6FDOL9JB861V9977CF694I314P8LF6DTE13L0JV8G1O2N5RG2000===="
									scriptHash: "PSEGG92KD0REPQH0I0462F7JINL3QQC414DU9GD47ASGF06UCAQG===="
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
										cmd:      "cue vet -c ./kyverno-policies"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cd kyverno-policies"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile create-authorizationpolicy.yml -e clusterPolicies.createAuthorizationPolicy"
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
