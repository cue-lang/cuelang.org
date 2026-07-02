package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "LRFkp12lR1HoAYTSSnphJgGaExvU1L2Mwcbj0I/8AuU="
								"api-go":  "zpJFknoZiJw3HvRoSN+E5qjPefKwWLDynBKSslWOLS0="
							}
							code: {
								"openapi-comparison": "OQzj6iHF8tOAdd9/rSzR15xgpboPN7tsiSXBQjRwImc="
							}
							multi_step: {
								hash:       "VKUF3TGQ3I709525KRG3L86H4DFR18HEULHTUH4MS87N6PCA1000===="
								scriptHash: "8VG2OAIDQNV20LFTT8CVTTE457C54E8H2IAAUHNA0GEPMKOQJBEG===="
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
									cmd:      "go get cuelang.org/go@v0.18.0-0.dev.0.20260702073200-7686325819d2"
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
