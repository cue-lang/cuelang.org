package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "0CqtyIEhnGvAs6+QC521QK3xCKNUcp1Vjj+pha6oC5g="
								"api-go":  "MwIZtsree58vZ/8ts5nru/NaZRU8JYihB+MNdIuKSzU="
							}
							code: {
								"openapi-comparison": "oLC8lsT1YAmLQb/7zywOJmcvnYRnRLV/g71VC0SHKqw="
							}
							multi_step: {
								hash:       "NBTAC1DI7CMDQQV03KP0GMVNOCJI3GL4E0N8BT0G4CBU671D4SM0===="
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
