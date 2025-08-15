package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "xu3FD6IkzzeZQVJUgG3YPoHPnLNghcBXaWmauo1Bw7w="
								"api-go":  "XJIZWgdjMvNh3xZFZAXSCd6x5WlYt6w+NJWD/V0dsS8="
							}
							code: {
								"openapi-comparison": "lb6uuQoDRrzrTrTeJgdJGMjazvzp4y8GC5kW/fqvZr8="
							}
							multi_step: {
								hash:       "PJM9BUH8BJKB80Q9EM5B7MLV8L7DH0DDU7RSHECFH7L0Q48C3IEG===="
								scriptHash: "JTJ9N6SG57J98NG0NV67U4O6AF5GLOTE8CA5THV3RJ5CQEDUQ74G===="
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
									cmd:      "go get cuelang.org/go@v0.15.0-0.dev.0.20250815110336-a2eed3278a6c"
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
