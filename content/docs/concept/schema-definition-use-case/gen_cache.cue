package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "QRoOuumS2cyU+h48DXy73lox0w0K9GHF+e5EnmswTKQ="
								"api-go":  "hkwQCzNjvBr9fk3MmxzjIZ67qNnWjdlidYu7Vv5ZYHU="
							}
							code: {
								"openapi-comparison": "fkgjU/yGIlMAzeTZ1/UuJpVH1dDgp3Wb8ZyB4zhjiJI="
							}
							multi_step: {
								hash:       "CIPEDTRCJ2KB88M5GDLL601JKJ5G6CBS47FHB177MTFFDFS291OG===="
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
