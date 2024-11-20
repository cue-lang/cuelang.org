package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "dqzSl7HmwdaphlE/YLk878T0tZbW5ID6W846jgO1/fc="
								"api-go":  "k9BAtNCDs/oNFVmbuDEhFSt5vfKrNj1JB4XUvl5wz38="
							}
							code: {
								"openapi-comparison": "oxEiOwQSIQ8MSOvFSbaGj82yMDo0pv1mY6+03if62ic="
							}
							multi_step: {
								hash:       "CUSFTF2GJGKTQLFBHTBUCMRTJHNVGFHIIF8UIJOP0ESTRSP7PAMG===="
								scriptHash: "30EL7NKL3GUE1J6J7SRJV1QV4H4LS1AGL110P7CNSQS0RBPCBUI0===="
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
									cmd:      "go get cuelang.org/go@v0.11.0"
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
