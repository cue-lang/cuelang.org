package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "wqwxlIq/skvzzSzUIoST7Jlhn/uDmoQ1C0QYTRiUDeE="
								"api-go":  "SAx8UwjaRH51dCTf8QUQjdZLHAUHVLzeiCKNl4F8oEQ="
							}
							code: {
								"openapi-comparison": "kwZf/ndIe0ikEzC4uZyfTltGGDmUzk80GBddM6jeJ4k="
							}
							multi_step: {
								hash:       "UKFUHRLDRQAI1MD6GBARKAV6FGED1AF62A6JGGB4V8H0VGFA3GSG===="
								scriptHash: "F2JQ4L2CEJI5M7PTMS6U3GVP8KD1A4LKIIJMPQ451S1AUDOENUCG===="
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
									cmd:      "go get cuelang.org/go@v0.13.0-alpha.1.0.20250314174817-9e333c606194"
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
