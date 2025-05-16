package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "cJc9KUqKrjx83K5uje95R8/V8DaE8DaV+3mhCZrWfp8="
								"api-go":  "dgf0SXv8t8AnXtz6QYy8Xl1S5GxOesE9x/eeZlov61k="
							}
							code: {
								"openapi-comparison": "+nQEFS3Kkg0avoctqAnHFp2n7pP+5/fHHxXSd0kmvLE="
							}
							multi_step: {
								hash:       "SH7IGCT5J0OHOPK22PBCO4BQU10QM67R2VG3FNBNOG1L3A8QAPQG===="
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
