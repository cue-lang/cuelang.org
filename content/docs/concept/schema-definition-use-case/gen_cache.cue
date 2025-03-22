package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "j4lGbCbk6eeMl/iBl92qfUSEAjOlSfqR5aq7C7DEXEc="
								"api-go":  "ghkK6uyhBCEFMUbjrIBqqDTF1Sh23GqQSrQS5sTBDK4="
							}
							code: {
								"openapi-comparison": "P9zOYIWKdgGERAdjyR3pmqC67k88u1O7dsXXq/B3Gdg="
							}
							multi_step: {
								hash:       "BEB3CJ8AVTDB9N6SM8VP6I9AD41AQ91JC88NR04R3I0R931UQAJ0===="
								scriptHash: "PQK93L31267SOCVVBDP869Q7G9K5N6N0DUKH85BM0JD3KQKJI530===="
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
									cmd:      "go get cuelang.org/go@v0.13.0-alpha.1.0.20250322080417-cfbeb48088c9"
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
