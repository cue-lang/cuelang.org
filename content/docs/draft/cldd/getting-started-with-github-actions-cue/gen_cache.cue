package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-github-actions-cue": {
						page: {
							cache: {
								upload: {
									"1": "S1XE2enttD6u1MqckqIOdeX5aUSjad7qURjhZU+gCXY="
								}
								multi_step: {
									hash:       "5A8NKQ8D6E04KAAJ3FN7OPOS5V3DV3UPN9UJIFTOTHGNL1Q7PE50===="
									scriptHash: "LDUF2BB040TG6KC891JEB4FIA4QDEPJ9E1UH9J71V6OPT0B3I7IG===="
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
										cmd:      "cue mod init"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue mod tidy"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet .:gha"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export .:gha --outfile workflow.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat workflow.yml"
										exitCode: 0
										output: """
												jobs:
												  check-bats-version:
												    runs-on: ubuntu-latest
												    steps:
												      - uses: actions/checkout@v4
												      - uses: actions/setup-node@v4
												        with:
												          node-version: "20"
												      - run: npm install -g bats
												      - run: bats -v
												name: learn-github-actions
												run-name: ${{ github.actor }} is learning GitHub Actions
												"on":
												  - push

												"""
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
