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
									"main.go":                 "GOthW6Xx0e+afFR2kpPyznX1CPh5qasvlnxcWSDh4Dw="
									"HIDDEN: required output": "aebeBcIunHzDCx2lK7V2e/ZCJgV62Zx/hJIppv4W+Zc="
								}
								code: {
									"openinline: evalv2":                  "KkjWw8pMW6rwfvBfY4JhmM7iIgyxx7r342SVgSo3u0M="
									"openinline: evalv3: broken":          "j1qP7e9UQ6LjNVWQ6T8OdDaScou1rX9nlzJ5dP6Sm7g="
									"openinline: evalv3: with openinline": "P/kSa1GjT5Bfc6jq4oOvnhLvab2jJ9gqPY3VcV0y8Pc="
								}
								multi_step: {
									hash:       "LA0A6CICVEMCBS67KQCCHTSCS9PF4CCIMED4U10M37CNELGC0U6G===="
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
												cue version v0.13.0-0.dev.0.20250306134408-5d2da079a295
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
