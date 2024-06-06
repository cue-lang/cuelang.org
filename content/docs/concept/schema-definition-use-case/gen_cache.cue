package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "jCNfrEIN2T16mfnuUKDJ7Bv7pNfEQRSSFVt++jwWhKI="
								"api-go":  "+9RyHj9T1Di7KuyKWkG1kPBg/S9MQ2LVM9uAQ+5PBss="
							}
							code: {
								"openapi-comparison": "ARtZFtJBoTVL4n0nHERcoIzT6FD8iP4+sowVh7T61sE="
							}
							multi_step: {
								hash:       "SNNO6DS92O568S41QBPH3C51RKO576VB0EV1PMVIJSV5BCPKFDH0===="
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
