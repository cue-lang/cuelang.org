package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "vHyeVIE/CebcIsVDPiZcn17j2QHH4HBNFvp7lJ9eW+A="
								"api-go":  "gvHAqx+sCwRKb/2qkvanvebAhEAewUp9tAJaMahexZs="
							}
							code: {
								"openapi-comparison": "DYQimZJzE/VoWzPenFE+1fblyR0VGWLhbg7fKWQrQ3M="
							}
							multi_step: {
								hash:       "M69G5I8PP657445V03N21G8IK6Q5CV6HM1NPHLUF6I6FBFHNAPP0===="
								scriptHash: "R9RQNKBF8F3RLDEC62ETVK9NBC7MQ5L72JDLGS6TO59OPGTNAD8G===="
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
									cmd:      "go get cuelang.org/go@v0.8.2"
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
