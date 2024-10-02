package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "6ZG7ymXk6SWgE5mvpagi68dNLpHtFOjq7DaUN9usbV0="
								"api-go":  "lLXBFyE4rx4T3kd6YxGo2Z6lRZWMErgM34dxnl3KCRU="
							}
							code: {
								"openapi-comparison": "1KDNm9zJcBUhNwg+BLjVsHU7fCSoDmX60N8syO/0x5U="
							}
							multi_step: {
								hash:       "6JG8TL9RMP54950VMEI2L2U53D4GJ7QSTEUL9RTAI834ICNAPQA0===="
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
