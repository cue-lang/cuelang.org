package site
{
	content: {
		docs: {
			tutorial: {
				"working-with-the-central-registry": {
					page: {
						cache: {
							upload: {
								"initial config.cue": "GNvJBYs9l4WRJIHysPAgRM8av1nDpjuCERUlf9H2r3M="
							}
							multi_step: {
								hash:       "AC3ADQU9N4J3DAS76JG9Q64EGPAKHOU19LCBN6MKACKOC4D8GQ5G===="
								scriptHash: "GJ54NFDKNIU9S4SES5TA4K59P6HGVANA0UVCIEM5TFOR2ORO15RG===="
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
									cmd:      "cue mod init glacial-tech.example/frostyapp@v0"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod tidy"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat cue.mod/module.cue"
									exitCode: 0
									output: """
											module: "glacial-tech.example/frostyapp@v0"
											language: {
											\tversion: "v0.11.0"
											}
											deps: {
											\t"github.com/cue-labs/examples/frostyconfig@v0": {
											\t\tv: "v0.0.1"
											\t}
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue export --out yaml"
									exitCode: 0
									output: """
											config:
											  appName: alpha
											  port: 80
											  features:
											    logging: true

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
