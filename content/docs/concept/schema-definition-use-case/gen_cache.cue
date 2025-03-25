package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "6se21yf3WFtutnj9/GoQzgr1ylHC1morh87p96q1gkI="
								"api-go":  "fJ3nQww2dVVIuQumEkC7r1O5luDYybqAVJsSk2y8qk0="
							}
							code: {
								"openapi-comparison": "LcMzbrO/Mf/R0TV7E7qwq0IqFXL3YFkVSMB4m5S9URg="
							}
							multi_step: {
								hash:       "RJM8GKS1UGMQU0DI59L7I1O03ANDTNBOHIL1EQVNU487LMIA80QG===="
								scriptHash: "GK2719D2TJ8UKQBRCC89E4BBQERL8R0M4H3U8294FH13A2BLSPOG===="
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
									cmd:      "go get cuelang.org/go@v0.12.0"
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
