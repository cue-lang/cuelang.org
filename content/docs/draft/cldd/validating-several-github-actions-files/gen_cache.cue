package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"validating-several-github-actions-files": {
						page: {
							cache: {
								upload: {
									"file 1": "YYu7LAulOV6k/ii3Kp3Hr2G3/1PBkhar82p86QKWT6k="
									"file 2": "OGXZ8kPhuxiMFN8m+X5f+hXqrZQSRG1smI4A62BUyNE="
									cue:      "K7ZmYVT5DSdjZx+EkQdSUS/RbYMw6c/Euqrc7F05XMw="
								}
								multi_step: {
									hash:       "LVCH4L9EIRF2JGD38VQGENODRUA6788JBB4949NJ03PAE7O4N8T0===="
									scriptHash: "UGCOOITMG2O7KKS7P5DOEOV1O03AHI2UVHMLTRD59MN8VP646HIG===="
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
										doc:      "# TODO(jm): revert to latest when it has evalv3 as default."
										cmd:      "export PATH=/cues/v0.13.0-alpha.4:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-alpha.4
												...

												"""
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
