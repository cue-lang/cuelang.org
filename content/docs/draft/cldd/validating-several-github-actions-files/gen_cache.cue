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
									"file 1": "YW1jxK/RY8kF9Q5VSUQMfkwehhP8P18FG/oJbDFno8Y="
									"file 2": "SJgaRrR1H66IZPFDVkbLn82LJ0Cuw0CiN24wAf1ld6Y="
									cue:      "V4BEvdtKjtV9A6f6aGuFLHE5oJfMSWKUSO01dmJBSmE="
								}
								multi_step: {
									hash:       "DV1GA0PTSF25EIH6L8B66NHGVN6DVHK42UK876H6EBG16443G2M0===="
									scriptHash: "8F735I4NC9I7A9E8QQ723EML45TTRJI1G7EUPHII2LNDRN7HRAC0===="
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
										cmd:      "export PATH=/cues/v0.14.0-0.dev.0.20250530082924-23f252784fe2:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.14.0-0.dev.0.20250530082924-23f252784fe2
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
