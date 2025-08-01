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
									"1":  "zrcRxIK3Y8Tcwn3HShoCqMR9cQlGb0xEzCaei9T5C/o="
									yaml: "pSQ7kObeUAD7qhI2I627ZbLYxL8ZsURrMKzEnAjiFy0="
								}
								multi_step: {
									hash:       "OQJK0R57SQT7JCL9JRSSPKVK5V7N5KO88VU15H4S5GFF9MA0NTN0===="
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
