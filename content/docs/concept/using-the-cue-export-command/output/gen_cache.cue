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
									"default output":             "jAQCTXf7uSPHJ6tGeMA8ngNKmXbKWJURgOfHqy4ttr4="
									"stdout yaml":                "7cCHzfhw0BSOX6vDCa7BKnHU7/oF3t8j4zJ7fVd8xYY="
									"yaml:-":                     "8iFYyFk8exRROdmzn76i114pJZrChLF07cgHkfl86xA="
									"--out cue":                  "U8yLO832XkZ/A/z5kFgaMKSzNPvWRq8D74j1JUOjBOs="
									"--out cue no hidden fields": "IaOhQgBEcdYnwY//KfjlblOHKFOJwvGsOH7Xltfb/+M="
									"--out cue --package foo":    "UDXDBH7arGBlZ/A5ASZs/VZVX31Jvd3hEqFVpVOtlhc="
									"--escape":                   "3yRu48U/AFpHlmKOgTrJy0K8b9ZVIvhpx+V5Tg+S1Vw="
								}
								upload: {
									"--outfile data.yml":            "oGcM5hMWYrrGz9XHTflBHVmMtncMJI/6cZIAnV/nRD8="
									"--outfile data.txt":            "it9du74pnimF5cYPSkp4te6X50XeIwWbmilAOWJcTNI="
									"--outfile datafile --out json": "aGRodYHP62zwtwgjG9F/ybC9XOmhEC2D1eo+9AhCwgU="
									"--outfile json:datafile":       "dqVyxyA506psaO7wi/wByJ7m2gzFxx3YO0GAQWHsgD4="
								}
								multi_step: {
									hash:       "E465GABC5N4GTGS599E87V755E60HBFLUS9V5424K49A5HAO5US0===="
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
