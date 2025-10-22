package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "XLPl75glJ1j+qoLsFmwBv5A6BdVyEiatBpEF+N3LDno="
								"api-go":  "6qXGMp/Ku9ccQ/pXJTUiEAx2lYyrRwybGkq6qLdlMx4="
							}
							code: {
								"openapi-comparison": "Stx8Y4pLYJ99IaQJv+LAudKhnSlv5iJ7KX9vLSbp8mU="
							}
							multi_step: {
								hash:       "DU6FQL0MVQO0LOGP2C9HUNJR2JDVQ5BM59BUP1BCH6AUB3JIVRH0===="
								scriptHash: "QUQGA4I1LRSE0E28FNR1HNSTU1Q8NJ7O3L4K89GR31I5M6JTIOR0===="
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
									cmd:      "go get cuelang.org/go@v0.14.2"
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
