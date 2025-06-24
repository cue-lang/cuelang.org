package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-argo-workflows-cue": {
						page: {
							cache: {
								upload: {
									"1":  "DNmEVKyowC7lKjZHRzn3iYPl/PIAcWczJ5MUcilyHZ8="
									yaml: "LpB6EusmZBPbTxBrPxSzUzwzEMwqJ7tNzFN+KeisGgA="
								}
								multi_step: {
									hash:       "TI1VDNRPHOL6OPISG8MHBIP7E7PVT22G6O7SUJ9T8QJUF94M2NLG===="
									scriptHash: "30PAI0AQE2COEE1PQ8F54MBEMQV3VUA4JKEB04GINP19MUE6B8GG===="
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
										cmd:      "cue export --outfile workflow.yml -e workflows.example"
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
