package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "4MoM0+AoU0QufRcfxg8F8Ds+XJCEdl37AzC+wnlJaNo="
								"api-go":  "8qSu3oAiI5bYKQS+OXHLb5gjdy4dTbA1X1tLjXCHuWI="
							}
							code: {
								"openapi-comparison": "Q04Wbf5BhhvtkqNoLLhqri07ZkkDIQA/xmisbKwUFac="
							}
							multi_step: {
								hash:       "DN8F4S8ALMRO4KGKTDLE4PGLN6J3Q93B4ET7C809TNT9R2LKF6HG===="
								scriptHash: "OGUD28EMJ9EADE87I2NPURDMMD0F8GJ4P1L9QRFGFGQJB6QO94IG===="
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
									cmd:      "go get cuelang.org/go@v0.11.1"
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
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.5.1 ./..."
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
