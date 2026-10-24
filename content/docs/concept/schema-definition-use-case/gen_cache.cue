package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "Ao4NJPeJg43tz0zwgnfIdJzhTCwc8UihhunKKlrBc+I="
								"api-go":  "p6QpVpt/+pqLJJ7Jt6vLZCmI8dUCbpyVfmk6Egs6luo="
							}
							code: {
								"openapi-comparison": "12rsEBZhOImPnUZUBK9sQUwKG2BVlACeadozTfTpg0c="
							}
							multi_step: {
								hash:       "KBIPMJGE1198J9FF634TLDCSRN8KFF6KLNCUP6TLI0TSSL2EF1T0===="
								scriptHash: "2VMM5LI1UFSGIBIMDMV7QLK53NC7T3I926AS4DDURE9AQL3KIL4G===="
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
									cmd:      "go get cuelang.org/go@v0.18.0-rc.1.0.20261023142911-c9393fa32ac5"
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
