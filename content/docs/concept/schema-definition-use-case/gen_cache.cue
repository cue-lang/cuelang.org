package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "r6mMqZFTBjkPxbCAqs83H76NjS6diBboPsAx63MNZ68="
								"api-go":  "bY45N1lMkVY/1DtjRuxoPrQ2bvJjJl4+xSnFV4MHpWE="
							}
							code: {
								"openapi-comparison": "FtoMUlUW5wSTUTevu2fAH7NBaKecJws97PKOAnwE+k0="
							}
							multi_step: {
								hash:       "DOHSGUD5JSPMS1AQOG30H1HEIE81Q3UBRQFQ6M6U92D39KLH8QK0===="
								scriptHash: "3SL8IJUHUUCDLISS9LK44N2TORROO5SO9TCB9K0P2TDTGE7SL1T0===="
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
									cmd:      "go get cuelang.org/go@v0.13.2"
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
