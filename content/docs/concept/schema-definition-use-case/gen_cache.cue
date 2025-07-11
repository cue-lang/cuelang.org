package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "rwwu2G9mwBIMFunzlk3knHv2cLT2cxc5hp39jESagd4="
								"api-go":  "tlKmrHthTBh+46wA1yJmPYQZgzhSaF5UGElD07CiyqQ="
							}
							code: {
								"openapi-comparison": "9N2pdZcHzR3XpmEpkRGayqAdTurkJaAQbSw4BTw3ZU4="
							}
							multi_step: {
								hash:       "O8IV7P1PD650NE4FHHODBQVJJ1IE1BMQA9KPEFPNTMPQU4C63VR0===="
								scriptHash: "5THMOI7EKG7B5N2DK2MIJETJJ9LKOP42MUEIV46Q8AOJSB80QR3G===="
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
									cmd:      "go get cuelang.org/go@v0.14.0-alpha.2.0.20250711132054-9ca9609cf83c"
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
