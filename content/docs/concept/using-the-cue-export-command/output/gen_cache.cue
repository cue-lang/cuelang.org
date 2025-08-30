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
									"default output":             "q6y6LdE/YDuzrgT3mjg3pV7F4ww0nBzf9xTweCHshtI="
									"stdout yaml":                "N9pzjjpEIV4QHzM/LTsB+r8wz89u3f3tJzFdTcWV09A="
									"yaml:-":                     "rpmT6Ondy60/r9Zo3/eq7INVAivSzwMygaKwtYCjdhY="
									"--out cue":                  "04elD9dysr6chldH2dOahZeUoIvG6CWpphjnVId6Y5E="
									"--out cue no hidden fields": "Rl4ZSwdeKrkhqfePDXcPLPQqOLLdtd+EKGSu+IzeNis="
									"--out cue --package foo":    "8aM153UaWyP1Neg2ai/DWBeRLHII+El2zJ4298yWic4="
									"--escape":                   "V1sctx1HhpmuK5knBMGHsfM4JXiajCcSOD9M84p/BrY="
								}
								upload: {
									"--outfile data.yml":            "/0Oru3baZYz2OsKo1YbA/Iq3iyry756bg4CuT6zSIKQ="
									"--outfile data.txt":            "4mfSQRxLCir902IQU9an3xwOObBqfLTka8WwFZDzz0w="
									"--outfile datafile --out json": "RRqgw8TJNulD2riIO4KLY7276sovNk+pzlNJELU9RPw="
									"--outfile json:datafile":       "oi4zjAcWHsV+gVw8ySWU0/PbsvPF1FWNuhyQd/uhcpI="
								}
								multi_step: {
									hash:       "JJSE1BATTPFMFQMTFSJH2MKPRFA9DK20KA8OAIRQ8FVMH42286MG===="
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
