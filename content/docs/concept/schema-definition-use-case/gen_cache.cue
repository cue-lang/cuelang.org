package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "1+L90eX5wL3T8jFOpd6XwfmYBlqJabVDUSgdQkTZXKg="
								"api-go":  "lNZN2lmSogSHKEwyByXnlO/8jQKa2XoQrghWBH6ZwDY="
							}
							code: {
								"openapi-comparison": "1/DnkbgM6yalNKUHxAYUIb+wVxeEHXnr3uIwMZt21ik="
							}
							multi_step: {
								hash:       "2Q3QR3VNAB64EAL3ESFHPELDCJNJO12FRTMDJ7MCO37J2AB0LU60===="
								scriptHash: "P6RI6LS2T39F481614NIJDTKGC9IA6BEDTR645207F05O71FSKC0===="
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
									cmd:      "go get cuelang.org/go@v0.15.0-alpha.3.0.20251025133102-654b5c06c385"
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
