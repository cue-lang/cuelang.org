package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "/u9u22xFFe18CIAzsZifqGJPRCZE/7cwWhNmf+KLbeM="
								"api-go":  "6yvsmlh8q4SA0pWP4G4C9mDfV3xLqpj3MvQBXFWKIOA="
							}
							code: {
								"openapi-comparison": "iNTz+btyK3/9INcmNNFFsyGgxXW3IoWfHVS8lnMMbFs="
							}
							multi_step: {
								hash:       "EGU0O9TGPM2TN5TA70CVIQ5KCHBP3G66QQCQ0FC80JDNRTO7LR80===="
								scriptHash: "B31EQKFISU1QUC9IAHGJ2Q0JUF8UPBRVP410QUPDFVVJAAQENG80===="
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
									cmd:      "go get cuelang.org/go@v0.18.0-alpha.2.0.20260918143709-50e1f64b6460"
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
