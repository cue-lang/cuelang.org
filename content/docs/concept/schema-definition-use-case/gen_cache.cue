package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "d2FQ1jsG5CWyNz1IQPgSy5eo/NFSUUL64KoiNJO1m00="
								"api-go":  "Ox2JiCke8bCvrQSCxgSiMxPkh7WKgHyLj2sxvxgsUXs="
							}
							code: {
								"openapi-comparison": "PIGe8b/Xhti9W5M3sW06S1EtUDUTPC6hFKNrP3nRq+0="
							}
							multi_step: {
								hash:       "VS52B8VLI870CNI7VR1D8HIF6T3BINCE03SVOGCB8RE8PAUB09O0===="
								scriptHash: "3ROVFVRBC31R0V3O7B6KPUJUMUII7SVE2MNIQRPMDSCT98UJCEBG===="
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
									cmd:      "export STATICCHECK_CACHE=/caches/staticcheck"
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
									cmd:      "go get cuelang.org/go@v0.15.0-alpha.1.0.20251003162346-5c15642ab78c"
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
									cmd:      "staticcheck ./..."
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
