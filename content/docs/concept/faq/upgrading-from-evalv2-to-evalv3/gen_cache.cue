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
									"main.go":                 "OVtw3nlzIwhALeaU5eBnv6F/rgaWQChm4ZeOXIY6Wew="
									"HIDDEN: required output": "FoMoxyX6dZJLNbtVPVHSa7qw49bd+597zeDcenb/Wm4="
								}
								code: {
									"openinline: evalv2":                  "tw6hPV3wyd2eEGXoc/FVATJCrpNRc2zQ9X2unpqjPXo="
									"openinline: evalv3: broken":          "qI9hI7b8Tl71CmyHu2Z7rNcK6jlm30BxA4CoSAlxAEs="
									"openinline: evalv3: with openinline": "1QljoeE/0/qHNw2PqZSsyGMg6hvWuUcfkVntoC+nABk="
								}
								multi_step: {
									hash:       "68N1C9GOCE315KUU0A6ONGVPJ1OC9Q49UHNI61SJ76JST3E256EG===="
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
												cue version v0.13.0-alpha.1.0.20250314174817-9e333c606194
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
