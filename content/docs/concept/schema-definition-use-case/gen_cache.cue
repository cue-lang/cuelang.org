package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "cPXhDtP79Mut0nIMIwZiJ1l6pVl6nS3Rq/c72NOFZ3U="
								"api-go":  "vMLeIYQ7lZmFvy4RR7oArrXNHmWhxVj3p2fqTFm8EeM="
							}
							code: {
								"openapi-comparison": "GmvCBSMmN1AafAntNlSWsxVzJAfKBKyDzMBUF3mrzqA="
							}
							multi_step: {
								hash:       "JEK4SQ47ME1AS3M1U3QMJ0RDOA2MMKJINHH4SU18ULIK0OHS6M6G===="
								scriptHash: "M8DOT3DOL5GUSS0D1QEPP9CRHCBDEU4RHDS0IIFJSDPF0DVCLLS0===="
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
									cmd:      "go get cuelang.org/go@v0.14.0-rc.1.0.20250724155554-6d101321cb41"
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
