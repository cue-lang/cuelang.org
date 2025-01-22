package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "RRRzNGuZjhR0lrdPh6VN3fnbhXve/PkMdzIlgqIm4Ts="
								"api-go":  "JG2GmbY9CD5r1rkCoF/VQ++5QorQI7mk+irXNXkwKIQ="
							}
							code: {
								"openapi-comparison": "DkMa24Z6BuIxxiOyOXYI8xTuBxzX97Go5PqfyJOLTyM="
							}
							multi_step: {
								hash:       "ATMITPJG9JU1VTJ0CSJDLGNKLDO0LNLGJVO9FQDP0ALA5UQJL19G===="
								scriptHash: "BRC7NEO0591GKSDLDO8RRDC9GGT3IKN4CPGS6PQJQMBRP6Q7DFQ0===="
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
									cmd:      "go get cuelang.org/go@v0.11.2"
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
