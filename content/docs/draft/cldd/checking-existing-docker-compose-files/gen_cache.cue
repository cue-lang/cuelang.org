package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-docker-compose-files": {
						page: {
							cache: {
								upload: {
									file: "oLOqL72eybABrnQvki/brHv87FTcTPcNo9jlswg6n3M="
								}
								multi_step: {
									hash:       "2UASRGOV5UBJ9S2O9MBVO2TI5KAFS0GJP6M6AJ4R1KUEDSL4M4EG===="
									scriptHash: "PRKUNITJAID2ME2LBS2SUJVLFULTMT8MP7BJ1HJ9U9T14E2R7K20===="
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
												# Switch to CUE tip, as this page will only be seen on tip.cuelang.org
												# and it's easiest to align behaviours here, inline, rather than using
												# the internal/patch/tip.diff mechanism.
												"""
										cmd:      "export PATH=/cues/v0.13.0-alpha.2:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c github.com/cue-tmp/jsonschema-pub/exp3/dockercompose@latest compose.yml -d '#Schema'"
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
