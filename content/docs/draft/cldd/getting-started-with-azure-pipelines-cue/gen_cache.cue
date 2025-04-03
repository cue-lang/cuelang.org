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
									"1":  "VMkknRUet6j0i3EUcpsg2zkMFV2PzqtimsCndUoPdU4="
									yaml: "xOWHCxN4ZEsHUV65VhFm0fyrDg8Mi7HUH++eYuTV9PE="
								}
								multi_step: {
									hash:       "LCKAKJ71RA0G2P2PPCJQ7QHE99FEMKVH4NGEH4QUGG3C0F72RMA0===="
									scriptHash: "JHDS2DP5UJNB9BAERAC4B40PUP9KLF1JTEVMMDB58HN5E0MVEL10===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.3:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-alpha.3
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
