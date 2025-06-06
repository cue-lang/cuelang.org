package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "JxoHiiXeRDqGYVL5r7u9PTjpOxytpkPbViGt/IYDVdY="
								"api-go":  "9KiuouzOf3EBb5LMw0lsJ2XrCPc1v0EtSVGyVQK1dxk="
							}
							code: {
								"openapi-comparison": "BWIMDfEjUeoNuonmYox+enMa1cMI2mS9DlYG0GG+kaU="
							}
							multi_step: {
								hash:       "8C13LKMUVHGV8PEOHH84VB0QLD6DMH69E7JGLJRIU2J481ENRSB0===="
								scriptHash: "MN2N4SICT6V29Q734QM3OUKTDGFVOJ95Q9C4HP9O27QLA7K97RVG===="
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
									cmd:      "go get cuelang.org/go@v0.14.0-0.dev.0.20250606135340-250524b0d6e0"
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
