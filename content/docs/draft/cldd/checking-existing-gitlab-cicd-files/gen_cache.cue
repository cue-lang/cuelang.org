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
									pipeline: "8I4BAvBfVUcHdAJMjiSgMDvjWiQcJO/PH1xGTsWbPLs="
								}
								multi_step: {
									hash:       "BETJ2NE7ST9KNQAUKN0MKI3G008QUFMR5CUIRIMPEAS6P8K9EMR0===="
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
