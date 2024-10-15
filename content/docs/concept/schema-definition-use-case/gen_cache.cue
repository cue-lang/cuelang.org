package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "Gh01vfJZODeXpHrgdcTFgisGNSV2MDpzQC2QPv0j8gw="
								"api-go":  "SwDMHHMUNj9IA/RQqVwMh1hNrYw5UUuGPJFru5RpJ8M="
							}
							code: {
								"openapi-comparison": "cmoItWnO6HDh9B2oib8RldC8TiWgy8F+bdAUwLzD8es="
							}
							multi_step: {
								hash:       "1N0DIHJ7C426RV1PL3HRDAVJTVTPLOH2O5Q8TPDO2R9CJ11U0TT0===="
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
