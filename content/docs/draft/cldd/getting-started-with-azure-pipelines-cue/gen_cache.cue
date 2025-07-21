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
									"1":  "XwRpZchw34w1x8MY5iTdI1o35X0+C41XBIGaiygYlN0="
									yaml: "lySI2wtUurTvxtIpLx6IQykFwrNDB4fL2o4p3mIx6+c="
								}
								multi_step: {
									hash:       "NTGNRMF8HKQ6FLIISMGRL738Q2S5Q8JM9J0T1UQ1QRR3QHK2UEA0===="
									scriptHash: "A5AGMPE491EDD5FQTVA6TJODRUDAJKJ8EONAC36VKQDQCU69UAF0===="
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
										cmd:      "cue export --outfile pipeline.yml -e pipelines.example"
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
