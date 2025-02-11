package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "9M/5bXX3EUvIp55HZpCnyu9f2ucB2s6SsaGirOHwYOk="
								"api-go":  "IBWZGLWLGGFMOAi55tne2bm+jOTcwaOl8HjQcWmUgW0="
							}
							code: {
								"openapi-comparison": "Gt5ooE6etgeMNvhoDxptE6bubIDOXYF67R2tFIkkw60="
							}
							multi_step: {
								hash:       "4K469PFD028FOJCJTDTDD981BK23LLR2PC279PFV8L6LJETCF3KG===="
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
