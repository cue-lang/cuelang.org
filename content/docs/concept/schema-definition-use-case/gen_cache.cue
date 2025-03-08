package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "Sqtjl5ju25vc1iQVm3NDy4f8tGLpmudliXDBg6xPg7I="
								"api-go":  "+CXMZ5ikHwnazWVJiJzhH4mZ4+Mj8Ojy9jxz0L/EBec="
							}
							code: {
								"openapi-comparison": "u3gsPONDsUeXBvEClCqvKZBzuCn0kZz+QKURhf6qQq8="
							}
							multi_step: {
								hash:       "9970P4DKGPBM1LEJ8JO3V0UR7I3KU8981BSIBOM5A2VVLCD20NQ0===="
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
