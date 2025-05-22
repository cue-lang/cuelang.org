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
									hash:       "8PDRFVVT7N8315OSIAV3SJ45DGDI7KGS1MSJ9K2TUVD2G5HB9QA0===="
									scriptHash: "J44BPS5TL0523VUE6D2F3BR6LS7M5SGJSJIFUCKUD0VC947KFDHG===="
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
										cmd:      "export PATH=/cues/v0.13.0:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0
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
