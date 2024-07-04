package site
{
	content: {
		docs: {
			tutorial: {
				"using-modules-with-go-api": {
					page: {
						cache: {
							upload: {
								"initial main.cue": "xEojSqAc1l7RzeyZ4ZE9wUs+zBrJpHwj6AR1UY73KI0="
								"initial go code":  "NC9FthUlfNyeH4BffHBwLK/BPKc56GdIduXAfIZv/ZI="
							}
							multi_step: {
								hash:       "F885Q10K4GBU5TNTNH4JDC2G1G0TUSF8PA1AK31I5CN85K67GK3G===="
								scriptHash: "ITJ5T46QIRNNJM96COON848L0TG149NLOK518NKCGLFERIDLJ0G0===="
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
									cmd:      "export PATH=/cues/v0.10.0-alpha.1:$PATH"
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
											cue version v0.10.0-alpha.1
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
									cmd:      "go get cuelang.org/go@v0.10.0-alpha.1"
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
