package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "NWi6W5wQxJBVsNfK9Uvw7eXEZUWUYIdH1RI0hCLMETg="
								"api-go":  "+Du+8qXxf/wO576niSzIHb+mvpV6SKfSMlulLv1qNtM="
							}
							code: {
								"openapi-comparison": "dhTQJMEf8yGJdNTGLBWWGxtjHrp8okO5E1fGBE+nS+A="
							}
							multi_step: {
								hash:       "VKT352QGUBK7KP6GL50O0LMSA0DU9ATV9DRAGF1PLGPTBIK2VVM0===="
								scriptHash: "JJTJUI3C8JN90BRB1NTBNAGEA4NPCGOFSP8K9TI90MV840A9B0L0===="
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
									cmd:      "go get cuelang.org/go@v0.14.0-alpha.2.0.20250718122344-9afca7305a43"
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
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.6.0 ./..."
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
