package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "m5iyjvIfHISJMoN3Ik3p0Z+m0cu0MKQPf5+8BRMwqHE="
								"api-go":  "DPv65C14sB31I3jhNc6iRUZlb6FEVkA990z7CVF8GCg="
							}
							code: {
								"openapi-comparison": "T+vj59V9spbq0BnWKz+WEoqAOkJ91BEU+5N2J0KHp+Y="
							}
							multi_step: {
								hash:       "SRVDDMLD4E6PCEOBS9VNSLSM694PULRENNHQPHV14CPNJ16RKLJG===="
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
