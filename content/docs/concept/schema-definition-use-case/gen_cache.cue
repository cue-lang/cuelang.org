package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "yGm+gBubzLM50LSiyTULfI5Sb33/1VTxhl4E9iLogQk="
								"api-go":  "W5ogaRFqLotmvguk2UNAiA79qJ5B0kYdZmo2DOUxe8M="
							}
							code: {
								"openapi-comparison": "E0lDQ3ij3USXt75rAwGS0qVyiW/Aoh/w/lARpSHY7Vk="
							}
							multi_step: {
								hash:       "CFPTVQ0NHMAC4B1EMD3P95A33FO64F5OHQKH6VGE2D6C9HHDBQB0===="
								scriptHash: "R9RQNKBF8F3RLDEC62ETVK9NBC7MQ5L72JDLGS6TO59OPGTNAD8G===="
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
									cmd:      "go get cuelang.org/go@v0.8.2"
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
								}]
							}
						}
					}
				}
			}
		}
	}
}
