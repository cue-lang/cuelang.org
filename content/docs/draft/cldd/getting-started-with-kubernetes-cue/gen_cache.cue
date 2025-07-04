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
									"1":  "LxLQy+5sAioMEDuWFbDyN5XWrdr4n507F6UoFw1cGbU="
									yaml: "ZMx0WG1N16o/voFIWwSBz/4steCVROjK1D7dtAj5BoQ="
								}
								multi_step: {
									hash:       "G5E1HAM77V3JL4O3B0FC53LU4HHB1TEEKGQK64I3KPGMK5RVPTGG===="
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
