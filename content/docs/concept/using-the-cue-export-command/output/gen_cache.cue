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
									"default output":             "bz5jo3NhUD1QvIxca6xkmrCGCOO9kiXz0nG23hyS+nU="
									"stdout yaml":                "HUNJtur+GjYiSZiZZEWnntVGbrGZJ3KuNTVVmDsE6VI="
									"yaml:-":                     "ZkDH3mDPG3V7TwIWAhtjXzjxJpGS5uAtbK+UCrEdiMc="
									"--out cue":                  "BY8u/oIK19ExERUAzsy7/0t6TyrkTn2tSTsAZeFm1RY="
									"--out cue no hidden fields": "uphG21OQufPtHbdctOUT4YIiovq+9Ov548eR66M02lU="
									"--out cue --package foo":    "X/B2+ohIDmShNcGn62fRzcmCo/tdFLaGRoKJaZY+1dw="
									"--escape":                   "3v76YT9nJwYYU35U/cD50vdOd04CodVucWLBQB9GAbw="
								}
								upload: {
									"--outfile data.yml":            "1ovuw5+jTacUq22DuekKpKyyJ5w6tkSZn6w8QJkHGoI="
									"--outfile data.txt":            "zWiCaOh/iQBKSlcXqlyIOzW4NdvGxmaTQhTrNuHETKU="
									"--outfile datafile --out json": "TJij+P7UHjl6YPlJKnLOMTswglW/2iOKsG2pWHXiKps="
									"--outfile json:datafile":       "F32tVKw1vgqZLsZnyZ20NmF4HZMO+yxXCrJRoy5kH6c="
								}
								multi_step: {
									hash:       "VVNT389N1H7U0K55DOJFGSUCKSDLMOD5FD7RO14V3B666TACV82G===="
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
