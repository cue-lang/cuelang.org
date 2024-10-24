package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "3ctc4pUp2/kCDL7j/AnAMgp3cz6qNiE1q4Yy0rdm4Ng="
								"api-go":  "T0uJ69cVzExyU7CB6jBhTLT0xOQ8yhVNWpcZ0p3n2Iw="
							}
							code: {
								"openapi-comparison": "UCtOwYWb6F2acc4uJlCgbzinDBy7rC0txWlUU+ruEyI="
							}
							multi_step: {
								hash:       "TO6112E145H92RA860D54EMMS19G8BS1HGO2CBD8EFJ072ORF9D0===="
								scriptHash: "8TVMNPJ036BJM2O7UVSN0OUHU32IP0UBODJPRSQ9RGKN4F7L3UGG===="
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
									cmd:      "go get cuelang.org/go@v0.11.0-alpha.3.0.20241024161207-80f4f236e293"
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
