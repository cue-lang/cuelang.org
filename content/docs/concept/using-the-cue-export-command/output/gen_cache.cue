package site
{
	content: {
		docs: {
			concept: {
				"using-the-cue-export-command": {
					output: {
						page: {
							cache: {
								code: {
									"default output":             "2Li5fUd2RUVo+d2uILs1X8rXoDjPOYptldf+0hVrlhI="
									"stdout yaml":                "FozCH5tPKDk3RXHa196v6Rfd/cdzVp2sGFxTITA1wCE="
									"yaml:-":                     "8SxBiIJQGeYIWspzL9hMg3HGrLiu/PJJp5EOMGmrozQ="
									"--out cue":                  "2YkfjOKb3x7j5VYM7ciYQQz217w24EkxD0/iKBGNOII="
									"--out cue no hidden fields": "q+x/nYPXNzR4qwbbtP2Qj1Up9iuGmj83ctlH3IavfFA="
									"--out cue --package foo":    "uTOExjqdDKOz4eh5hLOKmD4Oy+nTXJdVSx3bbI+VIkQ="
									"--escape":                   "B9Iu+OLa229i+jWm0rwhXT2ypNr5GevBrjcCao9Ct4E="
								}
								upload: {
									"--outfile data.yml":            "5Z38ePVJyPGb6qE2w3SyFT88RLhc1krwmmlpO6iFBlw="
									"--outfile data.txt":            "7qlONdzYAfkeW2oNhVdDmISAYWN1H1AESGI6Et9Uhpg="
									"--outfile datafile --out json": "0MTCy2uwE2Y8J8+Zh4wAEqw2yv6xGd89KBgDlIJx6zw="
									"--outfile json:datafile":       "nbkSfVpzCTD/H0pHOvg+riEesmTagiZ+Lsd9rwlX3wQ="
								}
								multi_step: {
									hash:       "J7SD7HLT74L2QVSDPM37TOBOENVJSEUFRJDQRJKT9I2CID28NT8G===="
									scriptHash: "TVTCOHK1K6IF54PI4CB62FSIBJMCMB1BAOO6SNBVQ897AIDDN7UG===="
									steps: [{
										doc:      ""
										cmd:      "cue export --outfile data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.yml"
										exitCode: 0
										output: """
												data:
												  value: A string
												  list:
												    - 1
												    - 2

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile data.txt -e data.value"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.txt"
										exitCode: 0
										output: """
												A string

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.txt"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile datafile --out json"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile json:datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
										exitCode: 0
										output:   ""
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
