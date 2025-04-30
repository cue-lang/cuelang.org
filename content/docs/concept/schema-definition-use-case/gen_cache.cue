package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "dMYkObTJ+KzjnVyPhT4NN/rzDwB5Cdcp0rEvXNT4Tfo="
								"api-go":  "PqCukYyb7PCg703AojT2/UoWZbvPpQZy18VQM66vYCQ="
							}
							code: {
								"openapi-comparison": "15RGbV2gCNRFpi242qWt+rdmepgmLLGHo6/6BH5UKcY="
							}
							multi_step: {
								hash:       "JGDGU6MAK5CPBDBE26DT2D97P6OJ25GDSILJCKU843AJGGOIDI90===="
								scriptHash: "A4Q8OB9NDBEDEMJS9ARDDGHSIAU1H9LQQ9CF6VMJK5UE35AI38BG===="
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
									cmd:      "go get cuelang.org/go@v0.13.0-alpha.4.0.20250430133040-3ba376f34cb6"
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
