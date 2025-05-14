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
									"default output":             "kcdIyDwNWGHx+purpGRXmcaJ4qbEZnEd5na3klT1ydQ="
									"stdout yaml":                "kTySXT/LUiSaCXP+RpVO4vDh2Ql4YCqNrBBVD46ZxBk="
									"yaml:-":                     "0LjnBk+iz+sxx4aVPEcptylrCx7MbMMW6Joqrmt6DZU="
									"--out cue":                  "HzwULt4hc/xi0OZHF2KYwk/M3U+kUhTuwgwaRGmrSeE="
									"--out cue no hidden fields": "ZTXgbXvtLn/7njnQEZVlUdvcoU/EaS7/isROF6QreX8="
									"--out cue --package foo":    "hy8HsxyutnH/5YoDIXerP0aZlGDqxFO1Sy0yVsJCtZg="
									"--escape":                   "kFtpVLPftsV4a8dgZ8YizReKN2MbjQLha5nj/J4ymbw="
								}
								upload: {
									"--outfile data.yml":            "ObTtBTHBnB8Tz9EYKFKdVfcTZiL12v31WWtOKq+NELs="
									"--outfile data.txt":            "UJFevgbeUfogKybKB0bQbcK81DivKwEnLfIeKvBYEnU="
									"--outfile datafile --out json": "K3xcSXxlre3EyMG+o11501kXQVGh1GoY1Ea9aIv1rkc="
									"--outfile json:datafile":       "m8Yx74DhyASziV2y65m4m4RRVGHUjC5YCbe7p1XeBtA="
								}
								multi_step: {
									hash:       "S6AMBV20NMIR39MAPNINFDDQCUS398K4AVHG3U7M8HH46IUCLS90===="
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
