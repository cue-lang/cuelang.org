package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "+uxJT3ZEFf4ipvtQ9AmGXm+ClNZK5tk2g/QehXormVs="
								"api-go":  "ZF7/kO7FLIVIRQRnAN1m5ct68NywxxTD3zcMaBc5xrA="
							}
							code: {
								"openapi-comparison": "fai0DhyMUE9kyxeEJc5xPzlzkrAiUohk9A1rNXB0+uE="
							}
							multi_step: {
								hash:       "7ISMRCOPJM2QHRC66N72UHBVG33B96VG62QTORE2BUPKDSGGE1I0===="
								scriptHash: "CN8889UQR2KON7JLCLHPEO7K1L09VHGTPJJUQ3JF5C5HC6R1EON0===="
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
									cmd:      "go get cuelang.org/go@v0.12.1"
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
