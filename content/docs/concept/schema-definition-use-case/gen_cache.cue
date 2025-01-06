package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "fIGg8THknNbR37K1pMcZ6gE5D4XYNVvgJLK2pASwq7M="
								"api-go":  "xp78f3l/njYSxPKYK/wltwMlSMN1FyMQY3Ryy0yeY4c="
							}
							code: {
								"openapi-comparison": "5Gs9rSNiJeaK+JzHQuyd/E3qQ1HAhYJzRsV2nOHInV8="
							}
							multi_step: {
								hash:       "DNGNQ5HKD2Q3VS04Q0QV1VR2654GIOTU2GODT1RHGVPS0MKCJ070===="
								scriptHash: "OGUD28EMJ9EADE87I2NPURDMMD0F8GJ4P1L9QRFGFGQJB6QO94IG===="
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
									cmd:      "go get cuelang.org/go@v0.11.1"
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
