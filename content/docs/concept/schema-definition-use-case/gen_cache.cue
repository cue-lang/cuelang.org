package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "137zc/ICQY4fLrvN7TN2cYkR9btG78RdRWAZ8mb8r2Q="
								"api-go":  "oaGFfNa9T0WCExN8g8pyewH5SZ5pefjEc+RH/0RSL7I="
							}
							code: {
								"openapi-comparison": "9/SJ9x+k6veyle55s5LnSR4zo6lkiTSFvfYlcscQnp0="
							}
							multi_step: {
								hash:       "VDJOOEM2BD9H8G7EUKMP6O0TEUQNLMKS50KM1QJ78RUVPVVDIT1G===="
								scriptHash: "SMNM6DQAANUQN20PR408HEE83BBLJTNFJIV9PRULK2VV0MD01230===="
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
									cmd:      "go get cuelang.org/go@v0.14.0-alpha.1.0.20250704171720-206e82485fae"
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
