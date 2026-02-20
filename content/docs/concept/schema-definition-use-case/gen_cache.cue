package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "CCjkIsLIs2wnYG6euRT1Ig6GH3611MoIC7AxqykvUbU="
								"api-go":  "bMjnQuqb5UpPb9lLaSaKC65DZ4uySlmb6MY7ryJyhrU="
							}
							code: {
								"openapi-comparison": "OxJO8RcDpsPTE4KAZ2WuDVQqq43R9Q2L8xl26BLnaDM="
							}
							multi_step: {
								hash:       "SIM3FPJM3V2P9RC7S089VVVV6JN5KQEJ0ICDS7KNKEECDQIP4VMG===="
								scriptHash: "3U6BDARA33PHR46E6GUMIBVHOGGKFCBRRVVGGKS01J9CVTHRE4S0===="
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
									cmd:      "go get cuelang.org/go@v0.16.0-alpha.2.0.20260220153551-3dfa50a46189"
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
