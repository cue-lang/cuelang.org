package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-goreleaser-cue": {
						page: {
							cache: {
								upload: {
									"1":  "96nfwC8iGXQfQFcFaT8fqigDSe7uBC6D9zGZueBmGYE="
									yaml: "lBsJO22Oa9LFK6uuAXSPIJh0ul25q2QMWT4dFuuO3C8="
								}
								multi_step: {
									hash:       "23C71J7B8KNQE6HSB1TITHEBFPIOJ154GN668NI2PUH164CU6T1G===="
									scriptHash: "752M39L7M4B83BK8JH5T8UR8AUB62GS6OJQVMSV3D4RG2UF2PPKG===="
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
										cmd:      "cue export --outfile .goreleaser.yaml -e files.example"
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
