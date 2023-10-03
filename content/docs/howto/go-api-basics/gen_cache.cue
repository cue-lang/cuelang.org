package site
{
	content: {
		docs: {
			howto: {
				"go-api-basics": {
					page: {
						cache: {
							upload: {
								"initial cue code": "k1qdeX01IrvYpWE5u+yR+zVux1ps45T8YdfG7fsq2m0="
								"initial go code":  "G8zhx5FJFZVDJQcEclpCGVNNFmWzZC7I2EqsQpE+u50="
							}
							multi_step: {
								"TPTNMN6N8STDUTR3V008NUUU369IC9O7IG1NPQTKEOJAMTA13K80====": [{
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
									cmd:      "go mod init company.com/example"
									exitCode: 0
									output: """
											go: creating new go.mod: module company.com/example
											go: to add module requirements and sums:
											\tgo mod tidy

											"""
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
											Number of instances: 1
											Instance module: company.com/example
											Instance import path: company.com/example

											Source files:
											some.cue with 3 declarations

											Field string: Hello Joe

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
