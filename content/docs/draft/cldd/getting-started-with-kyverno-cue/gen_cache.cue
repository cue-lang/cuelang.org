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
									"1":  "4PPWLqJ4EHmxo58C71pMzq09QXPm5nn5TnMoNQSuXkQ="
									yaml: "W8eIKLnwQ0uv3nmDQV5lm2UFBd+FyO1JBMIAOjR4gkc="
								}
								multi_step: {
									hash:       "2HIBSP2IAM048IF5PUDH6I7JF76235SJAC13VP1U9HB4AQ3HGR10===="
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
