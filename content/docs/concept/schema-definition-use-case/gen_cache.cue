package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "vk59HWpIzpN/Lldg2AbLUrAHb9a1qKtYSU8vzzCD1k0="
								"api-go":  "U9JstDdj+NfESpB1SzfRjK0uPTp5YuD/eL44X3LY9wU="
							}
							code: {
								"openapi-comparison": "8GLSL4zjRHWWi4aQXc3VZDlisEkiEiCbjHOlRogJSTY="
							}
							multi_step: {
								hash:       "EB98QKJK77BIVJH2QVEPKQTA9GS10NO30D2U69D58TA3AEC77CU0===="
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
