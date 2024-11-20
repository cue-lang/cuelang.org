package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "KTov+7cyGNN3UmRTgm/YO1XY1gj3ldw7FVQNds5SUgE="
								"api-go":  "xeZN/fb6ehFiChv1FJPzAg4X+L9kSFtvOB9gf3UhdYc="
							}
							code: {
								"openapi-comparison": "whWdfUX2cDOmCK7RrWY6czijWc7SZWhg1afur7h8RSc="
							}
							multi_step: {
								hash:       "L212A9NC0H7REJDOEFCV8PM5D3G9NQBKBL1FJOUL3H5T237U3RN0===="
								scriptHash: "30EL7NKL3GUE1J6J7SRJV1QV4H4LS1AGL110P7CNSQS0RBPCBUI0===="
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
									cmd:      "go get cuelang.org/go@v0.11.0"
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
