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
									"1":  "8Xx6wmqvY9u6YH2lY7AeAWqIYPlHYq4pFuRCh047JA8="
									yaml: "7xRlsvziJWCX8ajS+A4A6fmAZ06VDSb2psuDEBZvriA="
								}
								multi_step: {
									hash:       "M9J54PFJ4K98CIV4E3H840S1MHL9BAMAML2Q1U1UI2R12PE3QI90===="
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
