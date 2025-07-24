package site
{
	content: {
		docs: {
			tutorial: {
				"using-modules-with-go-api": {
					page: {
						cache: {
							upload: {
								"initial main.cue": "6ldkfv/Hf6KDj0B4wGtZ1O4/+uMhXcHihwEBXXZyt2A="
								"initial go code":  "64TXPxrnsRTmsI0jKJzS6+5OivMSm+ThfmorJu72WYM="
							}
							multi_step: {
								hash:       "AB6B4U36NC1MC9D7LG9T7EAMPBSQ1O7B4CJCIKITLE2RTRN38EC0===="
								scriptHash: "6QJPVAIA028N0TUFUT5FKU4QBIQGRL7KDUOO3AERFSF2HL4L0DS0===="
								steps: [{
									doc:      "# Set up caches to speed up page rebuilds."
									cmd:      "export GOMODCACHE=/caches/gomodcache"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export GOCACHE=/caches/gobuild"
									exitCode: 0
									output:   ""
								}, {
									doc:      "# Central Registry auth."
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
											cue version v0.14.0-rc.1.0.20250724155554-6d101321cb41
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
									cmd:      "go get cuelang.org/go@v0.14.0-rc.1.0.20250724155554-6d101321cb41"
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
								}, {
									doc:      ""
									cmd:      "go vet ./..."
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.6.0 ./..."
									exitCode: 0
									output: """
											...

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
