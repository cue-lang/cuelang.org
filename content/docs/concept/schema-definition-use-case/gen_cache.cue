package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "qFqOFxWo/WJfBnRaUVGWMwAJ42YFr3du+WT7LidROis="
								"api-go":  "6j5QPBXyEFfFkI1d98L0bme5AS3vBuQG84pjNNqkGxQ="
							}
							code: {
								"openapi-comparison": "BNrcsPCOS0+R44uXbzkNRMCHRhKV8Rt9dgd2sM8vyiQ="
							}
							multi_step: {
								hash:       "T6VB42B8HSGHGPPLRQIVIVMSF9H4D7U7546EFHLP13QGJTTUV930===="
								scriptHash: "UAQ2MVCJT64GLOF9FK884SQ5OMF5I48GCG52K8SKGAKI73LQOLBG===="
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
									cmd:      "go get cuelang.org/go@v0.14.0-0.dev.0.20250612173542-c92590272bc2"
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
