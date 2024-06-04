package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "oihEB44API+Z+Z0fwsQHD7xwqrFVTz5D75m0OiDoHxk="
								"api-go":  "JVO861vO2YqAo5IEQUdXNRzjrs7ZD+hK3O39EEhzPTg="
							}
							code: {
								"openapi-comparison": "V6+OQtxDquPi8W36Zmxt+4/uYJ9xEtOKu7bcJavMXwY="
							}
							multi_step: {
								hash:       "98JLJ221SG81D8PUVC7EE4USJF65N6Q9AAL2SN3I0OTE1V65NHSG===="
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
