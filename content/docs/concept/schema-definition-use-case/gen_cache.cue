package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "3yAyy5tl8Y0xb5eWSR6O8v+Ina7WCbkZbpRPob7Cj3o="
								"api-go":  "pHuydNWgOrcivehNQ9AGEnb7WhpLjHiEFsKI3CBFquM="
							}
							code: {
								"openapi-comparison": "AKO+CoBgTCEBEluMq/6WDOVf9+u3DkJTuOdZCpt4gcU="
							}
							multi_step: {
								hash:       "CEE64OELENUBEMB01L91DINOEJC06Q23HVGEFPU8QMIRNM0SLUEG===="
								scriptHash: "FLT2G4NFA535N7CLOEMODEABV6BEB781JSS6DVIRAQH7TEMAN4SG===="
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
									cmd:      "go get cuelang.org/go@v0.15.0-0.dev.0.20250822143201-1eff22f3f91f"
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
