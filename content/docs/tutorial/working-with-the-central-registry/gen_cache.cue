package site
{
	content: {
		docs: {
			tutorial: {
				"working-with-the-central-registry": {
					page: {
						cache: {
							upload: {
								"initial config.cue": "Kbg2SFPlarR5sjf+lpwVPbTpcChilNyKm5TzpAhRmGo="
							}
							multi_step: {
								hash:       "QLTRR6NRG7PIMH9R7BQ61A16D0IPO978INF8I3068N4VL3OMA7K0===="
								scriptHash: "309JG38ICM25CV4OUDBDNSEHGI2PDVAS73RPFA0JKVHBTJHU8CH0===="
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
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.2
											...

											"""
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
											\tversion: "v0.9.2"
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
