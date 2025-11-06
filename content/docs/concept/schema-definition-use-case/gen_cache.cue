package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "PZbsTQt0e5tBDcP72fO1q7TvDpLr5UL6b5xTbq40lbc="
								"api-go":  "0OhOMeo8Co6YTxCv2MVt8gwXxyKxwUJhCnTLEqjDq/w="
							}
							code: {
								"openapi-comparison": "OCZuIlDQPMEdoCZAYBdHcYqOAoTSrcmnmGBj4T481qI="
							}
							multi_step: {
								hash:       "9G8P5FF6CGC8O0FU2A7QGJ0NNMLI3PA1KQ4FST2649ERR8B755HG===="
								scriptHash: "4B58P3LTI5Q1BPK2QGK7QH46P6HUTU9JFK8D9NFLVNIK954D3ATG===="
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
									cmd:      "go get cuelang.org/go@v0.15.0"
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
