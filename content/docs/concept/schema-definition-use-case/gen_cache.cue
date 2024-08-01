package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "zNJabnjmX/ps2WXHBaf1VfH/Od7b01sgbzuhYdRq0fo="
								"api-go":  "JZzGI/uB2vjGP/JLKdlp6wCWNFMnl1bVDE34wqFzuFg="
							}
							code: {
								"openapi-comparison": "2TLH4/AzYyZ8gKCsyJ4e1iNkjWU/CWeq8yCuJM3Pj6w="
							}
							multi_step: {
								hash:       "5KMG83E93QRJFEPC20D425S5L2NUHFD5NIHHC2HCGO05LQ9K04K0===="
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
