package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "ALXGdNzxwqQ9NE0sw+FjxDgoz3QKPUBeYe2965R0yPs="
								"api-go":  "HRwK9FQ0RLbVy7DTIH1sV0Xfz2q285mDueCux9885z0="
							}
							code: {
								"openapi-comparison": "vBpczWM6Ikwky47ztx3Mr91uka0Edjk6/Fow1juWjgE="
							}
							multi_step: {
								hash:       "FE5KEBFAK5NOELQJV7I375TAJR816SJCH8LD0DQ94RTNJMSKHBSG===="
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
