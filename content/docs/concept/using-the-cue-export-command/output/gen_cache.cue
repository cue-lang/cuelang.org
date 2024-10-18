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
									"default output":             "V3pNW5hIGxdsxATfHT41hSbhf3RNzAJvDTxoPpLUchE="
									"stdout yaml":                "6/pVInXZz5XdUGkD9smE6vqVuYWUJX5bbRkyxkBLCwQ="
									"yaml:-":                     "SzSPGBd9kCZVUEZOFGS5G7pvOwzeaiXqS9LWO/9qIDQ="
									"--out cue":                  "aZZAG5635E0ku5hgPzn/SItfUXS3BJ7OFE9h7OJ+rWU="
									"--out cue no hidden fields": "jS5NcJFDkMliyfcJJwhChcJCxpAz3mb6GR3bHZBzpvs="
									"--out cue --package foo":    "13n12XaqQrEn7cO2jhN81MF9gRlytafmLMhs3WgY6wg="
									"--escape":                   "nECHbGZb7ZcEsBoJafsclVSgfKKoMUUZ0ZblGOipU7I="
								}
								upload: {
									"--outfile data.yml":            "wCO/nUMXO51xC8qDDrA3cIOo/54M2Wpmhd/vJ+fN4zg="
									"--outfile data.txt":            "IGqgt/BwDNbt57GQUcu5U0a00YUSlk0vCA3lcZ0qXGw="
									"--outfile datafile --out json": "Zp/oz1PYZ9neYhy1fVITUqlyW95tkkZ1tgHzXlzSXYg="
									"--outfile json:datafile":       "0FdXZhIPqMBMAqWks9PZp5uGGl0g4psAUpWGb19nujw="
								}
								multi_step: {
									hash:       "65NPLRJ16K02DOOB6A6H68HRKNQ1LUDUU2GNTHF3O9ET0LGA5N70===="
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
