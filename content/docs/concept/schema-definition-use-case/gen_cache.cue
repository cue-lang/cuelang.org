package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "w8Va6XIRoHcwOOil1r7dGVwk89muu5/zbI4/pWYnmU8="
								"api-go":  "Gxeywep/XCweSWOax3iLUhGBiVrHLZn+Y9ML8/3W3/Q="
							}
							code: {
								"openapi-comparison": "4FFqehF4Ia94H6tC8gaGE2Q/0YiHMHalTJews9ym+7w="
							}
							multi_step: {
								hash:       "LNO95OAUFNNC0134ROB314M2O66UA8TUK1IL5OJ1LE9EN1MSDJ40===="
								scriptHash: "GHGFNL2CUCEH5QU5VDUH431PSHGG9VPL2D3F4SAELQKKN0HSHLV0===="
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
									cmd:      "go get cuelang.org/go@v0.12.0-0.dev.0.20241208100708-432c1141e6e7"
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
