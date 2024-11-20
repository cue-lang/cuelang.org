package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "QTtLBWNN/gRu9y/BwF0ECQ00LodLsf/4g2gwzmlucRQ="
								"api-go":  "hH8fFJPQct9ejyIPV/azFS1ssEYL1oMeRlcUhUA8c5I="
							}
							code: {
								"openapi-comparison": "BTapEJ+sCT+uY3alRDr3ZdrNBnvV5TjCAr/ooRcybbk="
							}
							multi_step: {
								hash:       "H7BNI46660AV3TUI3NH3K9PBBOBB3F5UEAIV42J092KLH5OOJ3OG===="
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
