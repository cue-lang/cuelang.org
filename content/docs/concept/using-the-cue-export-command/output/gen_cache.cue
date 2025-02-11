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
									"default output":             "8a9ET0r7BTm+iUQDdvJVOZuK07KKABOv+I6ala6NeSw="
									"stdout yaml":                "s3QtQTVKz4WORIlzgkjQJN4cq7XQQVrbQYPaLQDgtRk="
									"yaml:-":                     "PcOB347T2OBNyKTEBifPp1ME2qhwL1A7iO+5JoB1dwU="
									"--out cue":                  "RGjWDYCnsO4SuKyWtaVIGC8WmiasaV7xWdjtIe4RsLQ="
									"--out cue no hidden fields": "p6L9uS3wXqIbtEQxrYQnspzvtsGILWbP0QKPgJjl1Ms="
									"--out cue --package foo":    "X2yPPkfO/mLHiDVsbcNnpIEjlgWVqRPSn734ccwjF0g="
									"--escape":                   "hzYB6p/i+BuHIjAtZJX78KvYcdh+LtKutYOsMsCn9XM="
								}
								upload: {
									"--outfile data.yml":            "rWcfTeVq+ymgNK3yl0MYyeoCCngy33xTIngueEQM2ZQ="
									"--outfile data.txt":            "Qi/T7n5+cMzA+xA1/XE+cae5341yKdcT93W5VpTsrRo="
									"--outfile datafile --out json": "01eC+E8pbbtA871iIPrYsr5CYeDJH3Fn79I+p8dr4Jk="
									"--outfile json:datafile":       "K46t2xU0pwvQyWmmMe+7DplkG5OICVwMYfUUkSz2feM="
								}
								multi_step: {
									hash:       "98EQ4UOQQCR59CI19C8MM9CCBVRV6F2LR4HFTB5GCUE068K85P5G===="
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
