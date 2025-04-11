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
									"file 1": "EyL3MiEYNazQFI8yK9vACTm0HGT51JOuggL9PDGDA/8="
									"file 2": "/qOgFY1WHo+1vyg0TC91S+fOQyi7Cte45nfeXOAwD1w="
									cue:      "EYm0wXhYQN/bieiSQav3yXtX2REKYRFB5XxuL8lX7TI="
								}
								multi_step: {
									hash:       "C26GFJ663I6UH2RNLSA8EEG57544IBKRNKR18JPG7V20OA00IBAG===="
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
