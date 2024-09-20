package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "1P+TDhWMaKIswApmAPG9onxbmKv2OV/l3l7KRb/H6N0="
								"api-go":  "fD8d4F6JT0X6kbIvkKRjk/Za1T1hIaDZKBzA6HIR1gc="
							}
							code: {
								"openapi-comparison": "1qp/1JhoGtSeWT7R6mhiBRKIIEYA3IGCGzxrNANcgN4="
							}
							multi_step: {
								hash:       "5M64IJB9I1R7MC49BLGSUHFL300LLECCNOAJALLN01LD6PUIA730===="
								scriptHash: "JMSVRRQ6P7ES1AAL0R2TU9L5SC3R20GQ01U30OJLDQ72L80AJ9HG===="
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
									cmd:      "go get cuelang.org/go@v0.10.0"
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
								}]
							}
						}
					}
				}
			}
		}
	}
}
