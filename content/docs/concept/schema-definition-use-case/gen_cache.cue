package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "41g9+oDUtV5y5tguKNjS2yqLxiyQyLMorZ7ZNmVooOo="
								"api-go":  "/Q91ysQXQ2i6s7i2qUqKZKm10tqM979BxY/hW3LyD7Q="
							}
							code: {
								"openapi-comparison": "hoRyd3HgrIKZD0UTaHTMkWwxlemZwiDP7TfUj5xBZOg="
							}
							multi_step: {
								hash:       "H8KMSC603FLQ2E5J55IEJV8QIT4TTCOSPQ70MBG5J0QHEM9GKJNG===="
								scriptHash: "VUJOCIFJURRIDJUV3GER6IIDP9RVAGCC3OFCDIK417UICUES34SG===="
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
									cmd:      "go get cuelang.org/go@v0.9.1"
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
