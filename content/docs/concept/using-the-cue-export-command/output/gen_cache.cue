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
									"default output":             "eRFs30/S2l7gAcxWO9D2tnWejRFaXi6pxoUdxmzczIU="
									"stdout yaml":                "8C68n7RtVAOYDiFE0RA16jKV34afibhOJEGsPiKUruk="
									"yaml:-":                     "wVmc6AIcG4s67VGcwEMiTtYHNu/wRis671MCHxyqDOc="
									"--out cue":                  "zpWeDeEtY6Os4L5ChpjYDB1JRfXHesqX8tJY8b0daEU="
									"--out cue no hidden fields": "4NEOlkCGqzJF4Ox/gqVKLHq4B3hq00aqV/UlPLONSX8="
									"--out cue --package foo":    "p6Tg6UIrzHAPld86oDVyxs7f7w5EGmgpYvyr6sOMfiw="
									"--escape":                   "KlIz7o0uP92OLy/zd2r1pAvHKqL1MZDyHxWL+4l+LzE="
								}
								upload: {
									"--outfile data.yml":            "FakmTt1+g9KzV4Q9FXX7Fu8J27lFcYFKJiNw2FSrTiQ="
									"--outfile data.txt":            "eyDNyE9DShb157WcX/7o6ABoFvbJV74voLXHJ/JVhDQ="
									"--outfile datafile --out json": "Sv7n/E8OcKbuSHWQbWkPN+8T5VoTQW8pUqmg6hi9iKM="
									"--outfile json:datafile":       "po05VHFNpGde+8m9hY3IG1aoKEkesHc14yHJKX7D7Tw="
								}
								multi_step: {
									hash:       "QVKA613UT6H0D8JHL8QDH6VLCNBMMRP7CRJ9BITUEPFJR15JDVJG===="
									scriptHash: "L3L2DKT4LCBOMUFUINT11UNJ16TU1DRUIO6VISUNUVFMT2O7KFM0===="
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
