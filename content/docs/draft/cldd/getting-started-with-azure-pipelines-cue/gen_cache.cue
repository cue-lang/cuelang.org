package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-azure-pipelines-cue": {
						page: {
							cache: {
								upload: {
									"1":  "eXnVES9O6gIZXLmeCUXvpMQLBYuowseDCFFrY4gJtfY="
									yaml: "BIrNX5DbQTtRcXuVOO5PaPBsYQjLrVpvrtiyOUIuAd4="
								}
								multi_step: {
									hash:       "A94MSPCGIU7VUUE7SJ3E4DCL2ON37HUEN1SU17N451RA7P580UBG===="
									scriptHash: "HL86A0I1EREE6OE78TQG8S6CVO9CKT1G4QGQ72M0BGCFMNQ5Q020===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.3.0.20250411164907-08c3542c9d96:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-alpha.3.0.20250411164907-08c3542c9d96
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
									}, {
										doc:      ""
										cmd:      "cue export --outfile pipeline.yml -e pipelines.example"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "mv pipeline.yml{,.got}"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff -u pipeline.yml{,.got}"
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
