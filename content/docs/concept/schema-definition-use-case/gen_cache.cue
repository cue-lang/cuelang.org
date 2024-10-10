package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "T3LuvCmxlII7pdjjny+EmoEqIXn/qgAd/p/yiibmMuw="
								"api-go":  "NeryFEgGN+Ke5ZR4uQdHw/KW5cbFDSFRAOIIrLEPqls="
							}
							code: {
								"openapi-comparison": "TP2Jg7/rBlkvjryId3Vgy7jbjFTXF30fIWtHGJ36NKc="
							}
							multi_step: {
								hash:       "S8LSOBA8K13NIQ3163PFTI1TBQPKAJ0BD4T259H9KB7RQILAF7V0===="
								scriptHash: "U38A58ASVNQQEQHLJEANL2SM0VCR9IFBOETMTRUP5927JK68ERJG===="
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
									cmd:      "go get cuelang.org/go@v0.11.0-alpha.3.0.20241010142549-44cceca80690"
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
