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
									"default output":             "gV2Wc3JJqrDhbQXvzG4Ou+1j+BFHbhImFOtR+ksLGqc="
									"stdout yaml":                "mciOirc13iK/C/PjPO0J7b+TlC0TnGqCxbSiicp72D8="
									"yaml:-":                     "JnSB32VR/8zGBS7RERxlD70xo6+n4KTlqi810g/gST0="
									"--out cue":                  "gLRt6nlRxt3NIAkAYz6Sejv9JPA3E1w99P+IF0Vc4jw="
									"--out cue no hidden fields": "VSC6qkF6KI94IEepVHqg9H+jNZrhFi8KiPaV6rBhPPI="
									"--out cue --package foo":    "WGyeLkqkchKXOQPcAVsf8+Yz7gAgDjZ7FYNrPmtHIe4="
									"--escape":                   "azAgZhL2ZvvkxpK6KMnHDHqXsQfcZoRFWhLjgu6lYzg="
								}
								upload: {
									"--outfile data.yml":            "8o1H6cq+CMTTfyGjqvaYHqnRnzvP+9dhuwxluCMx0eU="
									"--outfile data.txt":            "787qG3OM6cWaiTAZugWyuStSwLWrwoRf1Lk48ipoEf0="
									"--outfile datafile --out json": "0Y4YkJK9iTyKwBv2wzq1n46KCiXh5PIv4wDsKq/EqMM="
									"--outfile json:datafile":       "G0a5F3MQqfh6VMm24gw4offCCIecIwE3VV0TFqGO6Ak="
								}
								multi_step: {
									hash:       "U31QCRULQRQECF84VLMSMMASBA8O5DPCLGFCP916UBUGIEPMCKSG===="
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
