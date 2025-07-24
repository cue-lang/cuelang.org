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
									"1":  "2FXK1stWBpTnaLC1SrsrvmmkhR8s9SYfOQlU0dKp02o="
									yaml: "ZVZg1aG3mzoLYXMbwrccQNT6R/9jfMGhBAuFLcVeHdU="
								}
								multi_step: {
									hash:       "8E1JCR30AEHCIF2DMB89MHQNF19G8DGP07NBS8UK8LUEM8GSFRVG===="
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
