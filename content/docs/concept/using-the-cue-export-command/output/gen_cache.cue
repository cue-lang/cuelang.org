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
									"default output":             "OQDNbNqu4xbEH9A11qney9Vb1KOV7V0NDs0lWKcIpyE="
									"stdout yaml":                "DHKbDbf3QTr1JgiojHV+foqHeO/p5MlLZ+S3+dV+uWs="
									"yaml:-":                     "EAx14PsM5cCqpq6Ejp7/An5Y5dynLnd7+pzzptesnQ4="
									"--out cue":                  "n9vciN6mzI262IBWh948WA36MDczzyGR8MQaKrlCd4Q="
									"--out cue no hidden fields": "6lJM8QJ13TwZYxOLOZTCQ1IYNVEZC3R3BmKdlWF3+Tc="
									"--out cue --package foo":    "EL/0lL9gVEBjuZPLuzVZrFTDYdo0TxjKKFFKK+ugjKk="
									"--escape":                   "dZec814XRW+E/Bf8cbeHdaTdt9uY8Fikn5BIEiC1Sp8="
								}
								upload: {
									"--outfile data.yml":            "+mdtxr8DWKAQl2UkK+f/sONyiQkiXwUv23pZ8lKGEjM="
									"--outfile data.txt":            "5P3sRdBfjKDiLE+KCsiedmtysYIPeBSGe+E7NE74VWI="
									"--outfile datafile --out json": "c2HOaRR36ykvjzSmgoEIK3vfr0LArwaWhDZj0KKuh7w="
									"--outfile json:datafile":       "7RSHkH1rzNJmoFANsR2rERZt57ckSPUgJG6z8w6ADLE="
								}
								multi_step: {
									hash:       "2E3PHE0LIS3JAMILHB3REG5OIMSEK3EHUML0B496PTDLO6LLOQMG===="
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
