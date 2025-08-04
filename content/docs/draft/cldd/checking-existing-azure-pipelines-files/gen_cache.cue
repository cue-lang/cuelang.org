package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-azure-pipelines-files": {
						page: {
							cache: {
								upload: {
									pipeline: "V+UV/zewTA66EbQft/nWK1DyG2AMSdbHmI4rX3odxmw="
								}
								multi_step: {
									hash:       "BEBE683J2FBFI67FFOK4UPS29UO0CGDE8RVRSL8RBPBLO52JO6V0===="
									scriptHash: "OTD2D7UKHKNGRHTBBEQ963UR3ICGI5R94P7IN528RR4EJ1CGOCUG===="
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
										cmd:      "cue vet -c -d '#Pipeline' cue.dev/x/azurepipelines@latest pipeline.yml"
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
