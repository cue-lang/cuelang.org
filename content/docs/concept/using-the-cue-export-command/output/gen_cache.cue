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
									"default output":             "BBQ4ICjesX4LzIq2mdtBio8adCAuJvAfXi3KLgY9y6M="
									"stdout yaml":                "rkDXkCd+CX7Ul1yj3AWSra7dWr/5LoJtINLzrO/fF7o="
									"yaml:-":                     "8xt5nwajV7BkLBqkIZkh+xxZG0UHhpzqvQE+yLMCKqc="
									"--out cue":                  "mq1S7kDMCSw1Hdft4EAgOujSrtkBld2TCqusG5eteEo="
									"--out cue no hidden fields": "oYH79qFPsAxeOY9mn9+s25mCF3rT84JCX6yr5wc/TZY="
									"--out cue --package foo":    "aR8oF4iiRiBz6QLbMT1bmK6DCGfYyPXv/9EW1sx+0as="
									"--escape":                   "1Y2YTeE9jHYpc5z7Tgq+vrUb28uNFS1qtFoD+Zpv4d0="
								}
								upload: {
									"--outfile data.yml":            "J3sLIwE0e+cCD78TniYIHP0DOVZbC9RpVtdf/KyVv1s="
									"--outfile data.txt":            "/zI6x6dkuZPSyc2CJCnLZIikrXNE+Oxg6eyF2HHnpZQ="
									"--outfile datafile --out json": "YNOGSCuHuiJMalO+p/zQOpmRZpUMe29m9OcojzZ22lk="
									"--outfile json:datafile":       "ao8hslrsyNlmrcrJ/0BXtTuQtT8xCtJfRYK7gvOGfrM="
								}
								multi_step: {
									hash:       "S0K6FOT9EO2VC99FTA0VFCMP5E4V1N45UKP6DNCKPNBDCARTIRC0===="
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
