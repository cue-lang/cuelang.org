package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "vvZI5nTaNH3TVnijV8LYRD/bftUhqKlr55FkKYmrZzY="
								"api-go":  "geiSJk13oQ0D4xGGbqFKPkp9O2rB75MR4D3mQhuVaPA="
							}
							code: {
								"openapi-comparison": "AZ2/41sHq0jZTyca0R8IzoFI7HAQ6P8fh0Zp/YJHOnQ="
							}
							multi_step: {
								hash:       "ARTRS0HETB1R9HPV2CL3ROQ7334O6U8JANUAQDC5QBU4INADMRQ0===="
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
