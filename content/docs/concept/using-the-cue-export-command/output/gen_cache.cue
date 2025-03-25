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
									"default output":             "9a4yd4sVvO0HjY2MMc/qRQHUAA04yfvnjb6OXHxXVpo="
									"stdout yaml":                "yymjv9eIS7EbebQCT/PePt22SQtRoEcqKQZb5KTGk/U="
									"yaml:-":                     "liMxqdza+Y69y3KNECj+AQ67EUHXJJSCT4iJbf0IYgk="
									"--out cue":                  "QYeg5tkubRt+arYmPsiob2TYd9Xbbr8l0/qw2UYu7As="
									"--out cue no hidden fields": "eZ8abNI47K68RGZrqQzfEii+nbOSwhXsPulVTYjDuiU="
									"--out cue --package foo":    "sZ7HEHxD4qXBRkL7tV3qyKi8pYhOTVFNH9jpnd7kJl0="
									"--escape":                   "lpGaiF1z7dMuapwLiVTWUPJuA3XaqBuXuOE0svZLVB0="
								}
								upload: {
									"--outfile data.yml":            "sikoUZwJdgPsh0Oy/pIbi0ViXpMLydKZGdNVsNeT3ys="
									"--outfile data.txt":            "K6n6ScNmx2OIgLR9Q7G07x3QwYnvT2mqyJeQpmBl4l0="
									"--outfile datafile --out json": "2y34sUYkxOCnb0ZIxW23uCglodYXWO/W6lcgeXoT23Y="
									"--outfile json:datafile":       "JNiNBXdf0e9LXx5LUkNWsiACtvyriYD+xq2OeWNHUkg="
								}
								multi_step: {
									hash:       "IFQJKIN3OJF9CDG2UOUAIBI0F6J9FUL1F5893SMVJ1CJ56P5P3K0===="
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
