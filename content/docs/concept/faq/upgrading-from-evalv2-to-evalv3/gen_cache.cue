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
									"main.go":                 "y2fO1KIX2kGKgdUjjW3CDcQQulMXOVksp6Q83A+Hs80="
									"HIDDEN: required output": "EeFZqDF5TqK8mUCEbn0pMf74WUxrV/WF/gmmja97GjQ="
								}
								code: {
									"openinline: evalv2":                  "IDsak86h3Gaa3qen7fYcxPGdIJghekxACzY2UWCH2A0="
									"openinline: evalv3: broken":          "wY8lpKlPBbooCEcaAokopwwrcFGwvLi4mmFUKAgXmOA="
									"openinline: evalv3: with openinline": "NHRiitxeVhwxhxbTuzajTmwTjnK1NF1F6OKH+Vp4kuc="
								}
								multi_step: {
									hash:       "LU7FC5PRO0Q0N3VTD1IM2MPLRH37CTMT8V969HJJ9Q1D8JICCJE0===="
									scriptHash: "7QI7AIV1P7DSMFOFFNQNI80A1MPH7LT100S8Q6IFTE5T590HHA6G===="
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
										cmd:      "go run main.go >output.got"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff output.want output.got"
										exitCode: 0
										output:   ""
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
