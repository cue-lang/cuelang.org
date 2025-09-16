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
									"default output":             "AdTkuk6PRnEXt0tH23VX7OttkBW12Hx2NClzsC6sczc="
									"stdout yaml":                "3srdremy8fXTSpnfrPtnRqg0uasBCpu8WvuDpGs/pTs="
									"yaml:-":                     "xf3vdQo7boDfvm5mv3QkdnhsgtSFD3G9IY2YN/faY0w="
									"--out cue":                  "eResI9Pa5501ycs64f8X2+ZuE0juto43xG+/sxPUugQ="
									"--out cue no hidden fields": "nRToArQvdazbUQwiYH6cxYN3x2nGHAhG1u3BgRdiJ8U="
									"--out cue --package foo":    "iB79AqRwtQbO6Jo0zD9rBz2fHnNQ5+QZrFKGcRnv9Hw="
									"--escape":                   "x92/A/JxLFEovm9MJJS0RANL1InN+wQ87/m2WZl1Y/I="
								}
								upload: {
									"--outfile data.yml":            "fZ+ev8s9vjTrdZjkqckqW1TsKDvFCemx4BoFJKBYEpk="
									"--outfile data.txt":            "HAjPpSriqTGCv+1mo5P6hSLCRAX7mleIpNGA7i3WOWU="
									"--outfile datafile --out json": "hZdArM0JsZQR5stdZLNpdMKy2NItdG08q3YfzC3lB/E="
									"--outfile json:datafile":       "ZlDZ58FuIH/x2c8Rh7PRzaovAGrsjN3zDx+l33uM0g4="
								}
								multi_step: {
									hash:       "HVQ46QG9VLV6U2O9UDCMOAS23A6QES92RTKC8KLU74HBG9HIKVM0===="
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
