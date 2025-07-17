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
									"default output":             "YMb+YLQS7Ttfk+sJ6XwFpsI7y/+pkyC944SAUQHYWl4="
									"stdout yaml":                "dQgT1AjvCzCx56trftiSDrOJ/RLROIQUGLrqqRE6L04="
									"yaml:-":                     "EQymgAyvE0oEkie035xRiBcHdHHdq7RsWieMcwLVI18="
									"--out cue":                  "giq9fkPh0dw16e9xVsdAw1ZMhyLRrNX9WrDKIbsPBoA="
									"--out cue no hidden fields": "lcsmMdIdX/VRn8KnT1MJKYt8hgIGLuL8hmtHS2pnbcg="
									"--out cue --package foo":    "cqBKlyptkdhiIOBT7545UXTaTanzKxmrjq8kE7e7B84="
									"--escape":                   "rQMHAPvTsKXR+fw6dwZE4/LIpi9A/CO2K3YBzQT4yvA="
								}
								upload: {
									"--outfile data.yml":            "Ypg0stM4jEJWb4p/OBDYx353tJoJwACqstt+TLa5tIs="
									"--outfile data.txt":            "rBa6xihzaCtmeoGyCPqK+STeTTakH+d10rzIKKNivgc="
									"--outfile datafile --out json": "i4rZkuuQYruUu7j+iRw/Ox3JD5dJGkTLJ/IBxxixV1o="
									"--outfile json:datafile":       "z0+8nuN5toJzdBYqe9DB5GuUaDtDqmssuMzZwdSh/HE="
								}
								multi_step: {
									hash:       "MEB5LMC3A6IQC8550MLF2ANPOFGL00PPI1I3SMR1JCPGME26BI20===="
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
