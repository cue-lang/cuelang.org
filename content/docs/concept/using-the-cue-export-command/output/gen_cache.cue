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
									"default output":             "Nw+3ljy++f/LixaHvuggx/kzvhyhWjj8SjwldrjbgQQ="
									"stdout yaml":                "M4+OLrNIYbk4o461aOiEnG9+MhtKxsHel8RfOJSxP2Y="
									"yaml:-":                     "tASR+I/X3gE5PcDP5N4J7mHZaVmKlTE5W9BnXsVfKdQ="
									"--out cue":                  "O9O3ChlPct7RuTl66KOdbV4FxnQU713BlaZSn+zwD8U="
									"--out cue no hidden fields": "MJzX9kAMD7WfNmuUXB6ES7dsMO7ePjHooqjqBGmrqYQ="
									"--out cue --package foo":    "fp13NSP1fhDdubfPGvjU3KozXjc6G+hwOvAwn0mEc1M="
									"--escape":                   "FAnPDxc8sf84HMVNAAhI//R3s/icN/Uv95oBdrfjbf8="
								}
								upload: {
									"--outfile data.yml":            "b1PE8DmxBSuXlXYGjTFtD83cJne0rSChFJlx0uuuHJo="
									"--outfile data.txt":            "vzMM2yzWA1DJs8436AzOD8wEa3KpibGG2ubhO4iNS18="
									"--outfile datafile --out json": "4Pxs87zLp9NCH1Ok5iyvhiHNQrvMU8cOeLWwI2s4c5U="
									"--outfile json:datafile":       "4c4BKVMK10omtIwh1ZZYB7ESrt8sYOCeaFdj9Et3vMY="
								}
								multi_step: {
									hash:       "U1Q449FIT702FI28M04G76LNP1O7L719FOPBJ864A78SCNGQ8HBG===="
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
