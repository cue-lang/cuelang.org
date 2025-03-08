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
									"main.go":                 "XnREwVGoyKFXEoWrXwDFyQ4xpOJr8xxtQU0PLdtN9Jc="
									"HIDDEN: required output": "j56GyrnaRoEd/e7kzji25K0ShXKWFOatWW/W0BXxjRo="
								}
								code: {
									"openinline: evalv2":                  "2tKbPUL+CR0RIWCsx0o96rtuFt8VbJ82Ci0uN+K/SyQ="
									"openinline: evalv3: broken":          "1Nrqsa30oAhq7rj1v5JpQOfGyC1nHcQAGsDzqp5PYPY="
									"openinline: evalv3: with openinline": "ApmFPANHCOUZkZMkMUIZOwJ8ufUOrPHkGfzUQ6+HGh4="
								}
								multi_step: {
									hash:       "L6I0T4KUFVLEFQ5PKGF9NBNNH591R3TTMUFGGCUKP9NG800F6T7G===="
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
