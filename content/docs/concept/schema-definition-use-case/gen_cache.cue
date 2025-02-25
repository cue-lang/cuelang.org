package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "cj/NKyDIY+NOpjKOfUq+T0rO3WPkkxmBhVirkP98XSI="
								"api-go":  "FckhhBEJamNCGXQy9aK56TAv6j7izwyfm6O25/YR2i0="
							}
							code: {
								"openapi-comparison": "PXW6LVLS0a0bfan1Y7Zubi7cGSogzNZLlmeZrm/j8WM="
							}
							multi_step: {
								hash:       "4GKTJJQDEFHGJLE51CPQI9EO2LPS7LDHC9K4246P3L257NOG64AG===="
								scriptHash: "GK2719D2TJ8UKQBRCC89E4BBQERL8R0M4H3U8294FH13A2BLSPOG===="
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
									cmd:      "go get cuelang.org/go@v0.12.0"
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
