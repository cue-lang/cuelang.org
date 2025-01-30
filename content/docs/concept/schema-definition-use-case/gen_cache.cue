package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "dd8ikoUT+BDKmLK5Nra8EO3wosyEUNSNLBlGeQz3DTU="
								"api-go":  "Ozg9RfLGQ7d8Ty8VNm9jPnenB7o4rsvNacY8IxkKRLI="
							}
							code: {
								"openapi-comparison": "zCD8h7tSIugeR9C6Ki8Gfx54/aDuGCFpvB7zeNS7MrI="
							}
							multi_step: {
								hash:       "103704R449QE3N5F55SA9B4MMTP2D04HM14BL3K9MCMC2TG62930===="
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
