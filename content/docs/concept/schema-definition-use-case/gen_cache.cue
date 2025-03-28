package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "goEMPOJoOzL+hG6Cv607kHTCmm5naoK9Th8CnQnE+Yw="
								"api-go":  "yIHqff2JYKRf8rLDbWyx9azRfR3V09Kuz7uMlVodEz0="
							}
							code: {
								"openapi-comparison": "p/K/ukeKCJ5w6lB87VxPYLPTXvGxyW8w1sC4TntMXdA="
							}
							multi_step: {
								hash:       "H0GMNULKVQEUMCCL1O5A6HG53QQ68H1L43KDRUT77QIAKU1OLSV0===="
								scriptHash: "2IKU5BSNK5H3EM5F2P020FNCO84NLVANUF2HDMCTUH5CO6G7821G===="
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
									cmd:      "go get cuelang.org/go@v0.13.0-alpha.2.0.20250328144635-721ca5db06fc"
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
