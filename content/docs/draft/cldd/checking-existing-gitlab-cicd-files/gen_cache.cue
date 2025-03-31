package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"checking-existing-gitlab-cicd-files": {
						page: {
							cache: {
								upload: {
									pipeline: "G49+JpwPkeg1XzPdVhy/6ZJI0cqwqXhLMXJAC3/HI4c="
								}
								multi_step: {
									hash:       "7C9GUG2TOGI18CQBDULVI9N07JGMI497OKDQL5IGDOABQCR4V320===="
									scriptHash: "5JR6Q6B84T6NEOH8V6I0GTKF6TEU6EKQ3A7V9APDLECJVCFLK3VG===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.2:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-alpha.2
												...

												"""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Pipeline' test.cue.works/x1/gitlab/gitlabci@latest pipeline.yml"
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
