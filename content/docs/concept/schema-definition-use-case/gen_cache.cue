package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "An4OSCBPmmhN/KNzUJJvvIYy9TlaAoj0iX3xgSgX43Y="
								"api-go":  "6uM3UuXrWYGDiw8abI8QfN62c5AoKFFrMxOEVjp1MPw="
							}
							code: {
								"openapi-comparison": "iHMxeAwTKoH80WxjpR/P+RRQQMcB9v+uL0Zmp1kr5a0="
							}
							multi_step: {
								hash:       "GAQ1PTV9MEIROQSTBEQ3N24AT5VDLJHIE7PU31EO9GQPVFP5TON0===="
								scriptHash: "930E34ASDM9QC661HR6FH1BI16LN4AAK5CM3J5IKHQ8T1310SHAG===="
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
									cmd:      "export STATICCHECK_CACHE=/caches/staticcheck"
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
									cmd:      "go get cuelang.org/go@v0.15.4"
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
									cmd:      "staticcheck ./..."
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
