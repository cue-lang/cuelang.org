package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "+HrZPLijNu7ofMAiD2c0u0ZZBpzkk4AMN+SslUMVsbk="
								"api-go":  "aPIBeIIqdE0AofB6iJifj8wzBPtgMP6pPCEKosHQj+M="
							}
							code: {
								"openapi-comparison": "caKHhUVGI+6EU3YvQItdDwln06JMV9tNqzpjQonqxQc="
							}
							multi_step: {
								hash:       "OQETB0SFI9LVQ38BC7J3TH38VMMADIOJ8SNNKNMQEQCE8SPCQP40===="
								scriptHash: "12QV6HLLMR6C3SHJ2CTIFEFQBR121LJLP1S7GOJPGS07LENH7DI0===="
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
									cmd:      "go get cuelang.org/go@v0.14.0-0.dev.0.20250530082924-23f252784fe2"
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
