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
									"main.go":                 "hkPaCeuLKw2LjBSn3jBhvlL4cZnbyfIdG4MbZPa0wxI="
									"HIDDEN: required output": "EYXKGIQOANzPwgJcePzlkmCRfEzghQJk8E9w5PLLDto="
								}
								code: {
									"openinline: evalv2":                  "Fxo+BCJ9BZYFkxN8sPGy34fguJ/x3fzj+RYeJI7rOGQ="
									"openinline: evalv3: broken":          "bxQhWDFBPnbVgjYe1nVsJ/POi26qlJHEdQbvMFZCDJM="
									"openinline: evalv3: with openinline": "IYUdUDzmSVJFocEWFX6wzMa1HZxWQ3PjNPEXZ8lXjIQ="
								}
								multi_step: {
									hash:       "38RBK38DD4UAJ3SS1U3QQD5GOAJ1FD1QIG8P26H4ANGCSTO6LLKG===="
									scriptHash: "KA0TB7AGE97NH9M1904MEG37VEOGT5VOVI5IFBG76ARIOSFI0ECG===="
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
