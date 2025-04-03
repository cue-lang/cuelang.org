package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"spotting-errors-earlier-gitlab-cicd-files": {
						page: {
							cache: {
								upload: {
									broken: "gadVQJMtXqtKUQM+iVo8e3pRvcrBIp9wfJCZGtZfEQQ="
									fixed:  "tVGKpJxZcy0yNOG/ECQ5+uFMbwcE9isRSj6yXhV5fjg="
								}
								multi_step: {
									hash:       "T5U78IFKO129MT7J33MJ0L1JGKML85TN51QV0ET6ESDE8ESCVUH0===="
									scriptHash: "TNUK5E4JKUL8UAD7LJI2B2E5VLI9GT5P54VUJKJRJNUVGCI2SLF0===="
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
										cmd:      "cue vet -c -d '#Pipeline' cue.dev/x/gitlab/gitlabci@latest pipeline.yml"
										exitCode: 1
										output: """
												"create-pages".scripts: field not allowed:
												    .cache/cue/mod/extract/cue.dev/x/gitlab@v0.0.0/gitlabci/schema.cue:295:17
												    ./pipeline.yml:7:3

												"""
									}, {
										doc:      ""
										cmd:      "cue vet -c -d '#Pipeline' cue.dev/x/gitlab/gitlabci@latest pipeline.yml"
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
