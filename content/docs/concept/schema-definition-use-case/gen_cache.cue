package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "hClN+DZ6AMvN5522wBOgBy3fnJ3mVfDJxkMZcDApvQ4="
								"api-go":  "tdNB93AZiN24ALYiP//UB6ffPV7ltf0rqosDDSs2mKU="
							}
							code: {
								"openapi-comparison": "4zk9KIe9f23wP9sYDDqZNyNWMgSMjw3JPd2mD0a2NWE="
							}
							multi_step: {
								hash:       "G57SNCP0GV59B6O7LU7T23P46G9DG7MMNC9BA79LHBK9BEUQKMH0===="
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
