package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "PVnF5HnkYwSyRIG8q2sl9M9wKfyX+xPR+MdDumZX5zA="
								"api-go":  "JwlGPOFRnBiUQFz2qqT4nSizxKti0FPuVo/ch9tPUyU="
							}
							code: {
								"openapi-comparison": "5sPj8LV/hsrdaxB00BmrsL6AFpB7bGoNFyfccD0ONuU="
							}
							multi_step: {
								hash:       "Q4H7NCMSTUKGG23V4LJO4RVSJQOGNT93QFK40UPNI4AN3R5ARS60===="
								scriptHash: "CQA0O6ESTNFJLVQJ8PKEURU1E615CMK26TBOTQTJ5KQS2S1SU1VG===="
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
									cmd:      "go get cuelang.org/go@v0.13.0-alpha.3"
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
