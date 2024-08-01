package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "TXH6AkAe1d7sUGPoJpqddRQnAvLoaiL2edkWaRv8R2Q="
								"api-go":  "1/p88jm+Yz4tQqjPAMHseySNCl7YtBUE+B3U1QkowsI="
							}
							code: {
								"openapi-comparison": "XYvE5UsNWq5yVfLAIu/gWjM41LX4nQo8Smb6AxzxuU8="
							}
							multi_step: {
								hash:       "4IAAPQGM9157G9F9VNEN2LITKNEGKC9GUQE876J65H36RKQ492AG===="
								scriptHash: "D4HLH44BEJR50DNSD7NUB8A2D7ES4FUBP5MLKN322RH0GV3PF2N0===="
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
									cmd:      "go get cuelang.org/go@v0.9.2"
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
								}]
							}
						}
					}
				}
			}
		}
	}
}
