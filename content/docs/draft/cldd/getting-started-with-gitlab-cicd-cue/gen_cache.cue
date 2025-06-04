package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-gitlab-cicd-cue": {
						page: {
							cache: {
								upload: {
									"1":  "XDS2bd4Wvz4/s+gzMfaj+KU04aK8qVe970BsmgZLyTM="
									yaml: "6OHQ43INLkDdv4RaeGPBlzhwfUfFeo4eG4tP6k+eDrQ="
								}
								multi_step: {
									hash:       "K5MGMEMBIU083E1P2HDKIUF3QLQ191C2NN5C2AS91CNTDDO92A3G===="
									scriptHash: "NGJIRA756GBUHVLBRS53HPJHO51LG0GV9LC5RPUJ7NDQI02PCKIG===="
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
										cmd:      "cue export --outfile .gitlab-ci.yml -e pipelines.example"
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
