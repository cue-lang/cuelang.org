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
									"default output":             "Mj6Bpc7LQRrNhxNZqb6ktQ4U1cIen3xM4jIqRSjyacQ="
									"stdout yaml":                "FwSTARvWeYcogFWOGfN1kOiCJekiu9ZoEr7ykkTqB0c="
									"yaml:-":                     "A0puvszDqjGOiLvTfceyex4leod9+l1HwuK3JE8W/j0="
									"--out cue":                  "LLNmOrq4nD8lB5T/F9I6HgoRsC12nOrFc4nHOETTRcY="
									"--out cue no hidden fields": "i/yUgGOgvr6ae0R1VdN3t0UEUND9YFCe1U4lB90Yd4w="
									"--out cue --package foo":    "MrBg0/+EZ8c6SxPx/2QTpcJ0nRq2uziMcaOSTcVva2M="
									"--escape":                   "ish2QWiCdlIfipa5+yf8RdjaZmuJICDUlbQ5SVhhhTo="
								}
								upload: {
									"--outfile data.yml":            "jHu+JZuZpkGO9eH05sJResgdDphvzdRtBGOHLGKcn4E="
									"--outfile data.txt":            "1vEI2SJQqgRrePMTxDQaxPHZ/lRC7+RgQ5JkPoqJV9s="
									"--outfile datafile --out json": "JnCLASmz2qLmCCGvA2Z8CkGyQ8R7cs+TycqtMpaz4Uk="
									"--outfile json:datafile":       "QBWHjIuOwi1rv2pHidXvY54TF4r3vdE9prDXkyRnFxU="
								}
								multi_step: {
									hash:       "8K6DA44NVF4QLKGFSC38MGMMM9L0L5J7T90V1ASP84IA822CF8L0===="
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
