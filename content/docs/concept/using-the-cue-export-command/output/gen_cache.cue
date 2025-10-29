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
									"default output":             "f8Cnen4+yLHceDGLnXxCGQ2JJPxevOLJ71G0OcLEft4="
									"stdout yaml":                "61OSv/24Wv72XQCDGco3mESUO4nzl55yhNbJNcuFEXg="
									"yaml:-":                     "9NJSSf+dRo4J92Xs6wXhfX8gYJfvmhRYd2FnFZgwC6E="
									"--out cue":                  "JxvuX5SO3Ob4wc4o7W1qEGoh65pucobJj/pBKnTExlo="
									"--out cue no hidden fields": "+HgNDKIA75+FMunAVSXIhKcXraW5vc2kZJecgZCeGac="
									"--out cue --package foo":    "U2WiMEUVqDpIehWN/CVwH9gIvgI7PF8EeP9giLTZXlE="
									"--escape":                   "BkrNf8fsQsIRXaAm6PiGI5nojpZ3DfdlfPQxbxpOOPM="
								}
								upload: {
									"--outfile data.yml":            "eE8lmAn1O7LSVtSU47zonOeg2dsPN7QQoV0O3iQeUuQ="
									"--outfile data.txt":            "I3Os076BDdzKmnjnhyRHRPK1yilyCkaAs+ilshmFs7s="
									"--outfile datafile --out json": "PoBZ8sBzkSqIc9H77Q/gzngnNPNQt1XPdwxrWM03+bU="
									"--outfile json:datafile":       "2U14hTEbTCO61YhQ+1PTxJb567Lt4RBV7FEOVaJNV34="
								}
								multi_step: {
									hash:       "PGMNR8TCT9H2GOKJOJN9VEP8GBDMHAQU7C8AS1USA7KD3JD3LOMG===="
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
