package site
{
	content: {
		docs: {
			concept: {
				faq: {
					"upgrading-from-evalv2-to-evalv3": {
						page: {
							cache: {
								upload: {
									"main.go":                 "SQdSMgbqk3HHrIh/lGyxVGkj7OxMTSd7NaGJxNzP62s="
									"HIDDEN: required output": "WheRFLiiY+71k1/vCrzPS53H/A6okIVQEDMctA3BDTs="
								}
								multi_step: {
									hash:       "VJ1GAOM1VH0LO8SK15L3RFGRFN09BU7TFDSI1OVR0BM1OO6QNTOG===="
									scriptHash: "R3592TOIRF8E83T86OPE9JL2LO00QI4FB0FQN7VAHQG7A25EKNIG===="
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
										doc:      "#ellipsis 0"
										cmd:      "go mod init evalv3.example"
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
										cmd:      "go run main.go >output.got.txt"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff output.want.txt output.got.txt"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.0.0-goreleaser.202609101448
												...

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
}
