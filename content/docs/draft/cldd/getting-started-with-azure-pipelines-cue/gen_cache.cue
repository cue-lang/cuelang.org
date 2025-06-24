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
									"1":  "1Xm3ByjGbJSh0JWBiwkDcKHE6lnh3AF9FAMtSb12MSs="
									yaml: "w8GayoBi5nalNQwgsG/Ba4x+Ver7Av7RxHgw17YWG/4="
								}
								multi_step: {
									hash:       "EHBP8CE9LQL2KNRKEVDPH0SSKR9TJKU98HN6VU2OIOAM23N8UP8G===="
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
