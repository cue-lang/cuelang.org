package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "9DpPe5vDbYkpScf31D+kYSaUsJAdW1XiuP1t6tG2kA0="
								"api-go":  "JcYaZhNCgRdHej93RcUcajXK3XRq1pFZC0RrVc2dMjQ="
							}
							code: {
								"openapi-comparison": "OQCyrJt+QAThU/EyyvR3E3wOkbIJGBg/T3cLLjrw+qs="
							}
							multi_step: {
								hash:       "LGMDHUP31FNU9PCTV2P1FM6NTVU9U025TKMDB9CQ1Q8GVVE44TG0===="
								scriptHash: "H79SLKSNL1LS4352A22MA115IEUQOC4F1VNRFMCVLEFSBTS26MBG===="
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
									cmd:      "go get cuelang.org/go@v0.9.0-rc.1.0.20240606084806-889da91cd963"
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
