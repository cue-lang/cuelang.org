package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "Gf3DkiCZ2Iqevi7+BFSEV7R20zIyiGdx8n8Qytnkszc="
								"api-go":  "tRYED2jg2YsOQ4DSTPKQdP9IupakQBYtiroEuLdwBko="
							}
							code: {
								"openapi-comparison": "ME5mFpPn5Z890PxLH89FU6hfa9Go4p+zv4/ZqEuXpRM="
							}
							multi_step: {
								hash:       "403MLJ3I3LA0MC5AIU25DC8N2MM0371ODM7L8FQI1M2OV4F03RJG===="
								scriptHash: "SA9S7DHM2OHJBGG0KG57D19NKVJ6C8CATDRICAACFSVP9UL99KAG===="
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
									cmd:      "go get cuelang.org/go@v0.12.0"
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
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.5.1 ./..."
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
