package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "qenRu6zJcndd5ppQcffJe3HDAXtqAWjyj5TFCE0lhJ4="
								"api-go":  "bOCH6BQsG6BBHQwz3Sa5ZoGAHRXhNYkYmoBmNdncG6Q="
							}
							code: {
								"openapi-comparison": "Rho9vV5q9NZGDRK3mJn4Qp30s6QUtCILReILL2zXK00="
							}
							multi_step: {
								hash:       "H1FFCNVAM0AR93RRD9LSHQ7E3JRA1Q6RNRKG6MI8V3BDHFGFG120===="
								scriptHash: "JDDTJ66I0ELT74GE0MBP69SU8QOURTENLK834EGSDELD19BF8B6G===="
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
									cmd:      "go get cuelang.org/go@v0.10.0-rc.1.0.20240814100303-dc3ba30322ca"
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
