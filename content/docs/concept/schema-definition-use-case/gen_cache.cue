package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "qnr+3E12eFxa326o9F6axnI3Wu2Ib8O4woAvPaUYru4="
								"api-go":  "HVxcwP60fBhQi3/EeahXbLcTVTcVOc7nKuVB6WtXl+U="
							}
							code: {
								"openapi-comparison": "1fzY3yPSIpatWphPZb2Ey/6dQvAhAI9NiqWYnsJS/x4="
							}
							multi_step: {
								hash:       "CIQ26G0EPTHORA2AGH11MFKCRPSOSO1U4BK8EA6CENP71JK7MET0===="
								scriptHash: "RALGIU94MV4TIGBV0DQ692BVAMO6555L5JHSV766DBJRH3SNHG40===="
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
									cmd:      "go get cuelang.org/go@v0.14.1"
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
