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
									"1":  "bjvrKYjsf2Rop6rqG+gSHbuFZgFv0JCKUqITvWBA0ic="
									yaml: "+Y+PA9itrbRiIhWTAiM3+udXsdZM1VpPLBm2Hi8J90M="
								}
								multi_step: {
									hash:       "A0PQ3OKO97P0C7FKH0FEJJMR3JN614POMHK7T99O788VBUNV3HAG===="
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
