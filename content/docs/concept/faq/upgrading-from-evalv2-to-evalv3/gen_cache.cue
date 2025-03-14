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
									"main.go":                 "5gqVjQM2e/D34bpPbKuWdnwDDTrTzJtQ0H8WKWPgRmY="
									"HIDDEN: required output": "d7EWw1iIEOhZWRLqm7cvbHWi4I0wzI/HXQWxAIFmzmU="
								}
								code: {
									"openinline: evalv2":                  "4KAr9cUPDaEnfjck7qCcwYwoGogAcydD7T1HDGmgyhg="
									"openinline: evalv3: broken":          "9IWslz8NGQOpK+diB0DXCsizJvKticvh3LQB81Lh3dY="
									"openinline: evalv3: with openinline": "swtWrx39MjlvY1n+y+jkkP1nGl/H7TjPP6zcZCWRHyI="
								}
								multi_step: {
									hash:       "LT9825E1JPTEGKAS4C2K4755PDNU8DHII8KGQ7HLQIVBAQN4LH1G===="
									scriptHash: "BJ46KNJFGBS2SL251SBDIMKK8EQD5QGU255AHQLSJK08PO0SLNIG===="
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
												cue version v0.12.0
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
