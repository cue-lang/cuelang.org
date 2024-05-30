package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "zCIxXTvjFOgwQ1q/WkO4FdwuWtlwO+38GisMhotxp+I="
								"api-go":  "W3VBtyKu7q5PqQO87onw8HsHw24hgzz3rTZEhoOKxnU="
							}
							code: {
								"openapi-comparison": "mrPYm2Z1F1zEIYk1gZSu2w4w60dq07QJRf3/sJ5zqng="
							}
							multi_step: {
								hash:       "CAJIMCBGMC2PP5A2J1UKD9PSFCGCC95AH6OLJIQ99QV0M4UIVE90===="
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
