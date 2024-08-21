package site
{
	content: {
		docs: {
			tutorial: {
				"loading-cue-go-api": {
					page: {
						cache: {
							upload: {
								"initial cue code": "/QD75jRVFyauGqLv+ydQLEtcbQ9gQAOHTjOXzwkYh2c="
								"initial go code":  "I88XWt1ew+VFphr69+c39ySottcRfGggLFhGYELn3ek="
							}
							multi_step: {
								hash:       "P1HU9KF30LC6OTK35LO8T45SQV1C3EJ5AR1HG3T9QJSGAC1UC08G===="
								scriptHash: "AI6AOAQ25OSDUJB573NDQVA2E9U17G0L0J6BDN6JIMOFPAU1REVG===="
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
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.0
											...

											"""
								}, {
									doc:      ""
									cmd:      "go version"
									exitCode: 0
									output: """
											go version go1.23.0 linux/amd64

											"""
								}, {
									doc:      ""
									cmd:      "cue mod init company.example/configuration"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export"
									exitCode: 0
									output: """
											{
											    "output": "Hello Joe",
											    "name": "Joe"
											}

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go mod init company.example/configuration"
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
											"Hello Joe"

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
