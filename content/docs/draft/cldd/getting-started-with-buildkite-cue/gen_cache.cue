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
									"1":  "JAT1cH7Ala7iDRK8xD5pjOPdGCOgwMKFnDPc+RxBkaM="
									yaml: "7ryhqSJax94Wa2tbOQplGH9bbGwzfxir9zrKM8eyxvs="
								}
								multi_step: {
									hash:       "DQP40JCL9ENG01EGA5ATHCK0399BSANRJN0QPP8HUV988NQR89C0===="
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
