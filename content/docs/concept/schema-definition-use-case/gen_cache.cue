package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "NheKIMoHxmF0ZtPw2W0IDnRJQz6uYRy9lmZkMAancLQ="
								"api-go":  "xMjx3Bgmqwb3vLR4VXdsQSDTXe9vr9mPHq8be+vJhO4="
							}
							code: {
								"openapi-comparison": "4eUCT77lsw+7gZpbls2WtU+5ITHkHcyx/86zb0UaBx8="
							}
							multi_step: {
								hash:       "UQ6LAVGKJPBTO8MEGJ3GPAEKJ20BHCTEUR6ME2FL8AS7Q7CLA5T0===="
								scriptHash: "FB88URJ4GS2AP1BUSJ4J01F8UN9LKE9K14K8FN5B4CGSPTHT06JG===="
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
									cmd:      "go get cuelang.org/go@v0.14.0"
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
