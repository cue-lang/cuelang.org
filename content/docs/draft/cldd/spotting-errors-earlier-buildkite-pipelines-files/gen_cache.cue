package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"spotting-errors-earlier-buildkite-pipelines-files": {
						page: {
							cache: {
								upload: {
									broken: "iatNgZC12qa3ueiaLNUIqIGoRm+GYNOLcLbXZgsbaNk="
									fixed:  "JcppkIHgyz4g0RRvIJf+QSqDX2Uc1XMxeY5x+XUog0Q="
								}
								multi_step: {
									hash:       "02JFIOQPRJG8NN0L3R173HBSVLL6HUMBG5JGTK0USMJC9TGKFEP0===="
									scriptHash: "4MMBJL47AND5HU2SNB24T6TJVJ0G9C3M0FFN9N925V50EJ157TU0===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.3:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Pipeline' cue.dev/x/buildkite@latest pipeline.yml"
										exitCode: 1
										output: """
												steps: field is required but not present:
												    .cache/cue/mod/extract/cue.dev/x/buildkite@v0.0.0/schema.cue:16:2

												"""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Pipeline' cue.dev/x/buildkite@latest pipeline.yml"
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
