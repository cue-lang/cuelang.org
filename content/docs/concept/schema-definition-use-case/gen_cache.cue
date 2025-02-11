package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "gYFxvRlQSf5fCxtp0e8mrNsiitxYRG2Kgq59eySMX/Y="
								"api-go":  "c42p01GzJ5AFbKlNjQIBzlBiX8w0kW70mbtokjPd5Fk="
							}
							code: {
								"openapi-comparison": "7b76wpqkzeCyRQvZkZXV3lB+heNry6t7N+IETec0PbQ="
							}
							multi_step: {
								hash:       "PO3BJG953KM2HTFVO5OB7DQ88EADHS048FVO36KUQ30DRN12S9KG===="
								scriptHash: "SA9S7DHM2OHJBGG0KG57D19NKVJ6C8CATDRICAACFSVP9UL99KAG===="
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
									cmd:      "go get cuelang.org/go@v0.12.0"
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
