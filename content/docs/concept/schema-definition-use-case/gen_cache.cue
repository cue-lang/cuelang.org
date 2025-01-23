package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "l57yuKcrmLcBhYvLxWxifBi9xW0KxX14yDDv5qqVsLk="
								"api-go":  "4B7uLQi1WSx/sCMzQkA1qybxm5JjJy+FZwsw09mr1UI="
							}
							code: {
								"openapi-comparison": "L+YXWGJDZiVSvB+KeB6kGlYyYwwhfE+7HJmX0T4nQ7c="
							}
							multi_step: {
								hash:       "4E8370K9EBCA4RBJ01HN7P7A7FOMQV6J4MKAEPG8FLUHFAF11TPG===="
								scriptHash: "BRC7NEO0591GKSDLDO8RRDC9GGT3IKN4CPGS6PQJQMBRP6Q7DFQ0===="
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
									cmd:      "go get cuelang.org/go@v0.11.2"
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
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.5.1 ./..."
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
