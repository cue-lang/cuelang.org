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
									"main.go":                 "Hc8ePdsoEPmmKuTe1mijSZuFn28X5oVP0GBvaTuxzeU="
									"HIDDEN: required output": "7H+APjjmRlVosaHUGjfhOvjRsqGAlsjvOKvLSQwnaX8="
								}
								multi_step: {
									hash:       "08VF5OEQEO8HHMPVU72GHORD57QMLJR0VN80Q94MNQ2BKE6QTL5G===="
									scriptHash: "BSMBNIS6L7N6E2EJ0NMF1784GJN9VAEF9OH2T0EL2HP2H466MR10===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.13.0-rc.1:$PATH"
										exitCode: 0
										output:   ""
									}, {
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
												cue version v0.13.0-rc.1
												...

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
}
