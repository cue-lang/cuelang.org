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
									"default output":             "qUFVDOwA6a53vI8bLw+DuR9WYBb5/qNjmueXCg9cwoo="
									"stdout yaml":                "8Y8b6TLBK3Dbeeq3aSlUDyqz5Tfh4M0klwH4kwcQTWA="
									"yaml:-":                     "b9vmirYbWD7p4Vp3nkdJXgFLEGgFMEuVtPAY7eZylvI="
									"--out cue":                  "fRjjtLNLJW9LAnIMFIB4ICi0Jkzlyk6/Gy9klyuF1QE="
									"--out cue no hidden fields": "G4it6/vlmzXuLppP7S9UxHwVmGtnN/v4pgJBT21mDs8="
									"--out cue --package foo":    "ZKCT/PjcSJv80TcUtZE10/7G74Vsat06wgjb2Qull4s="
									"--escape":                   "WJwQ0cy02vkuU1SC5QcTgG7+v7IiNiyp4oHRx2k95C4="
								}
								upload: {
									"--outfile data.yml":            "+pZQlLj/9neTZvdJrlWUacD52GHElX62fTnSAp/m6NQ="
									"--outfile data.txt":            "o2A8pVo22IryZdv9dqFQGjHcrVHJ+QRZIfyaNvEuCx8="
									"--outfile datafile --out json": "lJ4eOkidQxheyTjcMIWXvmMXffJt09sODrn556WA66A="
									"--outfile json:datafile":       "q8iPw6x4ZV8LY70KkBtYBV7k+Y/tjk7EKEVVh9H/aEA="
								}
								multi_step: {
									hash:       "TN9LDS3QSL0SGTHJ92QTCMEB973DVAMHACDBBITS18EB6EN25LF0===="
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
