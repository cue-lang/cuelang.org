package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "+GaJpxipM2hK+pKlE2edRQRlJN1PHnpE0Ve6GOLzmjU="
								"api-go":  "iigQ4D477xt0pafaY9LeGi3OK6Jq5hruXk+J4UaMlMk="
							}
							code: {
								"openapi-comparison": "EaCQWDFzerIdc5c+jQXCLEDWetfq1blK9clRD8Mqaps="
							}
							multi_step: {
								hash:       "5I3RHQBAGF8K8D8IGC5LUS2GLHIPFALU409JQA76B147SF05S840===="
								scriptHash: "RKDLIL9NNLLCVPE6V4CHB5DMBUCL2NTEKFFN6KDGF08VAA1MQ7QG===="
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
									cmd:      "go get cuelang.org/go@v0.12.0-0.dev.0.20241209170035-d298a53db8bc"
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
