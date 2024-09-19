package site
{
	content: {
		docs: {
			tutorial: {
				"using-modules-with-go-api": {
					page: {
						cache: {
							upload: {
								"initial main.cue": "Af1mUHKlq/xAeYwbsGaL7Y28N96smL3ukD0s/n+czU4="
								"initial go code":  "q+7YnXM6S1v/tb84KT3qzh3ly9pUn+BIgm4NmA5eQQA="
							}
							multi_step: {
								hash:       "R26OC7I16BABDI09PVBABP9KNKG43QA32B4O0EF6P4VRQDLSERJG===="
								scriptHash: "RV3BVUEQ1B2NCBHK7IIKK7RLJD5GOF26D4VQU4FS52I39JMLCN5G===="
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
											cue version v0.10.0
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
									cmd:      "go get cuelang.org/go@v0.10.0"
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
