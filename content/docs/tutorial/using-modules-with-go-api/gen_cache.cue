package site
{
	content: {
		docs: {
			tutorial: {
				"using-modules-with-go-api": {
					page: {
						cache: {
							upload: {
								"initial main.cue": "A3009cmL6BJU9S2cEwHy00uL1AypdiGM6JbnJDvQp74="
								"initial go code":  "k8AlrPVgjc57tjq6aewgLQWxyXHoJhXKjEBWlTzsLCM="
							}
							multi_step: {
								hash:       "JVKOMKM9K138BN45TQDGF07JO91P1TNO5PICCQ9LA78AHLPR95BG===="
								scriptHash: "G4DJSEAB23HPC75PDHGKD6L2QQT1FHFS9EPKP6CFP01QKQ9CR94G===="
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
											cue version v0.13.2
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
									cmd:      "go get cuelang.org/go@v0.13.2"
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
