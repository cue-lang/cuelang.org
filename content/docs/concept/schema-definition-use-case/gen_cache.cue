package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "9M8UeEc776nWlQq4TDtrTIIOsvGujExJpvXb8YJ74j0="
								"api-go":  "B7Uw34qUIIepne4YinqArHKR8O8GR0KV09l9PbRzME0="
							}
							code: {
								"openapi-comparison": "nPKhiOOa9HM0buRhMwXZ4ayQdO7VX1tfKaywqUk2IRI="
							}
							multi_step: {
								hash:       "IM5TEEU0B79OCQTFO3A7NLBS277N9V33R6OSTDLLOEP7J1T2FNNG===="
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
