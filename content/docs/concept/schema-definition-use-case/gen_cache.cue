package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "wvFbNozx0x5USli1SYMkmxv7t3ZyEixF/afQ2Pgy0qg="
								"api-go":  "AUyFIUxsda1UVMZaqKXEQnS2/P/A9gcL+Y71SD24fME="
							}
							code: {
								"openapi-comparison": "VSFmqgzsIJUMx3GP5e9B+9xEyoIDQmO9gt8IMAr7uHU="
							}
							multi_step: {
								hash:       "QN6KTNEMJK23VFIKROPORDIO1R5V588FPAK2197A9223JS1Q4Q4G===="
								scriptHash: "KQ8CCFEUVAOBTAG2ED81C1H63N0RK6N20677UHFB8FC4GKDLVQI0===="
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
									cmd:      "go get cuelang.org/go@v0.19.0-0.dev.0.20261119142547-4feb85fac20e"
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
