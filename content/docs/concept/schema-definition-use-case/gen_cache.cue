package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "laUmI0kuuIqXrdaQ/V410KiJxtzrixcBC67zX2HvcK4="
								"api-go":  "m7bwigDXsUlElJ4q7+1JLxlLcGDfnvDHyQi3/nMn3R8="
							}
							code: {
								"openapi-comparison": "N7z1bKJ9pnVmBzCG5D7YL54jZClks3UyDYYv5B1kYAE="
							}
							multi_step: {
								hash:       "VA1H7LBP8P57V5L334J5OQQ7JPEVT36HRDE89V6VPCECQRCAE54G===="
								scriptHash: "0KMPCETBBEF5U1KK2BPD61R882N1SAIK957C5LI3HO40RMR2LC70===="
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
									cmd:      "go get cuelang.org/go@v0.16.0-alpha.1.0.20260213130521-9e2dec3b9a23"
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
