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
									"main.go":                 "athFPPWMmrJDvJYNgOcGPiAG/CGifCRx85ht1V6D41Q="
									"HIDDEN: required output": "d6LhtnRZzBwMy6oEJJDHz7jczdDU4N/z5RdyzmCd9GM="
								}
								code: {
									"openinline: evalv2":                  "KGIR9QrIBMmwgXyys4NNC+ENbBNAgXU5Pv8kOhJTpsw="
									"openinline: evalv3: broken":          "Ch8wFKedDR0xV8A59hj5DZ1mq+MTWQRAznc3Mho1CAw="
									"openinline: evalv3: with openinline": "+iON6/DlozlAuH4b15k1z+bkGyNH/e5rdfFvWypkZfk="
								}
								multi_step: {
									hash:       "0K680I8DL9KIVLSE8VPT81KK5FJ84H7HCOU7NFGMCFJ32PG1VL0G===="
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
