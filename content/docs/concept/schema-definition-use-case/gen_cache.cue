package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "/+rNJPpS6QNQzJHwx0Ul4lsezECo8Ud4CbKNaK/4PPg="
								"api-go":  "k0q6QUXZy/kJsW1pN4Klewr5kw2lolMAah0DAlnuxuw="
							}
							code: {
								"openapi-comparison": "jPa2hv0vPtZC/S7/iSOate0SYwyN1wyuUzJm9SQirUo="
							}
							multi_step: {
								hash:       "FOI44PMCL5RDJF8EI17CESOFTNIDIFA3Q6DGC958AV34E3SS5R1G===="
								scriptHash: "SMC0BVIFGA4QJTNJQ0QG6GKR6L2JNSGM4MSOIMHEBUJTMC3TDG20===="
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
									cmd:      "go get cuelang.org/go@v0.18.0-rc.3.0.20261104170309-b057976c6156"
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
