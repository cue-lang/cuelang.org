package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "uoP1sojkohWrfpjF2sKQTbDdSl4L8/51kgkN1kOmfkk="
								"api-go":  "BBayB1azfakO12SaaG0JolxeJCe9hmh2FH2FPoqMdDo="
							}
							code: {
								"openapi-comparison": "5HJHxiovIs6mNNXvNrq/6WaOaKj5ujDrmXXFjPfeINQ="
							}
							multi_step: {
								hash:       "T6S804IAEGPRI03EO8AGKVTSTPCJST4UMPI6RLUBA9EU8BC2QV2G===="
								scriptHash: "9CEDH0AR3TPT61MSL1VJCTDLC78469GV9IVC3KLGNS9ODKIC98LG===="
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
									cmd:      "go get cuelang.org/go@v0.11.0-alpha.3.0.20241017110013-860906a7f025"
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
