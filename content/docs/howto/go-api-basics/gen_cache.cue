package site
{
	content: {
		docs: {
			howto: {
				"go-api-basics": {
					page: {
						cache: {
							upload: {
								"initial cue code": "/tnOcut9ORj7YHz//PfxuNt8MS7sOoz3w7wYJVDq3oM="
								"initial go code":  "uPGWyRjmM7K9iWNJYRoHYzGiahtgstLIyF+6K+VPHIE="
							}
							multi_step: {
								"1OJLTHB2R5ORH5HT4PL6J3ED6248OIV76SELSFBF4MV3412DDNL0====": [{
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
