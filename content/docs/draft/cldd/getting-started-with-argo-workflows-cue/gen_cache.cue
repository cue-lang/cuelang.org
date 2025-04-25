package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-argo-workflows-cue": {
						page: {
							cache: {
								upload: {
									"1":  "SKWlxmPdzrBp0jIgGaPPnMu6mW4SuE0fSABWfl0Qq6I="
									yaml: "5GlXVkZjU/7240qJos1fYQzEXIb30rHi6aKibktBbQs="
								}
								multi_step: {
									hash:       "7NRPCTI15Q10N67CCULQV3PEIMCRPTR4NDH1B5O13FOE38ER5ARG===="
									scriptHash: "87BEEMBFT49GIRKHAE0OGS02GSJLFKPOT25OJ6UB8TE11T4P55DG===="
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
										cmd:      "export PATH=/cues/v0.13.0-alpha.4:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-alpha.4
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
										cmd:      "cue export --outfile workflow.yml -e workflows.example"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "mv workflow.yml{,.got}"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff -u workflow.yml{,.got}"
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
