package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "HmsY1dA50Du30/zpnAIluHRvG61It7f9Mtigs9WFI9s="
								"api-go":  "u9rH/nmhn4giJhN5/sWqaxsEDl8DAdOSZ3Hqj5hnrAM="
							}
							code: {
								"openapi-comparison": "wigfGVJtDDcWfa191IqYHuSrgmb5rEEC61gvu4tf/O0="
							}
							multi_step: {
								hash:       "DACSSQUIKDMS5L7KM1MUHN2CUSK35V6DOJFN5690QO74L51IAGKG===="
								scriptHash: "O00J0RVD1JAIINLDPC8SNAAHG2PQ2QME48ETED5JB1OAMHP74220===="
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
									cmd:      "go get cuelang.org/go@v0.9.0-rc.1.0.20240605220750-a2292241985b"
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
