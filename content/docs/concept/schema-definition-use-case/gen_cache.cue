package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "8aZBWb9Zd9chpw9r9DFXrchlKiOPD60+Ue7XDaSXAJw="
								"api-go":  "VFg6/UTp+HEv6OCLQpOS+/RyReTvxWNpTBNx1DUImg8="
							}
							code: {
								"openapi-comparison": "9C0CdVxpZZJDar/LNAvaXQiWtZlS80d3eE/9pQs/oGk="
							}
							multi_step: {
								hash:       "8MJUOCDKTVJ05HFOS5JU9UGV0U6ECJNEIST7EU9QEDOGD652G27G===="
								scriptHash: "RM5OB5U15CV3OJI1MFS622RKG1L43Q8R8H7FTLLKRS5KAULPMNR0===="
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
									cmd:      "go get cuelang.org/go@v0.12.0-alpha.1.0.20241220130530-e4c4b8e8a15f"
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
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.5.1 ./..."
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
