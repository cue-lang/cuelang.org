package site
{
	content: {
		docs: {
			tutorial: {
				"loading-cue-go-api": {
					page: {
						cache: {
							upload: {
								"initial cue code": "k1qdeX01IrvYpWE5u+yR+zVux1ps45T8YdfG7fsq2m0="
								"initial go code":  "/YKxY2b8bp74jjRHfkSQetTR3QZnSoNCe3ziJI0KaVs="
							}
							multi_step: {
								"8RFERTS7TG37UNEBA7IK4KEHC3B2FFD2H4GG227AJD4HVMHN5T2G====": [{
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
											cue version v0.8.0
											...

											"""
								}, {
									doc:      ""
									cmd:      "go version"
									exitCode: 0
									output: """
											go version go1.22.1 linux/amd64

											"""
								}, {
									doc:      ""
									cmd:      "cue mod init company.com/example"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export ."
									exitCode: 0
									output: """
											{
											    "output": "Hello Joe",
											    "name": "Joe"
											}

											"""
								}, {
									doc:      ""
									cmd:      "go mod init company.com/example"
									exitCode: 0
									output: """
											go: creating new go.mod: module company.com/example
											go: to add module requirements and sums:
											\tgo mod tidy

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.9.0-alpha.1"
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
