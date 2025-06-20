package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "Ziso3qm3HWtL+y0HvIGB7RtXua4TJzwoWxzx6895+qY="
								"api-go":  "fmn5D1GPZbleeuo2VFVB//pA0T+HXifH26yU+qvK7kk="
							}
							code: {
								"openapi-comparison": "c7LsSaIkVZJwx5vqETY9/cHb7QxF0lovOQ7AH4udUrg="
							}
							multi_step: {
								hash:       "98V86H1BG23KHPE5LDV6J9632QC21JIQ12U3DVH856RESJ4T1HA0===="
								scriptHash: "9IJEMA8IK8SVA9R477T7J6R7Q0OMQ26FDRT1KMGID7TKM0JV192G===="
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
									cmd:      "go get cuelang.org/go@v0.14.0-0.dev.0.20250620080802-8d463da28a21"
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
