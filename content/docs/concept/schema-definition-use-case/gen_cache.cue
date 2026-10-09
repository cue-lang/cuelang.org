package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "40SLhfxacqNfHRrj7/s+3+th6m2ikiQ9tSdzkuyKsyg="
								"api-go":  "b1aRz9THgyfw+PKhQodw0DhWkL7vIFG+F2CpFZCufiA="
							}
							code: {
								"openapi-comparison": "gkZ67m/PuQRh8V+Qg9GEGjEZmzmggdWhjlXDwaFO89U="
							}
							multi_step: {
								hash:       "AQ2IK8B0PFNS3AID5Q2G1JV7NRPABT9649KM1FSNB5A63SD2KT00===="
								scriptHash: "S1OEIKT5JK945NUM3VCSCN9GVGF9QLQ9EVDJMFT235J4KK6BTHTG===="
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
									cmd:      "export STATICCHECK_CACHE=/caches/staticcheck"
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
									cmd:      "go get cuelang.org/go@v0.18.0-alpha.3.0.20261008224848-a4f52c2332e4"
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
									cmd:      "staticcheck ./..."
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
