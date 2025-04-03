package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-kubernetes-cue": {
						page: {
							cache: {
								upload: {
									"1":  "rq8fsh3n6wZut5cbXWT2aYdlNbG9kPJbP7wj4pLhv1k="
									yaml: "RREGWdZJfTMfoi1FFGPoBy65mNBT3ZMyzMrkdKUaiP4="
								}
								multi_step: {
									hash:       "8JAGVQVIMPTA9TVQDF0DNCQEPPGB5R8VD5O20TN17NHOONSTKCE0===="
									scriptHash: "33FB7CRJDNN197QC4IV8P7K4HIEVNU8UD6DLH85GS0MSE9JRRAC0===="
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
										doc:      "# TODO(jm): revert to latest when it has evalv3 as default."
										cmd:      "export PATH=/cues/v0.13.0-alpha.3:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-alpha.3
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
										cmd:      "cue export --outfile manifest.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "mv manifest.yml .manifest.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff manifest.yml .manifest.yml"
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
