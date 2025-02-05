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
									"default output":             "wDSHRBqAGdBwUxBkBQjYGr1I69ZFHuJITHVGhHVgn0w="
									"stdout yaml":                "IbfEkWxRYMD2307NAsoWV4tjrbroJTCsQsm0yX++vYo="
									"yaml:-":                     "F0kBR2poypOhVmkFaBz7iDr9+IY6M8KMFcWD9mX5kDI="
									"--out cue":                  "aka7X3T52msCC3Dj6N3+RMOoLOUDBrRoROWr8Hnfcqs="
									"--out cue no hidden fields": "S6A0qVLNtNZVDMBOoZ2EGQB/clkvi0HWMob2xGEwc/c="
									"--out cue --package foo":    "JqZ+HboCXj8Z/WUOQzhSNmB5QpantfiTBFdAivguGwg="
									"--escape":                   "GexSRKTPvzFoO4+l1n/iOZfTVVREYXnLQElN2jOWhnI="
								}
								upload: {
									"--outfile data.yml":            "2mGe8xwTCjHWFwj5WMiICQbBNMMVRhkt38AqP8Sgk1c="
									"--outfile data.txt":            "mhoz5qvPAE66+mX6YYooq9zzEIO+iZ0yJfT5/aQXtKk="
									"--outfile datafile --out json": "5YLPEqKch8k7BJTFU2bV7CmDo2/TBhZ1tTKzlhG7bN4="
									"--outfile json:datafile":       "c6fY8sin4rrh2jgBj0xHI+iUKwweOksHCO31huNsArc="
								}
								multi_step: {
									hash:       "3QETA6CMVF9OPC2KE50GICKRC655K241U5S9M3T7IV80OB0339GG===="
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
