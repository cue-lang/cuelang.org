package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "4D9tpLFz+PxhL+4Sb8M0VfCFsel3F9Y1VGg4rv0h/wo="
								"api-go":  "YvolDtrxepqbZvxMEt34zLTA8TUDV6rPjQ4Le749mOk="
							}
							code: {
								"openapi-comparison": "0hhJxlf4vkYlMS9l5Qsl1RYZY8AcQanoVY+McvDRe4Q="
							}
							multi_step: {
								hash:       "9JA58UGMUS6DE2T9OE5OP9HAESQLTHLA4O4ULNP597EJ45KK81Q0===="
								scriptHash: "VM8VTSQUG9HDB1O2I7A1DSEQQ6C6EVHKSS4RQCCBUJS0GSLGDDA0===="
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
									cmd:      "go get cuelang.org/go@v0.11.0-alpha.3.0.20241018151444-6e0525b34633"
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
