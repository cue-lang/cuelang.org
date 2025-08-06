package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "hFwzgiEys8tpkyFCF+DUznTv9jkKe8fMoyvMIgHSF8Q="
								"api-go":  "EmKq4UmYihehucXZ/qlI3nKR/cmO/d7p4RdZdvGsY7s="
							}
							code: {
								"openapi-comparison": "zWU4dlwR0AsOTQSXzOzkXUc96TZJS5dykE6HGdeW8/Y="
							}
							multi_step: {
								hash:       "7JPTDGCM8JND2M3HTLI3ADS4ARB6C55L0NU85QUCP0OCQ1M3B3DG===="
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
