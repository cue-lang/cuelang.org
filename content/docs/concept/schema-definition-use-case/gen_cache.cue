package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "NXacul0zPF+deus+mmf6n6pIK5Y2HxRQciRLjmYQfAk="
								"api-go":  "V2iX3seZOaGpvvi3Tpv+pocMyAcQbwGmPz0fRQgVQaM="
							}
							code: {
								"openapi-comparison": "xMdqUkRXLI/sg8yT3EnCj67CZxskyiKNYCSMxaTp2LI="
							}
							multi_step: {
								hash:       "MTKVTLV39NNSTVPSHJN0QO1SPU9924GS2UGSRCBTKAN3M4VCP3V0===="
								scriptHash: "V0AAELIOI6TT56E92KN0QRHGKACJGPR2ADHCE3D0CDKC24R0ELT0===="
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
									cmd:      "go get cuelang.org/go@v0.10.1"
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
