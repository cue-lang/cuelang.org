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
									"file 1": "OtsoDqQeoDZQTW49eAZXXLQWfTngUo3ghN/8Fl0eykY="
									"file 2": "PkLQO6PrOQLc9ERvpzslnvuO86LrlqNAGbgw1C0sI5E="
									cue:      "eKZZdU7Nhcnua0j8Y9ZuabrmlosT8Z9ABsnrSe6Xi2Q="
								}
								multi_step: {
									hash:       "OK161GTBHHFVS7AGNM7H9CAD0V5B2KKSCV79KTV3139ASO05TJHG===="
									scriptHash: "OMIHIFA20JIR3EF80KCR8292OK8VCS0SMKUOO1TG2UL8H4AAOD4G===="
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
										cmd:      "export PATH=/cues/v0.13.0-rc.1:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-rc.1
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
