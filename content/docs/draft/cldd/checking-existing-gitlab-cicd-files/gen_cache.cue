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
									pipeline: "R3+eez0b+EkLxWFYdStI4x/0tfTIocVOF+ZRo6d4wGw="
								}
								multi_step: {
									hash:       "6R397OI5Q77HJAT095509QNPN2FPM8PLFA7IDJ78U2UTKNUISFR0===="
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
