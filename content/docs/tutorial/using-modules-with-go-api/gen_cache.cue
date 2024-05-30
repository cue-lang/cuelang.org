package site
{
	content: {
		docs: {
			tutorial: {
				"using-modules-with-go-api": {
					page: {
						cache: {
							upload: {
								"initial main.cue": "wmGXDLkaGQlm4/oKnvk0F+lLG4U2MtkkXpf3GF6DwU4="
								"initial go code":  "mYCzrWfdVwk9JsfCA+b2DMNYaSkfXgck8LBilYk+TSQ="
							}
							multi_step: {
								hash:       "HVKQRON2S06SA79HEI9KLJPI6D6UU81GAAH4VD4P9D2P0DRCFOD0===="
								scriptHash: "RL08SBD6V6JHO3Q4VGFIEMFD48DJ5B554BGA9FOCH50B0B5RB18G===="
								steps: [{
									doc:      ""
									cmd:      "export GOMODCACHE=/caches/gomodcache"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export GOCACHE=/caches/gobuild"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export PATH=/cues/v0.9.0-alpha.5.0.20240530095928-7ab80025ba4b:$PATH"
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
											cue version v0.9.0-alpha.5.0.20240530095928-7ab80025ba4b
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue mod init an.example/config@v0"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod tidy"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export"
									exitCode: 0
									output: """
											{
											    "config": {
											        "appName": "alpha",
											        "port": 80,
											        "features": {
											            "logging": true
											        }
											    }
											}

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go mod init an.example/config"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.9.0-alpha.5.0.20240530095928-7ab80025ba4b"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go mod tidy"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "go run ."
									exitCode: 0
									output: """
											{
											\tappName: "alpha"
											\tport:    80
											\tfeatures: {
											\t\tlogging: true
											\t}
											}

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
