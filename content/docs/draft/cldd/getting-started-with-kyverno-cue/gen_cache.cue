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
									"1":  "BhKaH0q3mv0GDr2jeLNuzK3PUVaLFiFsYPdvmU4dYP8="
									yaml: "0mPgMwg2uZFpyT8y92xFvVJuM9Blo2zh4AZfqglT3nE="
								}
								multi_step: {
									hash:       "82VOE518NC2F220LN8DMBO5GC01AS7O213L3O54HG42DRJ6IT210===="
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
