package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "bi9MZbaDrr0CYvcivzlrIIazBgmLDGIHTTjHzMzRi4M="
								"api-go":  "vdTgejSOMQwV5Q3lW9Hd9Ch4tctfthEH0osay+rsCQA="
							}
							code: {
								"openapi-comparison": "JmPd1zkOzqRmU9gZy9qFBlDCiTqvnVtYvqk0pSboqQ8="
							}
							multi_step: {
								hash:       "A1R3QLUK04SHA8CQQQENDOEK9Q902BE2JKDPPRETGAT1LUNT83H0===="
								scriptHash: "QH1OC49HSBF5F3PG2I1M7HPB49F8548TESNTN11K3O1JLCHQ80S0===="
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
									cmd:      "go get cuelang.org/go@v0.10.0"
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
