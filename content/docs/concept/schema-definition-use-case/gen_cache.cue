package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "DCGUcqmgF2+ozlrEkUVkD64Bk7VmtpHM0lVO8AGIwEk="
								"api-go":  "BOoYdkecAfjysMz2e33+VFbqA44Nq0lpbcsvzjBQo54="
							}
							code: {
								"openapi-comparison": "e9j3Y9VDslVuashp9kgoMKTbUJqgkEgaiQAT1O7gVe0="
							}
							multi_step: {
								hash:       "SAQ8Q9MTNBPKRPQR67G8P314SI4MHGT4TRP428CAPQ14TL2VOTLG===="
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
