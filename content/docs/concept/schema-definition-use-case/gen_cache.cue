package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "TwLyrBXs3HiF36rENuo+T5sHVjfJTvo4tebtv7lHojA="
								"api-go":  "E2/hJ1My4hjiYwP5+qYldS01HLeQDq7PVKcCRG9gP4Q="
							}
							code: {
								"openapi-comparison": "RFytqGfBxKKJewCZPZAMti5Xv3Xv357xxF1h0NWYlG4="
							}
							multi_step: {
								hash:       "N4U2R56EOMI94HUKEBNCKKSAH3B47C8B54I5JTNDA8VS45VU3DFG===="
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
