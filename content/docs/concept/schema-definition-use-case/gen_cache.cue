package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "bPq8/n401ZKXbYsp31xV7E9pyTllkVVOtTPh1TDwGWI="
								"api-go":  "ZOYH0vtI8ZXIIxNqNM1l7j9rTn0XienIKp6HNLCCEQ4="
							}
							code: {
								"openapi-comparison": "1H7KgtYbT0a5s7o4OVV+hy7IL+tRqTQA0ss/qT+IDa4="
							}
							multi_step: {
								hash:       "48NH51L9E2BNOPNUQ1CK2GOST0S2IKB86650B26QSBF2G8873S4G===="
								scriptHash: "CN8889UQR2KON7JLCLHPEO7K1L09VHGTPJJUQ3JF5C5HC6R1EON0===="
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
									cmd:      "go get cuelang.org/go@v0.12.1"
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
