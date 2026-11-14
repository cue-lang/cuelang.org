package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "VKWbLlEa9ofKthbwX7UHJE9AUpOX1fwHQAzwAtMSI7Y="
								"api-go":  "SPvgybMjMIRb1guJgZqygmG1jcXZPWegbZWBE/az02w="
							}
							code: {
								"openapi-comparison": "edWRMVGtMT4V7qDS4ZCznO8zylmStqe1Ik7Rwe5DWVA="
							}
							multi_step: {
								hash:       "44FBTQ7RCMSBP241B1PPTT80AB0J3DANO7QHVLM6R4H74J17CGTG===="
								scriptHash: "SMOS78D3FACDSQ4Q9BS4O91UQB700J1PNLFFSJ7DON8ABISMUT4G===="
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
									cmd:      "go get cuelang.org/go@v0.19.0-0.dev.0.20261113115251-a5a9a9c5a2df"
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
