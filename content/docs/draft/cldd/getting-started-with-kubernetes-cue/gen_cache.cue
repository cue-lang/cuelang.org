package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-kubernetes-cue": {
						page: {
							cache: {
								upload: {
									"1":  "W6LZJwpWafztaMkcvyEzU4ILxVIIoeKeNnc0D/y+JqI="
									yaml: "2vmzHeKCpWuLNPkJbgzk0IflXlSlXDBMlQlaRcqq9Wk="
								}
								multi_step: {
									hash:       "HFQOV1GRAOD5HLHEJ6SBRQHSFIDQGRB4HQ0J9A3E9NFQS0NCP1RG===="
									scriptHash: "RBP1QE7EG2NLP5MAFJBIBV8FAI2A03LEMJROAH0NLLFFKUJ38U80===="
									steps: [{
										doc:      ""
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
										cmd:      "cue export --outfile manifest.yml"
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
