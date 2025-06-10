package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "WKna+oID6nqDFweQi6tMDINmwKuj59xtza8KZgMWp9Y="
								"api-go":  "dlUUqyYX5FCDAiuEFQNsWZS1MFOaQu4VZc8DLnq5XsM="
							}
							code: {
								"openapi-comparison": "Aq8DIe5P0Wr1a0Y63hBiR2i+K65SzZ06QIUDuu0FCe8="
							}
							multi_step: {
								hash:       "1KFRO1N1AMI0GD1PQJ3G5QH0HL22N13S4KGE25AL1MKBAF466590===="
								scriptHash: "LNKAEGM9Q5H417QAKTGG5QBNE9OEOA2F9U3VU8SEP7JIVP0JSH50===="
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
									cmd:      "go get cuelang.org/go@v0.13.1"
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
