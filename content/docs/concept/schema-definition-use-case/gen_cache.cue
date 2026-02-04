package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "DXAN+fle54mzB+ue25w+wT0zQCx+D4+llkYorS8S7as="
								"api-go":  "Z+tax8AMvyaOiur3/H95Seer3IXd5W9otuz/UQH+vas="
							}
							code: {
								"openapi-comparison": "KzM/E7k9XhLZMivRLEAhUMy2ymmsnMcBz2Yh2rHGb+E="
							}
							multi_step: {
								hash:       "LN78A4TK8SLBHGUR9RNVIJ81SEN35HPMIO6EJDC9K20DHQHPPBK0===="
								scriptHash: "8P2H3DEV8TSBSVB7JMR5A731UKG8U54N9T4SCMMQTRA5KGS35Q30===="
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
									cmd:      "go get cuelang.org/go@v0.16.0-alpha.1.0.20260204102828-049d6e12211e"
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
