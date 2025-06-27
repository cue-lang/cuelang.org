package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "wx5+flONO45hTKHfYTM/JUsgL96PA693QkSQSjj7vDM="
								"api-go":  "FjVVsu2LMFvbbX8TVVW1tQmFlJowMkUO5JDb8TE90PE="
							}
							code: {
								"openapi-comparison": "jRkB9jReYY99g1tkcfsWF1xh/S96DPkW/okdM4sOZiw="
							}
							multi_step: {
								hash:       "E2GCKG8Q8M1P5Q9E5OIAB43BK16SC6RQLV6G791RCV9OU5RGME2G===="
								scriptHash: "7I4G3L6ENI8V7LQVJQKTN9NU75NMVNBPV5UQ2MJS6ODGLPMFLS00===="
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
									cmd:      "go get cuelang.org/go@v0.14.0-alpha.1"
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
