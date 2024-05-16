package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "jMIz79+RSHN/2pmNH8MDqSZAcO8fw6jcIYQ6G8m/cJE="
								"api-go":  "MtcewXQzJJP1n4OCs+NZ70e4d4WV7r7XxJPPj1Z3+94="
							}
							code: {
								"openapi-comparison": "J/5N5oXBoXRMf529uwAo/zRbTcm9i5QGfQH3rwta874="
							}
							multi_step: {
								hash:       "4NMDL13SU851KGHCBCEKPJ3RM89QM5JVS7CI907U04DJ985FEA2G===="
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
