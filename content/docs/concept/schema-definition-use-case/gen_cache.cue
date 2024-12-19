package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "GAxeJc2+sljUGcSv32aSD6y8iELv3hiE5m9aiDwTTcI="
								"api-go":  "7nXDLHAm3HVB9vPvXmYVfcu9264y/LihAF+DpWdVsgE="
							}
							code: {
								"openapi-comparison": "H6jy9ljT1e9vB8qbmX/46CPI+GU6lWtCOSCcBukCv68="
							}
							multi_step: {
								hash:       "KKI7GS7KQOTNDR4MV7VK02S0J5N8N7V0DDKSBIH8OIHB0MO13ILG===="
								scriptHash: "82IAM0PLJIAVAD59F47LDCK85JBLHABP838BRNMQJB3EGPMRS7IG===="
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
									cmd:      "go mod init cue.example"
									exitCode: 0
									output: """
											go: creating new go.mod: module cue.example
											go: to add module requirements and sums:
											\tgo mod tidy

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.12.0-alpha.1"
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
											V2 is backwards compatible with V1: true
											V3 is backwards compatible with V2: false

											"""
								}, {
									doc:      ""
									cmd:      "go vet ./..."
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.5.1 ./..."
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
