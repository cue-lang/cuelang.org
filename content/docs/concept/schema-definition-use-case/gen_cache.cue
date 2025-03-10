package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "1kHAmwzNQdh9sccrZJsZUdnDYlFm0/R+p83V5uiIfIs="
								"api-go":  "1ewrYUoyN7I6CDTw9fV7uKjKjOtlAWqMr5024hpJ+9U="
							}
							code: {
								"openapi-comparison": "I9Bp5+Vpmxr3QG8g5N5HGwNXPgvwpNzgN05KCPSHDmI="
							}
							multi_step: {
								hash:       "E5MBTNC48M75QS07QN6EQMSKNN03DJH5C2IOO6873BKSFIUKE720===="
								scriptHash: "AG015TI7T2DR56QG0BSPKKTDEADM3GTRCGJ7LR38T7P0PV65UB9G===="
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
									cmd:      "go get cuelang.org/go@v0.13.0-0.dev.0.20250310212608-931fecbeb96f"
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
