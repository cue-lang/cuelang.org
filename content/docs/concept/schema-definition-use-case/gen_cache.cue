package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "pGvnviFh7P3d0USC3yL39Rpi3wyxydPJIuttUQhQmgg="
								"api-go":  "McWlSwl3KrI6Pw1vpjcwiClCg81cVZCXx+/uoGGGEtg="
							}
							code: {
								"openapi-comparison": "xibhwvG6lESomRwKKdgHraYV2aiV4Ff7qQk3FqRmsKw="
							}
							multi_step: {
								hash:       "F6VGH5JNLLHFA90CM85FA2Q5HQJK2TGQT1E64V159J2SU3V20KLG===="
								scriptHash: "FB88URJ4GS2AP1BUSJ4J01F8UN9LKE9K14K8FN5B4CGSPTHT06JG===="
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
									cmd:      "go get cuelang.org/go@v0.14.0"
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
