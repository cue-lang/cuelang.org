package site
{
	content: {
		docs: {
			howto: {
				"go-api-basics": {
					page: {
						cache: {
							upload: {
								"initial cue code": "d+gCiJMNGcXQM9btpQoRyB5PBCM9G90Md3E1yMp9DNk="
								"initial go code":  "dT4+NeSTqwt+M/+L4jMr9ZxCyGz8M4yuShiErciX6aQ="
							}
							multi_step: {
								"76ALNC7HA83HU97BM3T1QK3SA8I6079HLAR8016AQ8VP2UK27FI0====": [{
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
											cue version v0.8.0-alpha.5
											...

											"""
								}, {
									doc:      ""
									cmd:      "go version"
									exitCode: 0
									output: """
											go version go1.22.0 linux/amd64

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
									cmd:      "go get cuelang.org/go@v0.8.0-alpha.5"
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
											Instance module: company.com/example@v0
											Instance import path: company.com/example@v0:example

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
