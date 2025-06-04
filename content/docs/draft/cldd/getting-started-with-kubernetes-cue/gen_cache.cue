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
									"1":  "NwxMjSDRLn+uzUt+2vFmGLOiw1cTNQ8Oi+NNYZNexBc="
									yaml: "sYwve9yWXi5bs28ncJ/wkcHNK9meOAHZLBdKZi3vqSM="
								}
								multi_step: {
									hash:       "PQODDESNV7DFEM9U64DVRVRMTT43TR1LPCD2DR3SKC8BB1GTULTG===="
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
