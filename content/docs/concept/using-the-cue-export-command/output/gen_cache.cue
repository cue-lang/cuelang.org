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
									"default output":             "dmaivdl2ketNcN4cd2Q0hEF4cZIPJOyLJBphMt99rT4="
									"stdout yaml":                "Ok3XzqlU5SWPXMAlpyeQdV3gq2+QzTSrgB3l2CmDTF4="
									"yaml:-":                     "toGfoXvP8puAI9E8U08wPSVbFBYrKoHXhvUyWwmXs1s="
									"--out cue":                  "meIMtONJUHQYgWNRfFxCl0Qn494NNbQDxi+/tn/Y2Js="
									"--out cue no hidden fields": "cANfhRFmfScF6bs8tpGC5xBqnGnhuo9f/S1Vdv4jYO8="
									"--out cue --package foo":    "JSAO2CtWBo79L4E7dkys6qhx7yKeWqDI3e2PO55QX2s="
									"--escape":                   "sUqlrak/FKctC/IoaABz9LQ1hCIpbgReDmb+40JtpuA="
								}
								upload: {
									"--outfile data.yml":            "IODxpGE79VrzLNG6MdRLdfMEAwpTeaw7qr4FQrVcjk4="
									"--outfile data.txt":            "pwF8BB5rLV1DmCWPXu4A7+Zf4CbSAe8odh+xqP0PMWk="
									"--outfile datafile --out json": "6h9CyO8tfwGZs3Y0mUdW9uPPgrnkQXO3iHzFp0m3A9Y="
									"--outfile json:datafile":       "k2ahzuoKVNP0wh7grCXx/RpybQ71gPFOos+4b99tAaQ="
								}
								multi_step: {
									hash:       "9VNBVPQ3PIE4AKP3TT8JB0IIBPELVGLRL012QDUDS8LJAMOCV27G===="
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
