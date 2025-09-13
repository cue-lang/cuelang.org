package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "sJT6YUX/hu/hv37FneNKpNTr5zQ+P0F0vRMy2H695Wo="
								"api-go":  "h5OulS4qexobegPBVInJGFojPMFMDhZyBbcvIrz6rrE="
							}
							code: {
								"openapi-comparison": "/XL2HlFFqlT37Wxk1MkhcmBfWCQMOg95nyOjbMqCUDc="
							}
							multi_step: {
								hash:       "UBU9NFMSUSQM349D9RV122JGEDQES2DIQ26507M99I017A907VD0===="
								scriptHash: "6L5IT0MDQHDV4HTDDJPNEC77FLQNURS5E7PM92IB8CPC5S2L6QQG===="
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
									cmd:      "go get cuelang.org/go@v0.15.0-alpha.1.0.20250913190050-8572198e1792"
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
