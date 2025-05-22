package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "1plDoQO/g3NnbTA87McdiQVUoCAEUSnUM2lziw4P1wo="
								"api-go":  "Wf7b8smkQeeIs8EMc2GR7UTqiE8KovLo34fkjZvYjRY="
							}
							code: {
								"openapi-comparison": "L2pegwOLxFYAkR9ZR1rtuHE+G8+OECKWxcRSw0R2iyw="
							}
							multi_step: {
								hash:       "69D5FVVQC6VGAE00QVLQD97O4T89F512804R83S73KNFRFJJNR9G===="
								scriptHash: "0EHKBDEDVJF41QSAC4IDMQ05TODR5GIS372BH4HS9RVE19HJAQP0===="
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
									cmd:      "go get cuelang.org/go@v0.13.0"
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
