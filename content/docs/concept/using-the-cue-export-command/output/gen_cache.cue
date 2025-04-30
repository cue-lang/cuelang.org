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
									"default output":             "PfR9oEBqB2X4omMieENZeZ1fKuSGsw5MSjeBGCcl/yo="
									"stdout yaml":                "YGNUoFeeOsIGWvQwwZKwr4/nk5DcUYSKpRw1tvTUof8="
									"yaml:-":                     "ux5WPOg1fOU2ARE2Z79Q2pu0vVJIah9032A/3lj2rd0="
									"--out cue":                  "K2O4iyadPiFAxRdJjTE7oAsfysYG2UKE+Vm+T5/9++U="
									"--out cue no hidden fields": "yzkDGc16u1rFzFKelE/GJPLMPGz2CUAHBmD8tOGTjWE="
									"--out cue --package foo":    "rkUy9NwLMXJVcI/eCfPQ7/ArDuL4fwzLfaEkY6A2ISc="
									"--escape":                   "5lQ/5u5f1RTBrVVzDDOp7zAKF5awCpsLea5viIKRXio="
								}
								upload: {
									"--outfile data.yml":            "wz5V/XRYxf5SgCAQ/MLkWdo7DWUeTos4cLLXY1OMjzM="
									"--outfile data.txt":            "aMIYbjUWrpOFBLKFmD0sAvJ1zm0zF3C8AaB5I7UbV/Y="
									"--outfile datafile --out json": "L4QOipLRFxH7K9HMt0okn+zstDC1awZhJpNWiOztQbI="
									"--outfile json:datafile":       "RdjItZd0IsjRgk43YeEVyZnCQP0CbpqblNeHyQKu//4="
								}
								multi_step: {
									hash:       "33T6CH2PNH3DGL2UUTC4CHNCL2EJBSPIM16J0JSI3DUK5ONR1F90===="
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
