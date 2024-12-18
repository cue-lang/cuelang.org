package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "PoBkPik/u8FiELiwbPtZU6YrysbRId1rcPXdoCj7+Hc="
								"api-go":  "ABVlmt4lznsRFlwOqppDDD4HN9LNicz5IBfXDsXkegM="
							}
							code: {
								"openapi-comparison": "bsapxW55p4KdKdDciYihR5nfRsJo3WdlV4+Qis2ajVE="
							}
							multi_step: {
								hash:       "7OIRFO4O00GG91J1OJU9K8HV8345BELLL1GKDADK2J57DFJ3NRI0===="
								scriptHash: "L4CP9SPQQ4Q40RGB5LCAPEGB6RMDCDH15JJOSOMQI3G4R9DVL520===="
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
									cmd:      "go get cuelang.org/go@v0.12.0-0.dev.0.20241218161113-f2775f863f4c"
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
