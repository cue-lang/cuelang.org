package site
{
	content: {
		docs: {
			howto: {
				"go-api-basics": {
					page: {
						cache: {
							upload: {
								"initial cue code": "iYYb99guDoVl1sjkjaL9YHJdsHAuxXZ/p2iEZoS3B6w="
								"initial go code":  "xj8gXPpeqv2hZAl8z+2NyGdX2exeeSZcd4VvntiIxco="
							}
							multi_step: {
								"FOH54F6O5PU6U0JKEES7C2FQONV9SI9MLEUJU6Q3IEJ4S8JHFTF0====": [{
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
											cue version v0.8.0-alpha.1
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
									doc:      "#ellipsis 1"
									cmd:      "go get cuelang.org/go@v0.8.0-alpha.1"
									exitCode: 0
									output: """
											go: added cuelang.org/go v0.8.0-alpha.1
											...

											"""
								}, {
									doc:      "#ellipsis 1"
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
											cannot find package "./example"

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
