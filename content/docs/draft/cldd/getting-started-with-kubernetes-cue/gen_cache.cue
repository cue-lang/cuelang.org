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
									"1":  "ECJyHeiWKxpjmtQ5C0p/Kz5pIBnCK35KLUakQm3gny4="
									yaml: "fqT2AZmUf5F3KAFo/891MMnAcK0am13HjDHdwsIwmFs="
								}
								multi_step: {
									hash:       "LSI6G16BOBRA5FMLLGUOH6OBTMRIE2BFUIVJD7R1KE96UC12V2QG===="
									scriptHash: "15D7DS51M8R1VER4FINJ7AO7KLTAA79OSND3DQBBV9FV3FKM3J80===="
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
									}, {
										doc:      ""
										cmd:      "mv manifest.yml .manifest.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff manifest.yml .manifest.yml"
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
