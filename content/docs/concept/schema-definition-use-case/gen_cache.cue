package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "EkGRL5GJo9XZw8v/ioOLnOizGmLQntgHYGBYZbn7X2Y="
								"api-go":  "0KZmn9ezeNjzU7Jh6XcFsb0zPUF1ULDFTFJs9R+99Ys="
							}
							code: {
								"openapi-comparison": "A0Pl1DzACoS8czuq9OE/pNlyBBmMerR4KEFxUklsLbQ="
							}
							multi_step: {
								hash:       "ERMMH7N0E7HLHMMEP5O3C43D1H4IHRS77O2QLICFA3ID961VEQ7G===="
								scriptHash: "L34LMB1AA1IFINJV8ES274LE0LPJSIH37EEGCSUPG9G687LO6DQG===="
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
									cmd:      "go get cuelang.org/go@v0.13.0-0.dev.0.20250306134408-5d2da079a295"
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
