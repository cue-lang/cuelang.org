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
									"file 1": "1zQgjEFLmPtVHQp6LqoewSEVgpXpqoQcA2HSn3ve6Ko="
									"file 2": "CZtbqE6xj154sDg/vOHbbgf6yckDN6FJYYU4EXPktOI="
									cue:      "w20pHpI0Y8zhvf6nLaj2fg2SflQHy0uKVQxoKxVpD08="
								}
								multi_step: {
									hash:       "MP7OI7IQB5AF9V4FRBS0KPEC76QQ95SELOL2O9C9R5HCG4ME00G0===="
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
