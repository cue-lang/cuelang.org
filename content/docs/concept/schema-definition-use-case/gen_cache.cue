package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "lsdEIdUlMoXOHHI0lYYUXu6va7emFe3VfY3IJnIyo7E="
								"api-go":  "WwBDUPOGZiSG/Fn/JXbz4ZYAXCQhv+hi8TwP7BHeGi8="
							}
							code: {
								"openapi-comparison": "1QLX1/f27/byihZ7wVmPlaY10+Rv410O6T5Jdyr7z1o="
							}
							multi_step: {
								hash:       "V5FJVIABMHEDBTALO7T9IT4FE0GAMBVKBTV3ID8OLIN1LB602B2G===="
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
