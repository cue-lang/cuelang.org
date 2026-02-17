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
									"default output":             "skSSynSOrwCZ3m2DywuOQMaPrPxwSLyzDBpoGztasFg="
									"stdout yaml":                "Nnj8I2BWFGFZttnaNXYTKCTv3lE2wTWIsqh8oF+JnAQ="
									"yaml:-":                     "fTPUCbul1wdzCmucAWbkVcOuoz8m8vcv5SUGgwV5iw8="
									"--out cue":                  "tuWizzpQJqbbnoyTgX6DQvl2TGyKIkOo18s1HL4Fh2g="
									"--out cue no hidden fields": "E60FaNOHMoyA6fspKNd/lEer9JLDHnTIXBgXIaIrEj4="
									"--out cue --package foo":    "eVebZYkGhMr7Sg9xBxlE7jvv8ULxmlGJ5WITo553wt4="
									"--escape":                   "SsFw6M/A2Wjc2unPkLsCegfUQu94q2P5MwztzRot7CA="
								}
								upload: {
									"--outfile data.yml":            "GtpULeNjl/YzCZP3iiTMM5UBkH+1EdEGkKXLpyR2E0s="
									"--outfile data.txt":            "WD7kEt8+9KaSbUOp3aZkdYnNVSruBTKAHlYTazdtxFw="
									"--outfile datafile --out json": "FQOIzpxgxGdDVV7bVy7fu1lYBGSH0rmk9kcRTJA6Kiw="
									"--outfile json:datafile":       "2icdnP3mVzBe48W8CcbVE2UvpmfnLpebydRNf3a8CQQ="
								}
								multi_step: {
									hash:       "68PMEHP3AELV3TV2C8IPM005TDUOGL291ASCBILE6TUCH8JMQ5QG===="
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
