package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-gitlab-cicd-files": {
						page: {
							cache: {
								upload: {
									pipeline: "NBiPkOStHycd70XaOS5XuluFRITrWw3Fyt7QI9eBNKQ="
								}
								multi_step: {
									hash:       "9LE0JTSKOBAMP1BRMRR8SSFJO0QO0KQL2VI5HCIIPGPM8MMBRHI0===="
									scriptHash: "HHCO782AA55IG5B9442CQT9OU6IAV163QA9SGHU8D77H9VG7F7UG===="
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
										cmd:      "cue vet -c -d '#Pipeline' cue.dev/x/gitlab/gitlabci@latest pipeline.yml"
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
