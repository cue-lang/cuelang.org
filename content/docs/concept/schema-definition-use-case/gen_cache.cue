package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "bcQWz8meLdjBlO4o1ixaXMDY5r4zwMA2ulQgx4RTWcM="
								"api-go":  "I/oL4zWY2fLWjJwOpRac2AtIDsIR2CpcY8SAuWzbxJE="
							}
							code: {
								"openapi-comparison": "TKr6kSJt0OOOGnVdQf12wnOLhv2pLPywm0QCTGWtNtE="
							}
							multi_step: {
								hash:       "MEUEA0H1CICFO9F4T3FMOQAEOLR1UM9RF8QFJA8KV1OAM5FO8HMG===="
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
