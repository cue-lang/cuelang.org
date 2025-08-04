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
									"main.go":                 "DGVpxW5UgbRH/RR9rVcHx7gRxv/C8pIduYQC+gzGyqo="
									"HIDDEN: required output": "a9bMN23SYL7Ft7cSJTg+xZoOtXqsGnD5fKjKnorO+l8="
								}
								multi_step: {
									hash:       "GSNU797SED8PLLVLAS5RS5QKPDU888BPOE0J2CE12NM4TS83BDMG===="
									scriptHash: "L44DGMA06UN0E2HUIR9LPBDLJPBVKE0ISOAGUC0OT8FG7U7O2USG===="
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
												cue version v0.14.0
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
