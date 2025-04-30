package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"spotting-errors-earlier-goreleaser-files": {
						page: {
							cache: {
								upload: {
									broken: "0vhZ7J8g4/1m+XISVuvmJ+vB5iZV5HEG8f5B7u0hIHc="
									fixed:  "rA+aIBWLLwZQJxfWDw/QzkNgtmrfAuku8HJESCkfdDQ="
								}
								multi_step: {
									hash:       "JCC324V7SGKL0J0R2KVA6AONGEA2FBGQPAHDBMQ8G4NQPEDSS1V0===="
									scriptHash: "TGSL7ONIT2M8J5BR686DC971MI8BNN6BVETQA90HSH20BJ5PUQDG===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.4.0.20250430133040-3ba376f34cb6:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Project' cue.dev/x/goreleaser@latest .goreleaser.yml"
										exitCode: 1
										output: """
												docker: field not allowed:
												    .goreleaser.yml:7:1

												"""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Project' cue.dev/x/goreleaser@latest .goreleaser.yml"
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
