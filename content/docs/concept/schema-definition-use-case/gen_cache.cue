package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "emmVyJ7zMCnU0c7saAYa+e3JhngW59Nk8am24zJSDn8="
								"api-go":  "5S8e7ZcnOrHXRxYEfUaj+Rp1nTii3y+/fNZl1dXrh8o="
							}
							code: {
								"openapi-comparison": "Mruw7x3ThSz3Nl0OYy1U5F5WqhM/2X11x3zlqzQxYFc="
							}
							multi_step: {
								hash:       "J14HT40C9B02EIU4MAGETTNJS2EC7QQI66PP6L0OUOH7LD9DSKM0===="
								scriptHash: "S66MQRC670777OQOEVDJLQ3K5PP59PLVLQ4S69JVD77PJSUPHUAG===="
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
									cmd:      "go get cuelang.org/go@v0.9.0"
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
