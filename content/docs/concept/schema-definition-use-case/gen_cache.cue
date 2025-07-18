package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "FMfW+0fgntnOk8GHtjYOySk3CQuhpeTrSElGEkw9Q0w="
								"api-go":  "PVy0uth4mshGChnc/ldvVGZcTMTbzSmS15L8OgntZ6g="
							}
							code: {
								"openapi-comparison": "u6+gxkcqWvMU8BLsnnTMjrfykNkwQZtHEuRzaivTozE="
							}
							multi_step: {
								hash:       "CRBUMT1D6HH4LP26IL9DJ2TPRBTL37VA7FMKTL2D89SQ59BJE9H0===="
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
