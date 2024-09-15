package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "3GKOcGRFCBd5SnjapYV8F8LV1d2geo0D/TGrhiIrtHQ="
								"api-go":  "LHYry4Gk8LjuwtUBUlPgvEjPE5ZwjW55FnCV2jL5MoA="
							}
							code: {
								"openapi-comparison": "uE/YDTpCL85Ecy/Qth0Hvf7W2c+GGp1Y28XH8+rOEEU="
							}
							multi_step: {
								hash:       "MSMHMSFPLUQC722PSJ27ALPNGSCUU7TVB1N6RKU67NDS7UHOV2CG===="
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
