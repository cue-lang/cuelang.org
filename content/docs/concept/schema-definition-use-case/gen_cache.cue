package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "DNW3GPgvEpYdR/E7pHWeZ0MeAW909WKFcZ0wI++4pok="
								"api-go":  "zWgHKCVhBvEYlfSZ+mSFD709QISHZNxWgpV5wa7mYEA="
							}
							code: {
								"openapi-comparison": "ly0Q9xwr7y36GLhF8I2nauNcukPry+UXVhJMaOuaL50="
							}
							multi_step: {
								hash:       "63R8B0HG10HMKJI1I8JCH3V5V2RT0H4ORNG6R6DHT4UI8FUNVH1G===="
								scriptHash: "2AHQ4TPJ73Q0T370HU1HU40DM9DMI50E1A4MPSLDM8RE4LDE81GG===="
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
									cmd:      "go get cuelang.org/go@v0.0.0-goreleaser.202609101448"
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
