package site
{
	content: {
		docs: {
			tutorial: {
				"loading-cue-go-api": {
					page: {
						cache: {
							upload: {
								"initial cue code": "9xWLU47eVv7IXmtUMWS067/ZsrdQe9wKh8Y7Rk1ylCA="
								"initial go code":  "TsLrrQ3wMLlbGhEAuDsdi9eLIaY4lekSzssNKRoXZAE="
							}
							multi_step: {
								hash:       "SLAB3TLO2E3LAKSNOB9NGGDTMFGHSDFCJBI34KVHK6MRKGMU6HC0===="
								scriptHash: "PF8H3Q19KCCFNU0BN79DT8OVDHPPDCAQ89NIGMFF0HIRI652V1PG===="
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
											cue version v0.9.0-rc.1
											...

											"""
								}, {
									doc:      ""
									cmd:      "go version"
									exitCode: 0
									output: """
											go version go1.22.3 linux/amd64

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
									cmd:      "go get cuelang.org/go@v0.8.2"
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
