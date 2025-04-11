package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "L1InYCl7u760pqwknvHYJ5oj7JpjKysFO/76vPWxIgk="
								"api-go":  "cO6zRhGLAgNcyFqSAWQbTJVyfAmh253aPuHGT2WDZXE="
							}
							code: {
								"openapi-comparison": "BmDmhESUoMxKT8LFwMSMYlDyfSmNptbplp8msfN3tPk="
							}
							multi_step: {
								hash:       "20DF603JS9O8I44MNV1BMG6VQD83UULSQIJENTKIURNJD7K6FCRG===="
								scriptHash: "1ITMQ9OA4769T2652RNAQ30M4N9FP6BL3CKQVF1LIP3JI519R4OG===="
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
									cmd:      "go get cuelang.org/go@v0.13.0-alpha.3.0.20250411164907-08c3542c9d96"
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
