package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "cB1j4k+trfwocL/vRJHZpU2m4eXE3yZJTqVvC2Phh1M="
								"api-go":  "rtomB3cP0d4690BrxFWsPY+3dgT5GlwcFUMlrsL8K0g="
							}
							code: {
								"openapi-comparison": "96dpUBWvYxdEWbrgREQVoFZaffYUxgGATll+GFiGQAU="
							}
							multi_step: {
								hash:       "SUTFBROO53I9EQ6TOP9872T8KBK82LV9T32GOSBJHQ489HG0ASVG===="
								scriptHash: "468EOBITT01UFOINO8KD9K98E6EQQFJ5UG5V74CITG9N6T523JGG===="
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
									cmd:      "go get cuelang.org/go@v0.19.0-0.dev.0.20261127222705-d53722b2b9cd"
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
