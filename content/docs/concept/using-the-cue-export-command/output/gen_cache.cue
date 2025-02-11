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
									"default output":             "VHVwIIvUpacS/exesaHbM8ZvCKA9uckAMO/7oU9c48E="
									"stdout yaml":                "A8wDq2VdJORC3hPb7qdYuNaREgw8dYdch65pYCtsA3c="
									"yaml:-":                     "R+tzjPsbphsm9q3fMv42ZdUuO31ixC+AZvtG862fipQ="
									"--out cue":                  "TJ2xJHfG4OufOrqWuO+OOfYzYdPuHskCoCJZqL1Q0aE="
									"--out cue no hidden fields": "uBEw1GbmsAkvM9Ja3HgqfE9/TLd1MPAoDT5RcmJKFsc="
									"--out cue --package foo":    "rPkR86JOdUNFYMgI/UjF5oC3OZmBGnwTxLKW6Z/8Giw="
									"--escape":                   "DMJxSVVz/XpOh71ukU9ggGOnzfiVNhlLEOkrl/cyQd8="
								}
								upload: {
									"--outfile data.yml":            "SJoqG9Ulsv6Y14O+USF3plg+WPekVgNoIpiqOMMXg+g="
									"--outfile data.txt":            "TV21nYXZavOp89aze9UC4G1aHMPPMrZ1RGZxdMSCxYA="
									"--outfile datafile --out json": "FKGqVWWnxISFujIiypEhMIC0bhvJJ3UmocYf/7DGCno="
									"--outfile json:datafile":       "ZHLQz+ldEbETLZ7jFBu2tI+Dha8X+K1bB7k72StZ5Pc="
								}
								multi_step: {
									hash:       "E3GOI0TCDDPNPDVNN71RPOPEHIGTM7Q18UQC3C7CN8OCTOE5UHH0===="
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
