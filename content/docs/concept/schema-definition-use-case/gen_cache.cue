package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "OzfPymYSmzAYHsXD6JfFY947QNZZPDfjtuMA34x1c4I="
								"api-go":  "vkjzm5XL7zGwJU1FW4DcVaLS9hIJRRU+idwBFZB6DpU="
							}
							code: {
								"openapi-comparison": "LyHQVFw7mTxVIx2/kkbAD8sFZVfmM8hhW4PNPJaW9Rg="
							}
							multi_step: {
								hash:       "4GR5C2HH7OAMO4U1QSO4PNUHEAOIT7C10BCQV2SL99LP8K06JE30===="
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
