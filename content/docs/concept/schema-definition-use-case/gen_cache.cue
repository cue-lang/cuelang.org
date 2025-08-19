package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "g1ODHSiPTN4vX2PXuKhlfsm1TDmfh4T77c4mBMdPFik="
								"api-go":  "eJU8mHBHKChksa6VTwFcen/1Q48uJQ5PwXFlAuz8tk4="
							}
							code: {
								"openapi-comparison": "UuLFij7U8L/guxQxcY3FQJZqmKnhggiHotup9dGhgtw="
							}
							multi_step: {
								hash:       "15SCRB7748TP9F0OCLCTG0O1U7Q1E516KS36KAB2E3722FEE0GPG===="
								scriptHash: "RALGIU94MV4TIGBV0DQ692BVAMO6555L5JHSV766DBJRH3SNHG40===="
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
									cmd:      "go get cuelang.org/go@v0.14.1"
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
