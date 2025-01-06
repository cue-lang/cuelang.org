package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "d6mcIha4kU7DfFzG9AkHV745SeB+goS28JN+GOAUpfY="
								"api-go":  "q9YP9mkg6AE0CkCTSpYNFZ2s6iNr2fktcRGGnjFXKek="
							}
							code: {
								"openapi-comparison": "CteL9o4P9CfZ4jkKHDALzVnDdfC9pq5iMkhRMxIGW1I="
							}
							multi_step: {
								hash:       "C63BKQ3IQ3OSNO030KLJFPCJRDB46TQ2NGBR73NBAKG64NU8HKF0===="
								scriptHash: "OGUD28EMJ9EADE87I2NPURDMMD0F8GJ4P1L9QRFGFGQJB6QO94IG===="
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
									cmd:      "go get cuelang.org/go@v0.11.1"
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
