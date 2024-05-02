package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "S1onMjCLf/M8wPjVQI8syZcEEVpldh3iH3Fo+9wOiY4="
								"api-go":  "IKbFFYhEh1qToDZgZG7k96Tx9nVxLDP2coBm+J+PsD8="
							}
							code: {
								"openapi-comparison": "RYRT071hUV/nngIXVc33xt08kRNkQdLcpCqH3Jhn160="
							}
							multi_step: {
								hash:       "307KGF4FG1JG2O11OCTQFJPT5IEU2IJV26MK5N5NDRM6G45G5M1G===="
								scriptHash: "D7DJK2U9TOPR89K1KSFAESSEMJIPRMHPU1HRHMCNA4TOK995F7N0===="
								steps: [{
									doc:      ""
									cmd:      "export LC_ALL=C"
									exitCode: 0
									output:   ""
								}, {
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
									doc:      ""
									cmd:      "go get cuelang.org/go@v0.8.2"
									exitCode: 0
									output: """
											go: added cuelang.org/go v0.8.2

											"""
								}, {
									doc:      ""
									cmd:      "go mod tidy"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "go run ."
									exitCode: 0
									output: """
											V2 is backwards compatible with V1: true
											V3 is backwards compatible with V2: false

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
