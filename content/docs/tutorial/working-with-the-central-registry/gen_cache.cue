package site
{
	content: {
		docs: {
			tutorial: {
				"working-with-the-central-registry": {
					page: {
						cache: {
							upload: {
								"initial config.cue": "BQyO09f6BvvHW/41hfDFbHogUgAy2ogKuTGPOvRAx6Q="
							}
							multi_step: {
								hash:       "IFNO1FH9C9R7AUPGBAUDQ332H69KL0HLUIGRGB4INTB6IKRIVD10===="
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
											\tversion: "v0.14.1"
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
