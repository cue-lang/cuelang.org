package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "Afa4s6nNiiEIR/OEKnPudOEIbgX+4RPi9yW0ZGE+xi4="
								"api-go":  "GwC5yLJin4WPBCCMHQvuYkxgM1YepTBSWcIXuE5mBJE="
							}
							code: {
								"openapi-comparison": "hrYiWSYpP4NiN0bEAMwOkJwlNoLA3Rww/DYKJ2l5Vtc="
							}
							multi_step: {
								hash:       "46IR1524AUBJ1I0FAD4F7LQAKTQ2B7QSHNIEN27UHGUA8S7T4GV0===="
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
