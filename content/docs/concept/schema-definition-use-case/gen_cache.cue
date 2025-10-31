package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "LHIYCbSdoBosn6kYUZIfkozogeK6fZH96OymyeH6VDs="
								"api-go":  "MSVmeBr3n/MkQs9TXg5mQwZ494GkoiM3gC4VZ8fkVd0="
							}
							code: {
								"openapi-comparison": "oZ+FYbvN5K5teZfw2faV8RXG3RLftr92XmI2PpZyClM="
							}
							multi_step: {
								hash:       "R9L17IKO15RE70K918U13Q16S9G2RE6JU79LK9Q6N2VGQN1V1BPG===="
								scriptHash: "TPAI7LC84VULLJGDK0F0T2A8J3SJMROU7DOE1BQ7NBOHM6G9ES80===="
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
									cmd:      "export STATICCHECK_CACHE=/caches/staticcheck"
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
									cmd:      "go get cuelang.org/go@v0.15.0-rc.1.0.20251031142455-4ba957271db1"
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
									cmd:      "staticcheck ./..."
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
