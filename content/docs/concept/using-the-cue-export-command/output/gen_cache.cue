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
									"default output":             "y3syjRL4L6Lnx8JnHZMxa5IknkJrxysneawH02SgdRU="
									"stdout yaml":                "4IhzaF8nQaJFu/pOFsspRTeFtjZm2oRf3f23m1dOPew="
									"yaml:-":                     "YBQz5wKtODceGXb3LPUHEu/dT3boMQt6xRIO8nG1low="
									"--out cue":                  "pP5VVmSjDKYAMADo1fAaXHh6c3nRH5CZomkr8w5WZZw="
									"--out cue no hidden fields": "B3PoM7/UtIjzZg1vq51Jhabun5tPT2saXd5gyycKA1w="
									"--out cue --package foo":    "bQl/bwWWPAlslCtx/1HURlY3Q/nVXMTNUwOZ5dbUtBs="
									"--escape":                   "GVwjiUdOzXzfCN+AflA2q2QFW0yTvd0/EhnX6fkIMYw="
								}
								upload: {
									"--outfile data.yml":            "COF0SX3/shgHto1iqSGlcuJzFEXxGrAwBCR7+/Idrow="
									"--outfile data.txt":            "L+SolDYRV8s/PXnmVsMBsvKIoG4BJ1PXLoaIJeUE5p0="
									"--outfile datafile --out json": "t6StTroXaBiHvfSOu+UJdsKL1hqahXvIvnYY9N4Qqik="
									"--outfile json:datafile":       "299pmHLVOO0roxfHky5hpXVtD3QdZgTAs32NEPz7q1w="
								}
								multi_step: {
									hash:       "MP41JHR84TOAP85TP5V2S8D62HOFIL4I9ESGJ946206Q4888FKI0===="
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
