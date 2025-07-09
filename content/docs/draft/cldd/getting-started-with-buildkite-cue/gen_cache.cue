package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-buildkite-cue": {
						page: {
							cache: {
								upload: {
									"1":  "T5VfxqEPXqEkCQ2OyLLhkB2Fae5sVKrKoEK73foeW8M="
									yaml: "STgdIesRInYMIHESRv+AzfI+g6IrA+D4q2JPv/yeWiQ="
								}
								multi_step: {
									hash:       "DOFQJQURTPIM8S9KNCE5J5I8SHG66AJLLR7G2MQIBRFA4COF4J8G===="
									scriptHash: "NR1HB3PA9DLP9BA6KRD0MJC18IVA2K9K4JSC88RUCTAQ27ELV1LG===="
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
										cmd:      "mkdir .buildkite"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile .buildkite/pipeline.yml -e pipelines.example"
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
