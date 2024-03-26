package site
{
	content: {
		docs: {
			tutorial: {
				"publishing-modules-to-the-central-registry": {
					page: {
						cache: {
							multi_step: {
								"S1G1SLCA5IDN8RDFKE2F9RQNICRPTVVDECRCNLL5JM5H639F255G====": [{
									doc:      ""
									cmd:      "export PATH=\"/cues/prerelease:$PATH\""
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mkdir -p $HOME/.config/cue"
									exitCode: 0
									output:   ""
								}, {
									doc: ""
									cmd: """
											cat <<EOD >$HOME/.config/cue/logins.json
											{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_COLLABORATOR_RW}","token_type":"Bearer"}}}
											EOD
											"""
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "echo github.com/my/example"
									exitCode: 0
									output: """
											github.com/my/example

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
