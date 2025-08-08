package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "76gpmaZEs9HgNAvtBy3WcFwbs7+B/dGMTR6Va5cbg2Q="
								"api-go":  "VB5oxrhYjV7VHtFDag8FabW61A24mcuRXqhezmkB8GQ="
							}
							code: {
								"openapi-comparison": "0sf7QGiUPTUiQV3m9eprkcKm7KWfNonhp+7Wbo+favM="
							}
							multi_step: {
								hash:       "L0LSLT9A53I7M4OGSB22NEEQ5419J5ECA073JMRG0HQIJ9OBPUEG===="
								scriptHash: "A1FACUGQQAGDLEHS91MPGIOJ5EJA8DB5QLAJG0GCA28OLBBUIS2G===="
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
									cmd:      "go get cuelang.org/go@v0.15.0-0.dev.0.20250808151001-88adc227ad53"
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
