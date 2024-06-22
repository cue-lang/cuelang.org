package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "nh7d8gHd1G9VWUSuFphQoOvLunjf1MOsz32y7ow5Y9w="
								"api-go":  "gXJamO5XkFtSzSfz4Uq5Wf/qVGgZ4LAry94vxU8HQjA="
							}
							code: {
								"openapi-comparison": "AVjjaqU7EO3O4acY9mjm2mpUbpPwAbBnehbw5bDey9A="
							}
							multi_step: {
								hash:       "ESKORFTMJ0V38BFT3CBIUJE9RN94QSDM65ODVONVM098ASFHDJRG===="
								scriptHash: "VUJOCIFJURRIDJUV3GER6IIDP9RVAGCC3OFCDIK417UICUES34SG===="
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
									cmd:      "go get cuelang.org/go@v0.9.1"
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
								}]
							}
						}
					}
				}
			}
		}
	}
}
