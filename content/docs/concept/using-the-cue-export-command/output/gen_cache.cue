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
									"default output":             "2fRKL/tsgOEe1Q9CNZo/0S1oWqgVHUzu4Lmlz0CC3h0="
									"stdout yaml":                "Ep3YKRtLx1AkIkfdzBRRP/i8H1qFSF3RUHc9dAPbT0I="
									"yaml:-":                     "RGdX3HeOOFKqKsoaj2640L300Mml5wEK5J5iX/d1WIE="
									"--out cue":                  "If/cZuZBS1fa4Z5sqrsPBeXsE6+gTtQlrR34Qtba6x8="
									"--out cue no hidden fields": "OBEgqmufOgszE9S3+27FBO1AzSkkOsU6BN46DZcuAR4="
									"--out cue --package foo":    "ZNxoTOIe8wqbTR4CtKozizAmyxW2WlEzNnKCQBA0EMs="
									"--escape":                   "97q/muI5QSFJaNgUzGVmzVodHSc16HL67Si6uQHNnW8="
								}
								upload: {
									"--outfile data.yml":            "t3ZfLLM1deQ7Ix56KYyF/bkV4oBSSKAwPQas/mqkDXM="
									"--outfile data.txt":            "apCMexxNW86oyHdsdsTcC/zASqDZ32m2TWoN/+V9pmU="
									"--outfile datafile --out json": "Co73PkN0aD8lrv1V3VpDDOAUFpSyKjCWflOJe0sQpWw="
									"--outfile json:datafile":       "UtxMJD7erqhjNm4pZZQvQkP9F8b+maT7xRUHwfFWzDc="
								}
								multi_step: {
									hash:       "IS3BO2A00FQ62V5QPLFUU0PJN22H12JBBSCP89AQ4A1SUMS2BCJ0===="
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
