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
									"main.go":                 "uBdOf4Pmjx0xbBm6e2AELT+I/57wedEMDKTN5Oitark="
									"HIDDEN: required output": "uT9UBqXb6N5d0qAoic+hSln/ckciTQgkFMNjf9/EJsM="
								}
								code: {
									"openinline: evalv2":                  "N4csO18TDQbhT6sKoVsDod5I0GUgvkOaq4/Sjhtpi4Q="
									"openinline: evalv3: broken":          "57wFmWNtDEmk2Yk7/HKWPHBBlm0u1uJnhvxH72OeoB8="
									"openinline: evalv3: with openinline": "hDmgo3HXFpoNqxScybQW4ux+qB2jOiIyzzcnru/QE0w="
								}
								multi_step: {
									hash:       "1K60C3VDVN3N8C4JMQ7AIIGM0ONKM8VI51SUO34VIPCEG31SM7T0===="
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
