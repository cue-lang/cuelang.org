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
									"1":  "UnANSRYuEWnP4/nef0a7sEmYg+MtMzKtePhSLj2pVjQ="
									yaml: "X+EJw7tmR/CSvUMbS5Aek+WT6T9ZcedI1MQexDVX8hI="
								}
								multi_step: {
									hash:       "2KVENBQ652OFV9AQC4RGC4JJRSQKFB4U1LNCHM73M6JOKI6UF3PG===="
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
