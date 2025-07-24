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
									"1":  "qqDTBJhvdFUcEOZiD4bZ5A2SSeHdSqlRNhDQz9tKRkw="
									yaml: "TiWv922M/FuMLOxpEKAiKfMa1COVOFXW3/s8c1cM0H0="
								}
								multi_step: {
									hash:       "OJ6650KBQPJJQIIU1318BTARCQAN7965Q9FKQ7DK88G455NCSJV0===="
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
