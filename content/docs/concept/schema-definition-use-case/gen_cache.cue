package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "sZxkHmbxrh/d/FswuXgzjhUbw3X7o9Vap4w4TsrZ8j4="
								"api-go":  "ULhDaOES2JqwgfgeTFJmHytypriAjyiJ5CTpEd9zKHA="
							}
							code: {
								"openapi-comparison": "+XY9K/2WhGrKTKvKDX1GL3/OR71Vju4BwDrd01dzooM="
							}
							multi_step: {
								hash:       "OQ64DO85RQEAOBLU9QH1VM0IKHU9OPN0OD34Q5UOGR35QCLB1TRG===="
								scriptHash: "FMSA8VNI80JJPUFJKL26GFF07M42O81BBI4RQM260511LV7M46H0===="
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
									cmd:      "go get cuelang.org/go@v0.9.1-0.20240612182947-d8742c13dce6"
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
