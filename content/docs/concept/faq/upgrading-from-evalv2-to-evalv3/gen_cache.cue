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
									"main.go":                 "qNhRDul3pzMRWdxZQ/EzNelm3jgdk78hIaUVRIJdA30="
									"HIDDEN: required output": "UU0sNWEK+ZSAysU8Inhc9wea2PvQVpwh9EmkFI1urUQ="
								}
								code: {
									"openinline: evalv2":                  "A41Ny3qR7TLEI+4BLuKZRuzOo0iuhYuqKdnmZ4AHSxw="
									"openinline: evalv3: broken":          "DYVbyQbf8LpkFfAYQTmFod1HFM/ejhkXogUwWuhmMjc="
									"openinline: evalv3: with openinline": "VsVdW2i0NE1IcYlgVA5z6Ro30w/iaHasPZRiH6Tkljg="
								}
								multi_step: {
									hash:       "PUTSKSL06MSCJECKIEF6JFOM3543G8GRGOM7Q4Q5602C38QEJS3G===="
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
												cue version v0.13.0-0.dev.0.20250310212608-931fecbeb96f
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
